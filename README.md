# Introduction
This project analyzes healthcare claims data to understand key drivers of medical spending and identify areas where an insurance company may be losing money. It focuses on identifying the most expensive claim types, high-cost procedures and diagnoses, and members who contribute the most to total spending.

The goal is to provide clear, data-driven insights that help stakeholders understand where healthcare dollars are going and support better decision-making to improve profitability.

---
# Tools Used

- SQL
- Excel
- Tableau

---

# Dataset Summary

- Total billed amount: $2,039,202
- Total paid amount: $1,531,769
- Number of claims: 440
- Number of members: 100
- Number of providers: 102
- Number of claim types: 5

---

# Analysis
## 1. Claim Type Cost Breakdown
- Inpatient claims: $1,074,056 (70.12% of total spend), average $11K per claim.
- Emergency claims: $294,442 paid, average $3.3K per claim.
- Outpatient claims: $129,054 paid, average $1.2k per claim.
- Lab claims: $23,413 paid, average $308 per claim.
- Pharmacy claims: $10,804 paid, average $146 per claim.

## 2. CPT & ICD Cost Drivers
<img width="1298" height="1302" alt="image" src="https://github.com/user-attachments/assets/057097b4-a7c5-4772-83c2-3133eb9980b0" />
🔹 CPT Code Insights (Procedures):

The top 10 CPT codes account for a significant portion of total paid amounts, indicating that a small number of procedures drive a large share of costs.
CPT code 67890 generated the highest total spending, driven by both relatively high volume and high cost per claim. Some procedures, such as 123 and 99223, show very high average paid per claim, suggesting they are expensive on a per-service basis despite lower claim counts.

🔹 ICD Code Insights (Diagnoses):

The top ICD codes reveal which medical conditions are most expensive for the insurer.
Diagnosis I10 contributes the highest total spending due to a high number of claims.
Codes such as B99.4 and A01.1 have very high average cost per claim, indicating severe or complex cases that require expensive treatments.
Meanwhile, E11.9 has the highest claim count but relatively low average cost, suggesting it represents common but less expensive conditions.


