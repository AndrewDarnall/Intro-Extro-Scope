# 🌐 Controversial Queries at Scale: Analytical Exploration of Web-Scale Datasets with SQL and Cloud Tools

![The Web Under Glass Artwork](./assets/imgs/The-Web-Under-Glass-Artwork.png)

## 📘 Introduction

This project is an applied data analytics and engineering showcase focused on querying and extracting insights from **massive, real-world datasets**. Specifically, the project explores:

- 📡 The **Global Database of Events, Language, and Tone (GDELT)** — a structured global event dataset
- 🌍 The **Common Crawl** — a publicly available web archive comprising petabytes of raw web data

Using a SQL-centric workflow across **both local and cloud-based platforms**, this project demonstrates not only mastery in querying and preprocessing large datasets, but also the ability to address complex and potentially controversial global topics through data.

---

## 💾 Data Sources & Justification

### 🛰️ GDELT Project

- **Source:** [https://www.gdeltproject.org](https://www.gdeltproject.org)
- **Why:** GDELT provides structured, event-based data capturing political, environmental, and social unrest globally. Its temporal and geopolitical granularity makes it ideal for analyzing patterns of conflict, censorship, bias, and media reaction at scale.

### 🕸️ Common Crawl

- **Source:** [https://commoncrawl.org](https://commoncrawl.org)
- **Why:** Common Crawl captures raw web content from billions of pages monthly. It serves as a web-scale lens into public discourse, misinformation trends, social manipulation, and ideological diffusion across languages and borders.

---

## 🖥️ Development Environment: A Deliberate Platform Shift

> “To challenge my comfort zone in Linux, I chose to use **Windows 11** with **PowerShell** as my primary scripting and data manipulation environment.”

While most data engineering pipelines default to *nix-based tools, this project intentionally demonstrates that **mass-scale data acquisition and preprocessing can be achieved natively on Windows** using PowerShell — with no compromise to capability or performance. This includes:

- Automating bulk downloads (~5–10GB) from Common Crawl and GDELT
- Decompressing `.zip` and `.gz` files programmatically
- Merging and preparing datasets for ingestion into SQL-based systems

Scripts were written to be portable and reproducible in `.ps1` format, leveraging `.NET`-based utilities for decompression and file manipulation.

---

## 🧠 Analytical Focus & Potential Points of Inquiry

This project isn't merely about working with big data — it's about **asking hard questions** and revealing **hidden signals** in massive datasets. The analyses conducted (or proposed) include:

### 🔍 1. **Geopolitical Sentiment Shifts**
- Using GDELT tone and actor fields to detect shifts in media portrayal across countries or events
- Examining pre- and post-conflict media tones

### 🧠 2. **Media Framing Bias**
- Comparing how different actors (e.g., state vs. non-state) are framed in global press
- Detecting language-based sentiment skew across regions

### 🛑 3. **Censorship and Redaction Trends**
- Identifying deleted or unavailable links in Common Crawl
- Mapping these against geopolitical hotspots or sensitive periods

### 🤖 4. **Propagation of Misinformation**
- Tracing copy-paste duplication of unverified claims in Common Crawl snapshots
- Analyzing temporal spikes in misinformation-labeled narratives

### 🌍 5. **Sociocultural Topic Modeling**
- Building topic distributions of web content around elections, protests, and global crises
- Identifying emerging topics before they appear in structured datasets like GDELT

> Each analytical direction was chosen for its **practical relevance**, **ethical weight**, and potential to showcase complex data wrangling, querying, and visualization workflows.

---

## ⚙️ Tools & Stack

| Layer           | Technologies Used |
|----------------|--------------------|
| **Ingestion**   | PowerShell, HTTP, Invoke-WebRequest |
| **Storage**     | Local Disk, GCS Buckets |
| **Processing**  | Python (Pandas/Spark), SQL |
| **Querying**    | Google BigQuery, Databricks SQL |
| **Visualization** | Jupyter, Matplotlib, BigQuery Studio |

---

## 📌 Final Notes

This project is meant as a **practical, honest demonstration** of what it takes to wrangle web-scale datasets while asking hard questions in a world full of ambiguity. It leans into **controversy**, but with a lens of **empirical curiosity**, **technical rigor**, and **ethical mindfulness**.

---