# Multicloud Vending Machine Framework (Azure + AWS + GCP)
## Agent Brief dla Antigravity

Cel: zbudować repo “framework” do zakładania Product Space w 3 chmurach, w stylu dużej korporacji:
- Jeden kontrakt (interface) dla użytkownika platformy.
- Implementacje per cloud jako osobne moduły/stacks.
- Guardrails, FinOps, Security, Operacje (runbooks), CI quality gates.
- Jeden referencyjny workload do testów: Docs-as-a-Product (Markdown → HTML) deployowany na Azure/AWS/GCP.

Ważne założenie: nie próbujemy wymusić 1:1 parytetu usług. Robimy parytet CAPABILITIES. Każda chmura ma inne “footguny” i ograniczenia — dokumentujemy różnice zamiast je ukrywać.

---

## 0) Definition of Done (DoD)
Framework uznajemy za “gotowy” gdy:
1. Istnieje kontrakt wejść/wyjść (variables + outputs) wspólny dla Azure/AWS/GCP.
2. Azure ma w pełni działający “golden path” Product Space + referencyjny workload.
3. AWS i GCP mają działające wdrożenie referencyjnego workloadu na minimalnym zestawie capabilities.
4. CI na PR: terraform fmt/validate, tflint, tfsec/trivy/checkov (co najmniej dwa), plan na PR, dokumentacja katalogu generowana z YAML.
5. Są minimum 3 runbooki (DNS/TLS, deploy rollback, drift) i 3 ADR-y (layering, state, multicloud strategy).
6. Jest katalog capability map (YAML + render do MD), oraz sizing (S/M/L) z cost drivers.

---

## 1) Repo i standardy korporacyjne
Utwórz repo:
- `multicloud-vending-machine` (nazwa robocza) albo `azure-platform-iac-benchmark` (jeśli zostajemy przy starej).
Dodaj:
- `.editorconfig`, `.gitignore`, `LICENSE`
- `CODEOWNERS` (nawet symbolicznie)
- `PULL_REQUEST_TEMPLATE.md`
- konwencję nazw i tagów (w docs)

Wymóg: żadnych plików > 500 linii. Jeżeli rośnie: refactor do modułów.

---

## 2) Kontrakt platformy (interface-first)
Zdefiniuj jeden “kontrakt” wejść i wyjść. To jest najważniejszy artefakt frameworku.

### Inputs (wspólne)
- `product_code` (string, krótki identyfikator)
- `environment` (dev/test/prod)
- `size` (small/medium/large)
- `region` / `location`
- `network_mode` (private/public) – domyślnie private, ale docs workload może być public
- `access_mode` (public/corporate-only) – dla statycznej strony
- `features` (observability, secrets, budgets, guardrails)
- `tags/labels` (Owner, CostCenter, DataClass, Environment, Product)

### Outputs (wspólne)
- `workspace_id` / `logging_destination`
- `artifact_registry_endpoint`
- `primary_endpoint` (URL aplikacji)
- `resource_container_id` (Azure RG / AWS account-ish scope / GCP project)
- `network_id` (VNET/VPC)
- `deployment_metadata` (wersja, timestamp)

W repo dodaj plik źródłowy:
- `contract/contract.md` (opis)
- `contract/contract.tf` (definicja obiektu, jeśli używasz terraform 1.3+; inaczej `variables.tf` w każdym module spójne)

DoD dla tego kroku: kontrakt opisany w MD + te same zmienne w 3 modułach (na razie mogą być stub).

---

## 3) Capability Catalog (źródło prawdy) + render do Markdown
Stwórz katalog capabilities w YAML:
- `catalog/services.yml` – capability-first
Wygeneruj:
- `catalog/cloud-equivalents.md`
- `catalog/capabilities.md`
- `catalog/sizing.md` (S/M/L + konsekwencje)

Wymóg: render ma działać w CI (skrypt w `tools/`), brak ręcznych edycji output MD (tylko z YAML).

DoD: YAML + wygenerowane MD + CI job, który waliduje YAML i odpala render.

---

## 4) Warstwowanie (layering) i strategia state
Zrób ADR-y:
- `ADR-0001-layering.md`: foundation vs product-space vs workload
- `ADR-0002-state.md`: remote state, locking, separacja bootstrap
- `ADR-0003-multicloud.md`: capability parity, nie service parity

Decyzja architektoniczna (twarda):
- Nie mieszamy providerów w jednym root module.
- Każda chmura ma osobny stack: `stacks/azure`, `stacks/aws`, `stacks/gcp`.
- Remote state: oddzielny bootstrap per cloud.

DoD: ADR-y gotowe, odwołane w README.

---

## 5) Azure Golden Path: Product Space (realna implementacja)
Zaimplementuj `modules/product-space-azure`:
Minimum capabilities:
- “container” zasobów: Resource Group
- identity: Managed Identity (user-assigned lub system-assigned pattern opisany)
- storage: Storage Account (z poprawnym naming + random suffix + private endpoint opcjonalnie)
- observability: Log Analytics + diagnostyka (co najmniej dla storage i edge)
- guardrails: Azure Policy assignments (tag requirements + region allowlist) lub jeśli za ciężkie: walidacje + CI checks
- budgets: opcjonalnie włączane (feature flag)

Wymóg: naming constraints (storage global uniqueness, lowercase) obsłużone poprawnie.

DoD: `terraform apply` dla Azure dev przechodzi i tworzy zasoby.

---

## 6) Referencyjny workload: Docs-as-a-Product (Markdown → HTML)
Ten workload służy do testowania frameworku w każdej chmurze.

Repo/workload:
- `workloads/docs-site/` (MkDocs albo Docusaurus)
- GitHub Actions:
  - build HTML
  - publish artifact
  - deploy do target cloud (na początku Azure)

Azure deployment (rekomendacja):
- Azure Static Web Apps albo Storage Static Website + Front Door/CDN (wybierz jedno i udokumentuj “dlaczego” w ADR).
- Custom domain + TLS (managed) jako opcja w `prod`.
- Smoke test po deploy: HTTP 200 + wersja w stopce (commit hash).

DoD: po merge do main strona się publikuje na Azure, a pipeline raportuje endpoint.

---

## 7) AWS: minimalna implementacja parity (capability)
Zaimplementuj `modules/product-space-aws` + stack:
Minimum:
- S3 (hosting) + CloudFront (TLS) + Route53 (opcjonalnie)
- CloudWatch (metryki/logi, minimalnie)
- IAM role/policies dla deploy (OIDC w GitHub Actions)

DoD: ten sam workload docs działa na AWS, endpoint działa, pipeline bez stałych kluczy.

---

## 8) GCP: minimalna implementacja parity (capability)
Zaimplementuj `modules/product-space-gcp` + stack:
Minimum:
- Cloud Storage hosting + HTTP(S) Load Balancer + managed cert (albo Firebase Hosting – decyzja w ADR)
- Cloud Logging/Monitoring baseline
- Service Account + Workload Identity Federation dla GitHub Actions

DoD: docs działa na GCP, endpoint działa, pipeline bez stałych kluczy.

---

## 9) Guardrails, Security, FinOps jako “prawdziwe” kontrole
Dodaj:
- Tag/label enforcement:
  - CI check: blokuje brak Owner/CostCenter/DataClass
- Region allowlist:
  - CI check + (gdzie możliwe) policy
- Public exposure rules:
  - jeśli `access_mode=corporate-only`: wymuś IP allowlist / auth proxy pattern (zależnie od chmury)
- FinOps:
  - `sizing.md` + “top cost drivers” (CDN, log retention, egress)
  - budżet/alert przynajmniej w Azure (jeśli czas pozwala: też AWS/GCP)

DoD: PR nie przechodzi bez tagów i bez zgodności z region allowlist.

---

## 10) Operational Excellence: runbooks + drift + rollback
Dostarcz minimum:
- `runbooks/dns-tls.md`: typowe awarie cert/DNS/CDN cache
- `runbooks/drift.md`: jak wykrywać drift, co robimy gdy wykryty
- `runbooks/rollback.md`: jak wrócić do poprzedniej wersji strony

Dodaj job harmonogramu (opcjonalnie):
- nightly `terraform plan` (read-only) i raport jako artifact.

DoD: runbooki gotowe i odwołane w README; pipeline ma smoke test + rollback opisany.

---

## CI/CD (wymagane quality gates)
W `.github/workflows/` dodaj:
1. `terraform-ci.yml`
   - `terraform fmt -check`
   - `terraform validate`
   - `tflint`
   - `tfsec` lub `checkov` (minimum jedno)
2. `plan-ci.yml`
   - `terraform plan` dla stacków (przynajmniej azure/dev)
3. `docs-ci.yml`
   - walidacja `catalog/services.yml`
   - generacja `cloud-equivalents.md` i sprawdzenie “no diff” (wymuś commit wygenerowanych plików)

DoD: PR bez zielonego CI nie jest merge’owalny.

---

## Backlog (10 epików – do GitHub Issues)
E1. Contract & Interface (inputs/outputs)  
E2. Catalog (YAML → MD) + sizing  
E3. Azure product-space v1  
E4. Docs workload build & deploy (Azure)  
E5. AWS parity v1 + deploy  
E6. GCP parity v1 + deploy  
E7. OIDC federation (bez stałych kluczy) dla 3 chmur  
E8. Guardrails (tags, regions, exposure)  
E9. Observability baseline + dashboards (minimum opis + linki)  
E10. Runbooks + drift + rollback + release versioning

Każdy epic ma:
- user story
- acceptance criteria
- link do plików w repo
- test plan (jak potwierdzić)

---

## Zasady pracy Agenta (Antigravity)
1. Zawsze pracuj przez małe PR-y. Każdy PR musi przechodzić CI.
2. Najpierw kontrakt i katalog, potem Azure golden path, dopiero potem AWS/GCP.
3. Nie wprowadzaj “udawanego” parytetu. Jeśli capability w jednej chmurze ma inne właściwości, opisz różnicę w katalogu i ADR.
4. Żadnych stałych kluczy w secrets. Wszędzie OIDC/WIF.
5. Każda nowa funkcja musi mieć:
   - wpis w docs (katalog albo ADR)
   - test/smoke-check lub jasny manual verification step
6. Nazewnictwo i tagowanie traktuj jak wymaganie systemowe, nie “miły dodatek”.

---

## Deliverables końcowe (co ma być w repo)
- Kontrakt platformy (MD + spójne variables w modułach)
- Katalog capabilities (YAML + wygenerowane MD)
- Działający Azure Product Space + docs workload
- Działający AWS i GCP deploy docs workload
- CI gates + smoke tests
- Runbooks + ADR
- README: problem → rozwiązanie → jak używać → co jest “guardrail” → znane ograniczenia

---

## Najczęstsze pułapki (unikaj)
- Jeden root module z trzema providerami (później nie do utrzymania).
- Brak OIDC (klucze w secrets dyskwalifikują “enterprise readiness”).
- Brak kontroli naming constraints (szczególnie storage).
- Udawanie prywatności dla statycznej strony bez jasnego modelu access_mode.
- Brak runbooków (to jest różnica między “kod” a “platforma”).

Koniec dokumentu.