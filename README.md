# Whispers Before Goodbye: A Data Story of Customer

## 📌 Project Overview
Customer churn rarely happens overnight. Before leaving, customers often leave behind subtle signals—frequent support calls, delayed payments, or declining engagement.  
This project explores those hidden signals using data analytics to understand **why customers churn** and how businesses can act early to improve retention.

This case study follows the **Google Data Analytics workflow**:
**Ask → Prepare → Process → Analyze → Share → Act**

---

## 🎯 Business Objective
The goal of this analysis is to:
- Identify the key factors associated with customer churn
- Understand behavioral and demographic patterns preceding churn
- Provide actionable insights to help reduce customer attrition

---

## 🗂️ Dataset Description
- **Records:** 440,000+ customers  
- **Variables:** 12  
- **Data Types:** Demographic, behavioral, service, and payment-related  

### Key Features:
- Age, Gender  
- Tenure, Usage Frequency  
- Support Calls  
- Payment Delay  
- Contract Length, Subscription Type  
- **Target Variable:** `Churn` (1 = Churned, 0 = Retained)

---

## 🛠️ Tools & Technologies
- **R**
- **tidyverse**
- **ggplot2**
- **janitor**
- **Kaggle Notebook**

---

## 🔄 Methodology

### 1️⃣ Ask
Defined the business problem: *Why are customers leaving the service?*

### 2️⃣ Prepare
- Loaded and inspected the dataset
- Verified structure, size, and credibility

### 3️⃣ Process
- Checked for duplicate records (none found)
- Identified and removed a very small number of missing and blank values
- Ensured the dataset was clean and analysis-ready

### 4️⃣ Analyze
Customers were segmented into **churned** and **retained** groups.  
Key variables were analyzed using summary statistics and visualizations.

### 5️⃣ Share
Insights were communicated through clear visual storytelling and concise explanations.

### 6️⃣ Act
Actionable recommendations were proposed based on analytical findings.

---

## 🔍 Key Findings
- **Support Calls** are the strongest indicator of churn  
  Customers who churned contacted support significantly more often.
- **Age** plays a meaningful role  
  Older customers are more likely to churn.
- **Payment Delays** contribute to churn  
  Longer delays are strongly associated with customer attrition.
- **Usage Frequency** has a moderate effect  
- **Gender** shows minimal influence on churn

---

## 🚀 Recommendations
- Proactively flag customers with frequent support calls as high churn risk
- Improve product usability and support experience for older customers
- Reduce billing friction through early reminders and flexible payment options

---

## 📈 Visuals & Storytelling
All insights are supported by visualizations embedded in the Kaggle notebook, including:
- Churn distribution
- Age vs churn
- Support calls vs churn
- Payment delay vs churn
- Usage frequency comparisons

---

## 📁 Repository Structure
