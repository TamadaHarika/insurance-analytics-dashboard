# 📊 Dashboard Features & Usage Guide

## Overview

This project includes 6 professional dashboards built across 3 platforms:
- **2 Power BI Dashboards** (Branch & Policy)
- **2 Tableau Dashboards** (Branch & Policy)
- **2 Excel Dashboards** (Branch & Policy)

---

## POWER BI DASHBOARDS

### File: Branch_Dashboard_Power_BI.pbix

**Purpose:** Real-time branch performance monitoring

**Key Features:**
- 📊 KPI Cards showing Revenue, Targets, Achievement %
- 📈 Trend charts for New, Cross-Sell, Renewal business
- 🎯 Account Executive scorecard
- 📋 Top opportunities drill-down
- 🔄 Interactive filters by Branch, Period, Executive

**Measures Included:**
**How to Use:**
1. Open in Power BI Desktop
2. Use slicers to filter by Branch/Period
3. Click on bars to drill-down
4. Hover over data points for details
5. View full-screen for presentations

**Expected Load Time:** <5 seconds

---

### File: Policy_Dashboard_final.pbix

**Purpose:** Insurance policy analytics and claims tracking

**Key Features:**
- 💰 Total policies, customers, claims overview
- 📅 Age bucket distribution analysis
- 👥 Gender and policy type breakdown
- 📊 Premium growth trends
- ⏰ Policies expiring this year tracking
- 💵 Claims by status analysis
- 🔄 Payment status distribution

**Key Visuals:**
- Policy count by type (pie chart)
- Age bucket distribution (bar chart)
- Premium growth rate (line chart with trend)
- Claims funnel (waterfall chart)
- Payment status breakdown (donut chart)

---

## TABLEAU DASHBOARDS

### File: Branch_DashboardTableau.twbx

**Purpose:** Interactive branch performance visualization

**Advantages:**
- ✅ Sophisticated drill-down capabilities
- ✅ Calculated fields for advanced metrics
- ✅ Parameter-based filtering
- ✅ Professional color scheme
- ✅ Mobile-friendly design

**Key Sheets:**
1. **Overview** - Executive summary
2. **Branch Performance** - Individual branch analysis
3. **Sales Funnel** - Pipeline visualization
4. **Account Executive Analysis** - Team performance

**How to Access:**
- Open .twbx file in Tableau Reader (free)
- Or view in Tableau Public (online)
- Use filters for dynamic exploration

---

### File: Policy_Dashboard_Tableau.twbx

**Purpose:** Policy-level analytics and insights

**Contains:**
- Policy distribution analysis
- Claims trending
- Premium growth analysis
- Customer demographics
- Risk assessment visuals

---

## EXCEL DASHBOARDS

### File: Branch_Dashboard.xlsx

**Purpose:** Quick analysis and reporting

**Advantages:**
- ✅ No software installation needed
- ✅ Easy to modify
- ✅ Familiar interface
- ✅ Print-friendly

**Sheets Included:**
1. **Data** - Raw data (don't modify)
2. **Dashboard** - Main view with KPIs
3. **Executive Summary** - High-level metrics
4. **Drill-Down** - Detail analysis

**Key Features:**
- Pivot tables for flexible analysis
- Conditional formatting for quick insights
- Formulas for automatic updates
- Slicers for interactive filtering

**How to Use:**
1. Open in Excel
2. Use slicers (dropdowns) to filter
3. Pivot tables update automatically
4. Print "Dashboard" sheet for meetings

---

### File: Policy_Dashboard_Excel.xlsx

**Purpose:** Policy analysis in Excel format

**Includes:**
- Policy summary tables
- Claims analysis
- Premium tracking
- Customer segmentation

---

## KPI COMPARISON ACROSS DASHBOARDS

| KPI | Power BI | Tableau | Excel |
|-----|----------|---------|-------|
| Revenue Achievement % | ✅ Card | ✅ KPI | ✅ Cell |
| Meeting Count | ✅ Chart | ✅ Chart | ✅ Table |
| Open Opportunities | ✅ Card | ✅ Visual | ✅ Metric |
| Win Ratio | ✅ Gauge | ✅ Graph | ✅ Formula |
| Invoice Sales | ✅ Card | ✅ Chart | ✅ Sum |

---

## Dashboard Best Practices

### When to Use Each Tool:

**Power BI** → For enterprise dashboards with real-time data refresh  
**Tableau** → For sophisticated analysis and public-facing reports  
**Excel** → For quick analysis and presentations  

### Tips for Best Results:

1. ✅ Always use slicers/filters for context
2. ✅ Start with high-level KPI cards
3. ✅ Drill-down for detailed analysis
4. ✅ Use consistent color schemes
5. ✅ Keep visuals uncluttered
6. ✅ Label all axes clearly
7. ✅ Provide context with annotations

---

## Frequently Asked Questions

**Q: How often do dashboards update?**  
A: Depends on data refresh settings (Real-time to Daily)

**Q: Can I modify the dashboards?**  
A: Yes! Excel is easiest. Power BI requires Desktop version.

**Q: Which dashboard should I present?**  
A: Power BI for polished presentations, Excel for quick meetings

**Q: How do I export data?**  
A: Right-click visual → Export Data (Power BI & Tableau)

---

**For questions about specific dashboards, see the SQL queries used to build them.**