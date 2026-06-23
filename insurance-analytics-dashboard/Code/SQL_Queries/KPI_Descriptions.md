# 📊 SQL KPI Queries Documentation

## Branch Performance Dashboard KPIs

### 1️⃣ Invoice Count by Account Executive

**Purpose:** Measure activity level and workload distribution

**SQL Query:**
```sql
SELECT `Account Executive`, 
       COUNT(invoice_number) AS Count_of_Invoice
FROM Invoice
GROUP BY `Account Executive`
ORDER BY Count_of_Invoice DESC;
```

**What It Shows:** Which executives are processing most invoices  
**Business Value:** Identifies high performers and workload balance  
**Dashboard Use:** Account Executive scorecard

---

### 2️⃣ Yearly Meeting Count

**Purpose:** Track engagement activity over time

**SQL Query:**
```sql
SELECT YEAR(meeting_date) AS Meeting_year, 
       COUNT(global_attendees) As Meeting_Count
FROM meeting
GROUP BY Meeting_year;
```

**What It Shows:** Total meetings conducted per year  
**Business Value:** Measures team engagement & activity  
**Dashboard Use:** Trend analysis chart

---

### 3️⃣ Cross-Sell, Renewal & New Business (Target vs Achieved)

**Purpose:** Compare planned targets with actual achievement

**Shows:**
- Target amount
- Achieved amount
- Gap (New target needed)

**Business Value:** Performance measurement against goals  
**Dashboard Use:** KPI cards and gauge charts

---

### 4️⃣ Stage Funnel by Revenue

**Purpose:** Visualize sales pipeline value distribution

**SQL Query:**
```sql
SELECT stage, SUM(revenue_amount) AS revenue_amount
FROM opportunity
GROUP BY stage;
```

**What It Shows:** Revenue by opportunity stage  
**Stages:** Prospect → Qualified → Proposal → Negotiation → Closed  
**Business Value:** Identifies bottlenecks in sales process  
**Dashboard Use:** Waterfall or funnel chart

---

### 5️⃣ Meeting Count by Account Executive

**Purpose:** Activity metric for each team member

**SQL Query:**
```sql
SELECT `Account Executive`, COUNT(global_attendees) AS Count_Meetings
FROM meeting
GROUP BY `Account Executive`;
```

**What It Shows:** Which executives are most active in meetings  
**Business Value:** Effort measurement and coaching  
**Dashboard Use:** Bar chart showing activity levels

---

### 6️⃣ Top 5 Open Opportunities by Revenue

**Purpose:** Identify high-value deals in pipeline

**SQL Query:**
```sql
SELECT opportunity_name, stage, revenue_amount 
FROM opportunity
WHERE stage IN ("Qualify Opportunity", "Propose Solution")
ORDER BY revenue_amount DESC
LIMIT 5;
```

**What It Shows:** Biggest opportunities still open  
**Business Value:** Guides resource allocation & focus  
**Dashboard Use:** Detailed list view with drill-down

---

### 7️⃣ Total Open Opportunities

**Purpose:** Pipeline size indicator

**Business Value:** Revenue forecast input  
**Dashboard Use:** Large metric card

---

### 8️⃣ Total Closed Opportunities

**Purpose:** Completed deals count

**Business Value:** Sales effectiveness measure  
**Dashboard Use:** KPI comparison

---

### 9️⃣ Conversion Ratio

**Purpose:** Sales effectiveness metric

**SQL Query:**
```sql
SELECT CONCAT(
    ROUND(((SELECT COUNT(stage) FROM opportunity 
            WHERE stage NOT IN ("Qualify Opportunity","Propose Solution"))
           / (SELECT COUNT(stage) FROM opportunity)) * 100, 2), "%"
) AS Conversion_Ratio;
```

**What It Shows:** % of opportunities that close  
**Business Value:** Sales team effectiveness  
**Dashboard Use:** Gauge or KPI card

---

### 🔟 Total Target

**Purpose:** Combined goal amount

**SQL Query:**
```sql
SELECT
    (SELECT SUM(`New Budget`) FROM individual_budget) +
    (SELECT SUM(`Cross sell budget`) FROM individual_budget) +
    (SELECT SUM(`Renewal Budget`) FROM individual_budget) AS TOTAL_TARGET;
```

**Calculation:** Sum of all targets across all categories  
**Business Value:** Overall organizational goal  

---

### 1️⃣1️⃣ Total Revenue

**Purpose:** Aggregate revenue measure

**SQL Query:**
```sql
SELECT
    (SELECT SUM(AMOUNT) FROM BROKERAGE) +
    (SELECT SUM(AMOUNT) FROM FEES) AS Total_Revenue;
```

**What It Shows:** All revenue from brokerage + fees  
**Business Value:** Top-line performance metric  
**Dashboard Use:** Large card or trend chart

---

### 1️⃣2️⃣ Percentage of Achievement

**Purpose:** Overall performance metric

**SQL Query:**
```sql
SELECT CONCAT(
    ROUND(
        ((SELECT SUM(AMOUNT) FROM BROKERAGE) +
         (SELECT SUM(AMOUNT) FROM FEES)) /
        ((SELECT SUM(`New Budget`) FROM individual_budget) +
         (SELECT SUM(`Cross sell budget`) FROM individual_budget) +
         (SELECT SUM(`Renewal Budget`) FROM individual_budget)) * 100, 2),
    "%") AS Percentage_of_Achievement;
```

**Calculation:** (Total Revenue / Total Target) × 100  
**Target:** 100% means on target  
**Business Value:** Organization-wide performance score  

---

## Policy Dashboard KPIs

### 1️⃣ Total Policy Count

**Purpose:** Size of policy portfolio

**SQL Query:**
```sql
SELECT COUNT(DISTINCT `Policy ID`) AS Total_Policy_Count
FROM policy_details;
```

---

### 2️⃣ Total Customers

**Purpose:** Customer base size

**SQL Query:**
```sql
SELECT COUNT(DISTINCT `Customer ID`) AS Total_Customers
FROM customer_information;
```

---

### 3️⃣ Age Bucket Wise Policy Count

**Purpose:** Policy distribution by age

**Shows:** 0-1 year, 1-3 years, 3-5 years, 5+ years

**Business Value:** Retention and aging analysis  

---

### 4️⃣ Gender Wise Policy Count

**Purpose:** Demographics analysis

**Dashboard Use:** Pie or bar chart

---

### 5️⃣ Policy Type Distribution

**Purpose:** Product mix analysis

**Types:** Health, Motor, Home, Life, Travel

---

### 6️⃣ Policies Expiring This Year

**Purpose:** Renewal pipeline tracking

**SQL Query:**
```sql
SELECT YEAR(`Policy End Date`) AS Policy_Expire_in,
       COUNT(DISTINCT `Policy ID`) AS Policy_Count
FROM policy_details
WHERE YEAR(`Policy End Date`) = YEAR(NOW())
GROUP BY YEAR(`Policy End Date`);
```

**Business Value:** Forecasts renewal opportunities  

---

### 7️⃣ Premium Growth Rate

**Purpose:** Year-over-year growth tracking

**Shows:** Premium growth % by year  

**Calculation:** ((Year Premium - Previous Year Premium) / Previous Year Premium) × 100

---

### 8️⃣ Claim Status Distribution

**Purpose:** Claims pipeline visibility

**Status:** Active, Submitted, Approved, Rejected

---

### 9️⃣ Payment Status Distribution

**Purpose:** Payment collection tracking

**Status:** Paid, Pending, Overdue

---

## How to Use These Queries

### In Your Dashboard Tools:

**Power BI:**
1. New Source → SQL Database
2. Paste query
3. Load into data model
4. Create visuals from results

**Tableau:**
1. Data Source → SQL Server/MySQL
2. Paste query
3. Build worksheet from results

**Excel:**
1. Data → New Query
2. Paste SQL query
3. Load results into worksheet
4. Create pivot table

---

**All queries are optimized for performance and tested on the provided datasets.**