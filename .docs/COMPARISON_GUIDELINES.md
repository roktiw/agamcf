# 📊 The Ultimate Comparison Framework (SOP)

This document outlines the standard operating procedure (SOP) and guidelines for creating high-quality, data-driven comparison articles and tables for the `roktiw` blog.

---

## 🎯 Core Philosophy
1.  **User-Centric (Persona-First):** Don't just list specs; explain *who* should use it.
2.  **Visual Speed:** Use emojis, color-coding (Traffic Lights), and clear tables. A user should understand the verdict in < 10 seconds.
3.  **Brutal Honesty:** Call out "licensing traps," hidden costs, or bad performance. No marketing fluff.
4.  **Best-in-Class First:** Sort tables by *quality*, not alphabetically.

---

## 🏗️ Article Structure Template

Every comparison article should follow this structure:

### 1. **Header & Metadata**
   - Clear Title with Emoji (e.g., `🖥️ Remote Desktop Tools...`)
   - "Last Updated" date & "Tools Tested" scope.

### 2. **⚡ TL;DR (30-second version)**
   - Bullet points mapping User Intent → Product.
   - Example: `🎮 Gamer? → Tool A`, `🏢 Office? → Tool B`.

### 3. **🧭 Legend & Scoring System**
   - Explain the "Traffic Light" system:
     - 🟩 **Green:** Excellent / Free / Easy.
     - 🟨 **Yellow:** Good / Affordable / Medium.
     - 🟥 **Red:** Poor / Expensive / Hard.
   - Explain unique emojis used for each product.

### 4. **🧩 The Master Comparison Table**
   - **Row 1:** The "Best" product.
   - **Last Row:** The "Legacy/Worst" product.
   - **Columns:**
     - **Product Identity:** Name + Emoji + Cost + Country/Origin.
     - **Core Specs:** Hard numbers (e.g., Latency ms, CPU cores, Thread count).
     - **Features:** Key capabilities (e.g., 4K support, Waterproofing).
     - **Verdict:** One-sentence summary.

### 5. **🧠 Deep Dive (Product Summaries)**
   - ~3-5 sentences per product.
   - Origin/History (adds credibility).
   - "Real World" usage context.

### 6. **🏆 Recommendations by Persona (The "Tiers")**
   - **Crucial Step:** Group users into specific "Personas" rather than abstract categories.
   - Examples:
     - *🎮 The Gamer* (Focus: Speed)
     - *🏢 The Office Worker* (Focus: Text Clarity)
     - *👨‍💻 The Tech Pro* (Focus: Features/SSH)
     - *🔐 The Privacy Paranoid* (Focus: Self-hosting)
     - *🍎 The Ecosystem User* (Focus: Integration)
   - For each persona, provide: 🥇 Top Choice, 🥈 Alternative, and ❌ Avoid.

### 7. **🗺️ Decision Tree**
   - Create a text-based flowchart using markdown code blocks.
   - Guide the user from "Who are you?" to a specific tool.

### 8. **❓ FAQ & Myths**
   - Address common misconceptions (e.g., "Is expensive always better?").

---

## 🎨 Visual Guidelines

### Emoji Branding System (Mandatory)
Assign a **unique emoji** to each product to function as a visual logo.
- **Rule:** This emoji must be used **every single time** the product is mentioned in the text (Table, Headers, Descriptions, FAQ).
- *Good:* "Choose ⚡ Parsec for speed."
- *Bad:* "Choose Parsec for speed."

### Table Formatting
- **Multi-line Cells:** Use `<br>` to stack info (e.g., Cost above Company).
- **Alignment:** Center icons/checks (`:--:`), left-align text.
- **Color Coding:** Use 🟩/🟨/🟥 directly in cells for instant readability.

---

## 🔬 Research & Scoring Methodology

1.  **Objective Metrics:** Find hard numbers (Latency, Geekbench score, GSM weight).
2.  **Subjective Experience:** Test UI/UX, "feel," and ease of setup.
3.  **Cost Analysis:** Always list the *real* cost (Subscription vs. One-time vs. Hidden fees).
4.  **Privacy/Origin:** Check company headquarters and privacy policy (EU/GDPR vs. others).

---

## 💡 Comparison Backlog (Ideas)

### 💻 Tech & Gadgets
- [ ] **Apple Mac Lineup:** Air vs. Pro vs. Mini (M3/M4 chips). Focus on: Portability vs. Thermal Throttling.
- [ ] **Notebooks (Paper):** Moleskine vs. Leuchtturm1917 vs. Rhodia vs. Field Notes. Focus on: GSM, Fountain pen friendliness, Binding.
- [ ] **E-Readers:** Kindle vs. Kobo vs. Boox. Focus on: Ecosystem lock-in, PDF handling.

### 🚗 Lifestyle & Gear
- [ ] **Running Shoes:** Nike Pegasus vs. Adidas Ultraboost vs. Hoka vs. Brooks. Focus on: Drop (mm), Cushioning, Durability (km).
- [ ] **Mattress Types:** Memory Foam vs. Hybrid vs. Latex vs. Spring. Focus on: Heat retention, Back support, Motion transfer.
- [ ] **Car Segments:** SUV vs. Station Wagon vs. Sedan. Focus on: Practical cargo space vs. Fuel economy.
- [ ] **Fabrics:** Cotton vs. Merino Wool vs. Polyester vs. Linen. Focus on: Breathability, Odor resistance, Durability.

### 🛠️ Developer Tools
- [ ] **Code Editors:** VS Code vs. JetBrains vs. Neovim vs. Zed. Focus on: Speed vs. Features.
- [ ] **Cloud Providers:** AWS vs. GCP vs. Azure vs. DigitalOcean vs. Hetzner. Focus on: Hidden costs, UI complexity.

