install.packages("tidyverse")
install.packages("lubridate")
install.packages("janitor")


library(tidyverse)
library(lubridate)
library(janitor)
library(ggplot2)

churn_data <- read.csv("D:/Course/Data Analysis/Case Study/Customer Churn Dataset/db/customer_churn_dataset-training-master.csv")

View(churn_data)
str(churn_data)
#check duplicate data
sum(duplicated(churn_data))
#check NA data
colSums(is.na(churn_data))
#check blank data
churn_data %>%
  summarise(across(where(is.character), ~ sum(. == "")))

#convert blank cell into NA
churn_data[churn_data == ""] <- NA
#now remove the NA field
churn_data <- na.omit(churn_data)

#Now check all duplicate again
colSums(is.na(churn_data))
sum(duplicated(churn_data))

View(churn_data)
churn_data %>%
  count(Churn)
churned_customer<- churn_data %>% 
  filter(Churn==1)
# Retained customer group
retained_customers <- churn_data %>% filter(Churn == 0)
View(churned_customer)
View(retained_customers)
#Nearly half of the customer base has churned, indicating a significant retention challenge.
ggplot(churn_data, aes(x = factor(Churn))) +
  geom_bar(fill = "#E57373") +
  scale_x_discrete(labels = c("0" = "Retained", "1" = "Churned")) +
  labs(
    title = "Customer Churn Overview",
    x = "Customer Status",
    y = "Number of Customers"
  )


#First off all I check the gender.
churned_customer %>%
  count(Gender) %>%
  mutate(percentage = round(n / sum(n) * 100, 2))

retained_customers %>% 
  count(Gender) %>% 
  mutate(percentage =round(n / sum(n) * 100, 2))


# Churned customers tenure summary
churned_customer %>%
  summarise(
    mean_tenure = mean(Tenure),
    median_tenure = median(Tenure)
  )

# Retained customers tenure summary
retained_customers %>%
  summarise(
    mean_tenure = mean(Tenure),
    median_tenure = median(Tenure)
  )


# Churned customers age
churned_customer %>%
  summarise(
    mean_age = mean(Age),
    median_age = median(Age)
  )

# Retained customers age
retained_customers %>%
  summarise(
    mean_age = mean(Age),
    median_age = median(Age)
  )

#Churned customers tend to be older than retained customers.
ggplot(churn_data, aes(x = factor(Churn), y = Age)) +
  geom_boxplot(fill = "#64B5F6") +
  scale_x_discrete(labels = c("0" = "Retained", "1" = "Churned")) +
  labs(
    title = "Age Distribution by Customer Status",
    x = "Customer Status",
    y = "Age"
  )

#Behavior analyze
# Churned customers usage
churned_customer %>%
  summarise(
    mean_usage = mean(Usage.Frequency),
    median_usage = median(Usage.Frequency)
  )

# Retained customers usage
retained_customers %>%
  summarise(
    mean_usage = mean(Usage.Frequency),
    median_usage = median(Usage.Frequency)
  )
# Retained customers demonstrate slightly higher engagement levels.
ggplot(churn_data, aes(x = factor(Churn), y = Usage.Frequency)) +
  geom_boxplot(fill = "#BA68C8") +
  scale_x_discrete(labels = c("0" = "Retained", "1" = "Churned")) +
  labs(
    title = "Usage Frequency by Customer Status",
    x = "Customer Status",
    y = "Usage Frequency"
  )


# Churned customers support calls
churned_customer %>%
  summarise(
    mean_support_calls = mean(Support.Calls),
    median_support_calls = median(Support.Calls)
  )

# Retained customers support calls
retained_customers %>%
  summarise(
    mean_support_calls = mean(Support.Calls),
    median_support_calls = median(Support.Calls)
  )
#Customers who churn contacted support far more frequently, highlighting unresolved issues as a key churn driver.
ggplot(churn_data, aes(x = factor(Churn), y = Support.Calls)) +
  geom_boxplot(fill = "#FFB74D") +
  scale_x_discrete(labels = c("0" = "Retained", "1" = "Churned")) +
  labs(
    title = "Support Call Frequency by Customer Status",
    x = "Customer Status",
    y = "Number of Support Calls"
  )


# Churned customers payment delay
churned_customer %>%
  summarise(
    mean_payment_delay = mean(Payment.Delay),
    median_payment_delay = median(Payment.Delay)
  )

# Retained customers payment delay
retained_customers %>%
  summarise(
    mean_payment_delay = mean(Payment.Delay),
    median_payment_delay = median(Payment.Delay)
  )
#Longer payment delays are strongly associated with customer churn.
ggplot(churn_data, aes(x = factor(Churn), y = Payment.Delay)) +
  geom_boxplot(fill = "#81C784") +
  scale_x_discrete(labels = c("0" = "Retained", "1" = "Churned")) +
  labs(
    title = "Payment Delay by Customer Status",
    x = "Customer Status",
    y = "Payment Delay (Days)"
  )


