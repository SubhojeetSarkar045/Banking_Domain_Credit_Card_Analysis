# 💳 Mitron Bank – Credit Card Strategy Analysis (Power BI + SQL + DAX)

### 📊 End-to-End Data Analytics Project | Banking Domain | Credit Card Product Strategy  

---

## 🧩 Project Overview

**Context**  
Mitron Bank is a legacy financial institution headquartered in Hyderabad and wants to introduce a **new line of credit cards** to expand its product portfolio and grow revenue.

Before launching, the bank needs to understand:

- Which **customer segments** are most suitable for credit cards  
- How these customers **earn, spend, and pay**  
- What kind of **card features & rewards** will drive adoption and usage  

**Goal**  
Build a **data-driven Power BI dashboard** (with SQL-backed analysis) to:

- Analyse **spending behaviour & income utilisation** of 4,000 customers across 5 cities  
- Identify **high-value customer segments** (by age, city, occupation, gender, marital status)  
- Understand **payment method mix** (Credit Card vs UPI vs Debit vs Net Banking)  
- Recommend **segment-specific credit card products & features** to drive growth  

---

## 🧠 Problem Statement

> “Which customer segments should Mitron Bank target for its new credit card line, and what product features will best match their income, spending behaviour, and payment preferences?”

Key business questions:

1. What is the **overall income utilisation %** and spending capacity of customers?
2. Which **age, city, occupation and marital segments** contribute most to spending?
3. Which **spend categories** (Bills, Groceries, Electronics, Health, etc.) dominate customer wallets?
4. How is spend distributed across **payment methods** (Credit Card, UPI, Debit Card, Net Banking)?
5. Which **customer segments** are ideal for **new credit card products**, and what features should those cards offer?

---

## 📂 Dataset & Source

Dataset inspired by **Codebasics Resume Challenge #11 – Banking Domain (Mitron Bank Credit Card Strategy)**.

### Files Used

| File               | Description                                               |
|--------------------|-----------------------------------------------------------|
| `dim_customers.csv`| Customer demographics (age, gender, city, occupation, income, marital status) |
| `fact_spends.csv`  | Transaction-level spending data (month, category, payment type, spend amount) |
| `dim_month.csv`    | Month dimension (month number, month name, ordering)     |

> Note: All data is **mock data** provided for learning purposes via Codebasics.

---

## 🛠 Tools & Technologies

| Tool / Tech        | Purpose                                                   |
|--------------------|-----------------------------------------------------------|
| **Power BI**       | Data cleaning (Power Query), data modeling, DAX, dashboarding |
| **MySQL**          | SQL-based exploration, KPI validation, segment analysis   |
| **Power Query**    | ETL on CSV files, derived columns (age groups, categories) |
| **DAX**            | Measures for income utilisation %, segment KPIs, spend share |
| **Excel**          | Quick sanity checks & profiling                           |
| **GitHub**         | Version control & portfolio documentation                 |

---

## 🏗 Data Modeling

The project uses a **Star Schema** for clean, performant analytics.

### Fact & Dimension Tables

- **Fact Table**
  - `fact_spends` → customer spend transactions (month, category, payment type, spend)

- **Dimension Tables**
  - `dim_customers` → customer profile (age_group, gender, city, occupation, avg_income, marital status)
  - `dim_month` → month details (month_no, month_name)

### Key Relationships

- `dim_customers[customer_id]` ↔ `fact_spends[customer_id]`  
- `dim_month[month_name]` ↔ `fact_spends[month_name]`

### Derived Features (Power Query / DAX)

- `Age_Group` → (e.g., 18–24, 25–34, 35–45, 46–60, 60+)  
- `Income_Bracket` → Low / Medium / High  
- `Spend_Category_Group` → grouped categories when needed  
- Income Utilisation % measures at **customer & segment level**

> This design allows slicing spend & utilisation by any customer attribute or time period.

### 🔗 Data Model View (Screenshot)

![image alt](https://github.com/SubhojeetSarkar045/Banking_Domain_Credit_Card_Analysis/blob/2ac8b7ebba5dc58b92f8416bf884242af0eb975f/powerbi/screenshot/Model%20View.png)

---

## 📐 Key Metrics (DAX Measures)

Some of the main DAX measures used:

### Core KPIs

- **Total Customers**  
  `= DISTINCTCOUNT(dim_customers[customer_id])`

- **Total Spend**  
  `= SUM(fact_spends[spend_amount])`

- **Avg Spend per Customer**  
  `= [Total Spend] / [Total Customers]`

- **Avg Income**  
  `= AVERAGE(dim_customers[avg_income])`

- **Total Income**  
  `= SUM(dim_customers[avg_income])`

- **Income Utilisation % (Overall)**  
  `= DIVIDE([Total Spend], [Total Income])`

### Segment KPIs

- Income Utilisation % by:
  - Age Group  
  - City  
  - Occupation  
  - Gender  
  - Marital Status  
  - Income Bracket  

- Spend share %:
  - By Category  
  - By Payment Type  
  - By City  

These measures power the dashboard to identify **top-spending & high-utilisation segments**.

---

## 🧪 SQL Component (MySQL)

The `/sql` folder (in this repo) contains SQL scripts for:

- **Data Quality & Sanity Checks**
  - Row counts, null checks, min/max ranges
- **Core KPIs**
  - Total customers, total spend, avg spend, income utilisation %
- **Segment Analysis**
  - Spend & utilisation by city, age_group, occupation, gender, marital_status
- **Payment Behaviour**
  - Spend by payment_type, spend by category, monthly trends
- **Target Segment Identification**
  - High-value segments ranked by utilisation & total spend
- **Credit Card Penetration (optional extension)**
  - Customers who use Credit Card vs not, by segment (if payment_type data supports it)

> SQL was used both for **business exploration** and for **validating** DAX measures in Power BI.

---

## 📊 Power BI Dashboard Overview

The dashboard is structured into **two main pages**:

### 1️⃣ Executive Overview – Customer & Segment Profile

- KPI cards:
  - Total Customers  
  - Total Spend (6 months)  
  - Avg Income Utilisation %  
- Demographic visuals:
  - Customers by Age Group, City, Gender, Marital Status, Occupation  
- Segment performance:
  - Income Utilisation % by Age Group  
  - Income Utilisation % by Occupation & City  
- High-Value Segments Table:
  - Segment (Age + City + Occupation)
  - Customer Count
  - Total Spend
  - Income Utilisation %

### 2️⃣ Spend & Payment Behaviour

- Spend by Category (Bills, Groceries, Electronics, Health, etc.)
- Spend by Payment Type (Credit Card, UPI, Debit Card, Net Banking)
- Monthly Spend Trends & Seasonality (e.g., September peak)
- Category preference splits by Age Group / City

📌 Slicers allow dynamic filtering by: City, Age Group, Gender, Occupation, and Marital Status.

> Each page is designed for **top management & product teams** – minimal clutter, clear labeling, and action-oriented visuals.

---

## 🖼 Dashboard Preview (Placeholders)

### Key Customers Insights Page

![Executive Overview](https://github.com/SubhojeetSarkar045/Banking_Domain_Credit_Card_Analysis/blob/2ac8b7ebba5dc58b92f8416bf884242af0eb975f/powerbi/screenshot/Key%20Customers%20Insights.png)

### Spend & Payment Behaviour Page

![Spend Insights](https://github.com/SubhojeetSarkar045/Banking_Domain_Credit_Card_Analysis/blob/2ac8b7ebba5dc58b92f8416bf884242af0eb975f/powerbi/screenshot/Overall%20Spend%20Insights.png)

### Customer Segmentation Page

![Customer Segmentation](https://github.com/SubhojeetSarkar045/Banking_Domain_Credit_Card_Analysis/blob/2ac8b7ebba5dc58b92f8416bf884242af0eb975f/powerbi/screenshot/Customer%20Segmentation.png)

### Credit Card Feature Recomendation Page

![CC Feature Recomendation](https://github.com/SubhojeetSarkar045/Banking_Domain_Credit_Card_Analysis/blob/2ac8b7ebba5dc58b92f8416bf884242af0eb975f/powerbi/screenshot/Credit%20Card%20Feature%20Recomendation.png)

### Decomposition Tree Page

![Decomposition Tree](https://github.com/SubhojeetSarkar045/Banking_Domain_Credit_Card_Analysis/blob/2ac8b7ebba5dc58b92f8416bf884242af0eb975f/powerbi/screenshot/Decomposition%20Tree.png)

---

## 🔍 Key Business Insights

### 1️⃣ Customer & Segment Insights

| Area             | Key Findings                                                                 |
|------------------|-------------------------------------------------------------------------------|
| **Total Base**   | 4,000 customers across 5 major Indian cities                                |
| **Age**          | Age **25–45** accounts for majority of spend & high income utilisation       |
| **City**         | **Mumbai** leads in income, total spend & utilisation (~51.4%)               |
| **Occupation**   | **Salaried IT Employees** have the highest spend & utilisation (~51%)        |
| **Marital Status** | ~78% **Married** customers, forming the core revenue-driving group        |

> **Core Persona:** Urban, Married, Salaried IT professional (25–45 yrs), living in Tier-1 cities.

---

### 2️⃣ Income Utilisation & Affordability

| Metric                      | Value (Approx.)        | Insight                                                |
|-----------------------------|------------------------|--------------------------------------------------------|
| Avg Income Utilisation      | ~42.9%                 | Strong ability & willingness to spend                  |
| Mumbai Utilisation          | ~51.4%                 | Best city to pilot new credit card products            |
| Salaried IT Utilisation     | ~51%                   | Ideal candidate segment for premium & digital cards    |
| Singles vs Married          | Singles slightly higher | Singles show strong lifestyle & discretionary spending |

> High utilisation % hints at **good fit for responsible credit card usage**.

---

### 3️⃣ Spend Category & Payment Behaviour

- **Top categories:**  
  - Bills, Groceries, Electronics, Health & Wellness  
  - These collectively account for **50%+ of total spending**

- **Payment mix:**
  - **Credit Cards** already account for the highest individual payment share
  - However, **UPI & Debit Cards** still capture a large portion of spend

- **Seasonality:**
  - **September** emerges as a high-spend month (festive & shopping season)

> There is a clear opportunity to **shift UPI/Debit spends to Credit Card** usage via rewards & benefits.

---

## 💡 Strategic Recommendations (Credit Card Product Strategy)

### 1️⃣ Launch Segment-Specific Cards

| Card Type             | Target Segment                                        | Key Features                                              |
|-----------------------|------------------------------------------------------|-----------------------------------------------------------|
| **Urban Rewards Card**| Young salaried professionals (25–34, urban)          | Cashback on Bills, Groceries, Online Shopping & Dining   |
| **Family Premium Card** | Married customers (35–45, family-focused)         | Health, Education, Utility Bill offers & Family Add-ons  |
| **Business Flexi Card** | Business Owners / Self-Employed                   | Travel & Electronics benefits, Flexible Credit & EMI     |

---

### 2️⃣ Drive Adoption & Usage

- Offer **reward multipliers** for switching recurring spends (bills, subscriptions) from UPI/Debit to Credit Card  
- Provide **festive season offers** (Aug–Oct) aligned with peak spending  
- Promote **contactless & UPI-linked credit card** features for seamless usage  
- Integrate **spend tracking, budgets & alerts** into the banking app

---

### 3️⃣ Risk & Customer Experience

- Use income utilisation % and income bracket to **screen for risk-appropriate credit limits**  
- Provide **transparent statements, EMI conversion**, and **security features**:
  - Real-time fraud alerts  
  - Virtual card options  
  - Temporary card lock/unlock  

---

## 🎯 Project Outcomes

- Identified **high-value customer segments** for Mitron Bank’s new credit card line
- Defined **data-backed product concepts** (Urban Rewards, Family Premium, Business Flexi)
- Showed how **spend categories & payment mix** inform card feature design
- Demonstrated real-world application of **Power BI + SQL** to support **product strategy** in banking

---

## 🎥 Demo Video

- 🎬 **Dashboard Walkthrough**  
  *[[Dashboard Screenrecording](https://github.com/SubhojeetSarkar045/Banking_Domain_Credit_Card_Analysis/blob/2ac8b7ebba5dc58b92f8416bf884242af0eb975f/video/Mitron%20Bank%20%E2%80%93%20Credit%20Card%20Strategy%20Analysis%20(Dashboard%20Screen%20Recording).mp4)]*

- 🎥 **Full Case Study Presentation**  
  *[YouTube or Drive link placeholder]*

---

## 🧠 Key Learnings

- Designing **star schema models** for customer & transaction analytics  
- Writing **DAX measures** for financial KPIs (spend, utilisation, segment performance)  
- Using **SQL** to validate and support BI analysis  
- Translating raw data into **clear product & marketing strategy recommendations**  
- Storytelling with dashboards for **non-technical stakeholders** (product & strategy teams)

---

## 👨‍💻 Author

**Subhojeet Sarkar**  
B.Com (Hons) → Data Analyst

**Skills:** Power BI • SQL • Excel • DAX • Data Storytelling  

- LinkedIn: *([Subhojeet Sarkar](https://www.linkedin.com/in/itssubhojeetsarkar/))*  

---

## ⭐ License
This project is for learning & portfolio usage only.  
All data used is **mock/synthetic data** inspired by the **Codebasics Resume Project Challenge 11 (Banking Domain)** and does not represent real customers or any real bank.

---

> _“Analytics shouldn’t just describe customers, it should help design better products for them.”_  

