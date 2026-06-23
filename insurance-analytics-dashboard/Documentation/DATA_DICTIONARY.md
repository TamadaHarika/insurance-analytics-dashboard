# 📊 Data Dictionary - Insurance Analytics Dashboard

## Overview
This document describes all 7 datasets used in the Insurance Analytics Dashboard project.

---

## 1. BROKERAGE DATA
**File:** Brokerage_files_.xlsx  
**Purpose:** Policy information and transaction records  
**Records:** ~5,000+ policies  
**Update Frequency:** Real-time

### Key Columns:
| Column | Data Type | Description |
|--------|-----------|-------------|
| Policy Number | Text | Unique policy identifier |
| Client Name | Text | Customer name |
| Branch Name | Text | Issuing branch |
| Account Executive | Text | Sales person assigned |
| Amount | Currency | Policy premium/amount |
| Income Class | Category | New / Cross-Sell / Renewal |
| Product Group | Category | Insurance product type |
| Policy Status | Category | Active / Inactive / Expired |
| Policy Start Date | Date | When policy began |
| Policy End Date | Date | When policy expires |

### Business Value:
- ✅ Core policy tracking
- ✅ Revenue by branch & executive
- ✅ Premium analysis
- ✅ Customer acquisition tracking

---

## 2. FEES DATA
**File:** fees.xlsx  
**Purpose:** Commission and fee tracking  
**Records:** ~3,000+ transactions  
**Update Frequency:** Monthly

### Key Columns:
| Column | Data Type | Description |
|--------|-----------|-------------|
| Fee ID | Text | Unique fee identifier |
| Client Name | Text | Associated client |
| Branch Name | Text | Processing branch |
| Account Executive | Text | Fee recipient |
| Amount | Currency | Fee amount |
| Fee Type | Category | Brokerage / Commission / Service |
| Income Class | Category | Associated revenue type |
| Date | Date | Transaction date |

### Business Value:
- ✅ Revenue tracking beyond premiums
- ✅ Executive compensation analysis
- ✅ Profitability measurement
- ✅ Branch performance metrics

---

## 3. INDIVIDUAL BUDGETS
**File:** Individual_Budgets.xlsx  
**Purpose:** Account executive targets and quotas  
**Records:** ~100+ executives  
**Update Frequency:** Quarterly

### Key Columns:
| Column | Data Type | Description |
|--------|-----------|-------------|
| Account Executive | Text | Employee name |
| Branch | Text | Home branch |
| New Budget | Currency | New business target |
| Cross Sell Budget | Currency | Cross-sell target |
| Renewal Budget | Currency | Renewal target |
| Quarter | Category | Q1 / Q2 / Q3 / Q4 |
| Year | Number | Fiscal year |

### Business Value:
- ✅ Target vs Achievement comparison
- ✅ Performance management
- ✅ Incentive calculation
- ✅ Resource planning

---

## 4. INVOICE DATA
**File:** Copy_of_invoice_.xlsx  
**Purpose:** Billing and revenue transactions  
**Records:** ~2,000+ invoices  
**Update Frequency:** Real-time

### Key Columns:
| Column | Data Type | Description |
|--------|-----------|-------------|
| Invoice Number | Text | Unique invoice ID |
| Invoice Date | Date | When issued |
| Client Name | Text | Billed customer |
| Branch | Text | Issuing branch |
| Account Executive | Text | Assigned executive |
| Amount | Currency | Invoice total |
| Status | Category | Paid / Pending / Overdue |
| Due Date | Date | Payment deadline |

### Business Value:
- ✅ Cash flow tracking
- ✅ Revenue recognition
- ✅ Collection management
- ✅ Financial reporting

---

## 5. MEETING DATA
**File:** meeting.xlsx  
**Purpose:** Customer engagement and activity tracking  
**Records:** ~1,500+ meetings  
**Update Frequency:** Real-time

### Key Columns:
| Column | Data Type | Description |
|--------|-----------|-------------|
| Meeting ID | Text | Unique meeting reference |
| Account Executive | Text | Meeting conductor |
| Branch Name | Text | Host branch |
| Meeting Date | Date | When meeting occurred |
| Client Name | Text | Attendee/customer |
| Global Attendees | Number | Number of participants |
| Meeting Outcome | Category | Success / No-show / Follow-up |
| Next Steps | Text | Action items |

### Business Value:
- ✅ Activity measurement
- ✅ Engagement tracking
- ✅ Conversion analysis
- ✅ Pipeline management

---

## 6. OPPORTUNITY DATA
**File:** Opportunity.xlsx  
**Purpose:** Sales pipeline and deal tracking  
**Records:** ~500+ opportunities  
**Update Frequency:** Real-time

### Key Columns:
| Column | Data Type | Description |
|--------|-----------|-------------|
| Opportunity ID | Text | Unique deal identifier |
| Opportunity Name | Text | Deal description |
| Account Executive | Text | Assigned sales person |
| Branch | Text | Home branch |
| Stage | Category | Prospect / Qualified / Proposal / Negotiation / Closed |
| Revenue Amount | Currency | Deal value |
| Probability | Percent | Win likelihood |
| Expected Close Date | Date | Projected closing |
| Actual Close Date | Date | Actual closing date |
| Status | Category | Won / Lost / Open |
| Product Group | Category | Product/service type |

### Business Value:
- ✅ Pipeline forecasting
- ✅ Deal tracking
- ✅ Sales effectiveness metrics
- ✅ Revenue projection
- ✅ Win/loss analysis

---

## 7. POLICY DATA
**File:** Policy_Data.xlsx  
**Purpose:** Policy details and customer information  
**Records:** ~5,000+ records  
**Update Frequency:** Real-time

### Key Columns:
| Column | Data Type | Description |
|--------|-----------|-------------|
| Policy ID | Text | Unique policy identifier |
| Customer ID | Text | Associated customer |
| Customer Name | Text | Policy holder |
| Policy Type | Category | Health / Motor / Home / Life / Travel |
| Premium Amount | Currency | Annual premium |
| Policy Start Date | Date | Coverage start |
| Policy End Date | Date | Coverage expiration |
| Claim Status | Category | Active / Submitted / Approved / Rejected |
| Payment Status | Category | Paid / Pending / Overdue |
| Claim Amount | Currency | Claim value |
| Gender | Category | Customer gender |
| Age | Number | Customer age |
| Risk Details | Text | Policy risk factors |

### Business Value:
- ✅ Risk analysis
- ✅ Claims management
- ✅ Premium optimization
- ✅ Customer demographics
- ✅ Policy retention analysis

---

## Data Relationships
---

## Data Quality Standards

✅ **Validation Rules:**
- All dates are valid and in YYYY-MM-DD format
- Currency values are positive numbers
- All required fields are populated
- No duplicate records (verified)
- Foreign keys properly referenced

✅ **Cleaning Steps Performed:**
- Removed duplicate entries
- Standardized date formats
- Cleaned text fields (removed extra spaces)
- Handled missing values
- Validated numerical ranges

---

## KPI Calculations from Data

These 7 datasets power the following KPIs:

### Financial KPIs
- **Total Revenue** = SUM(Brokerage.Amount) + SUM(Fees.Amount)
- **Total Target** = SUM(Individual_Budgets.New + Cross-Sell + Renewal)
- **Achievement %** = (Total Revenue / Total Target) × 100

### Sales KPIs
- **New Business** = SUM(where Income_Class = "New")
- **Cross-Sell** = SUM(where Income_Class = "Cross-Sell")
- **Renewal** = SUM(where Income_Class = "Renewal")

### Activity KPIs
- **Meeting Count** = COUNT(Meeting.Meeting_ID)
- **Invoice Count** = COUNT(Invoice.Invoice_Number)
- **Opportunity Count** = COUNT(Opportunity.Opportunity_ID)

### Pipeline KPIs
- **Open Opportunities** = COUNT(where Stage IN ("Proposal", "Negotiation"))
- **Closed Opportunities** = COUNT(where Stage = "Closed")
- **Conversion Ratio** = (Closed / Total) × 100

---

## How to Use This Data Dictionary

1. **For Dashboard Building:** Reference column names and relationships
2. **For SQL Queries:** Use exact column names as listed
3. **For Data Validation:** Check data types and formats
4. **For Analysis:** Understand business meaning of each field
5. **For Documentation:** Explain data sources to stakeholders

---

**Last Updated:** June 2026  
**Data Refresh:** Real-time to Monthly (varies by dataset)