# The Effect of Rejection Friction on Repeated Cookie Consent Decisions 

> **Demo / Survey Site:** [https://cookie-cookie1.netlify.app]
> 
> **Paper:** [paper/main.pdf](paper/main.pdf)
 ---

## 📌 Abstract
Cookie consent banners repeatedly appear across websites, requiring users to make frequent privacy-related decisions. Prior work has shown that interaction costs can influence cookie consent choices, but less is known about how such effects change across repeated consent decisions. This study investigates how rejection friction affects users’ privacy choices when cookie consent requests are repeatedly presented. In a between-subjects experiment, 20 participants were randomly assigned to either an Easy Reject condition, in which a “Reject All” button was immediately available, or a Hard Reject condition, in which rejection required navigating through cookie settings. Participants made cookie-related decisions on 12 fictitious websites. Although rejection rates were similar between the two conditions during the initial trials, the rate of “Reject All” selections decreased in the Hard Reject condition as the experiment progressed. A significant interaction was observed between condition and exposure order. These findings suggest that rejection friction may exert a stronger influence over repeated consent decisions and highlight the importance of making privacy-protective options readily accessible in cookie consent interfaces.

**Index Terms—cookie consent, privacy, rejection friction, repeated decisions, user interface**


---


## 🛠 Project Architecture & Workflow

1. **Survey/Experiment Site**: A React/Next.js-based web application configured for interactive experiments and deployed via **Netlify**.
2. **Data Collection**: Real-time storage of user interactions—such as the number of times the cookie banner is rejected, time spent on the site, and final selection behavior—in a **Supabase (PostgreSQL)** database.
3. **Data Analysis**: Generate results based on anonymized collected data.

---

##  📊 Data Description
Description of the data contained in the repository's `data/` directory:

- `trials_rows.csv`: Click logs, reaction times by stage, and final selection records for experiment participants
- `참여자.xlsx`: Summary of participant demographics (anonymized)

---

## 📂 Repository Structure
- `web/`: Source code for the survey website deployed on Netlify
- `data/`: Dataset exported from Supabase
- `paper/`: PDF file of the paper

---
