select * from Bank_loan_data

select COUNT(id) as Total_Loan_Applications from Bank_loan_data

select COUNT(id) as MTD_Loan_Applications from Bank_loan_data
where MONTH(issue_date) = 12 and YEAR(issue_date)= 2021
select COUNT(id) as PMTD_Loan_Applications from Bank_loan_data
where MONTH(issue_date) = 11 and YEAR(issue_date)= 2021

select sum(loan_amount) as total_Funded_Amount from Bank_loan_data

select sum(loan_amount) as MTD_total_Funded_Amount from Bank_loan_data
where MONTH(issue_date)=12 and YEAR(issue_date)=2021
select sum(loan_amount) as PMTD_total_Funded_Amount from Bank_loan_data
where MONTH(issue_date)=11 and YEAR(issue_date)=2021

select sum(total_payment) as Total_amount_received from Bank_loan_data

select sum(total_payment) as MTD_Total_amount_received from Bank_loan_data
where MONTH(issue_date)=12 and YEAR(issue_date)=2021
select sum(total_payment) as PMTD_Total_amount_received from Bank_loan_data
where MONTH(issue_date)=11 and YEAR(issue_date)=2021

select round(avg(int_rate),4)*100 as Avg_interest_rate from Bank_loan_data

select round(avg(int_rate),4)*100 as MTD_Avg_interest_rate from Bank_loan_data
where MONTH(issue_date)=12 and YEAR(issue_date)=2021
select round(avg(int_rate),4)*100 as PMTD_Avg_interest_rate from Bank_loan_data
where MONTH(issue_date)=11 and YEAR(issue_date)=2021

select round(avg(dti),4)*100 as Avg_DTI from Bank_loan_data
where MONTH(issue_date)=12 and YEAR(issue_date)=2021
select round(avg(dti),4)*100 as Avg_DTI from Bank_loan_data
where MONTH(issue_date)=11 and YEAR(issue_date)=2021

select loan_status from Bank_loan_data

select
	(COUNT(case when loan_status = 'Fully Paid' or loan_status = 'Current' then id end)*100)
	/
	count(id) as Good_loan_percentage
from bank_loan_data


select count(id) as Good_loan_applications from Bank_loan_data
where loan_status = 'Fully Paid' or loan_status = 'Fully Paid'

select sum(loan_amount) as Good_loan_Funded_amount from Bank_loan_data
where loan_status = 'Fully Paid' or loan_status = 'Fully Paid'

select sum(total_payment) as Good_loan_received from Bank_loan_data
where loan_status = 'Fully Paid' or loan_status = 'Fully Paid'

select
	(COUNT(case when loan_status = 'charged off' then id end)*100)
	/
	count(id) as Bad_loan_percentage
from bank_loan_data

select count(id) as Bad_loan_applications from Bank_loan_data
where loan_status = 'charged off'

select sum(loan_amount) as Bad_loan_Funded_amount from Bank_loan_data
where loan_status = 'charged off'

select sum(total_payment) as Bad_loan_amount_received from Bank_loan_data
where loan_status = 'charged off'

SELECT
        loan_status,
        COUNT(id) AS LoanCount,
        SUM(total_payment) AS Total_Amount_Received,
        SUM(loan_amount) AS Total_Funded_Amount,
        AVG(int_rate * 100) AS Interest_Rate,
        AVG(dti * 100) AS DTI
    FROM
        bank_loan_data
    GROUP BY
        loan_status

SELECT 
	loan_status, 
	SUM(total_payment) AS MTD_Total_Amount_Received, 
	SUM(loan_amount) AS MTD_Total_Funded_Amount 
FROM bank_loan_data
WHERE MONTH(issue_date) = 12 
GROUP BY loan_status

SELECT 
	MONTH(issue_date) AS Month_Munber, 
	DATENAME(MONTH, issue_date) AS Month_name, 
	COUNT(id) AS Total_Loan_Applications,
	SUM(loan_amount) AS Total_Funded_Amount,
	SUM(total_payment) AS Total_Amount_Received
FROM bank_loan_data
GROUP BY MONTH(issue_date), DATENAME(MONTH, issue_date)
ORDER BY MONTH(issue_date)

SELECT 
	address_state AS State, 
	COUNT(id) AS Total_Loan_Applications,
	SUM(loan_amount) AS Total_Funded_Amount,
	SUM(total_payment) AS Total_Amount_Received
FROM bank_loan_data
GROUP BY address_state
ORDER BY address_state

SELECT 
	term AS Term, 
	COUNT(id) AS Total_Loan_Applications,
	SUM(loan_amount) AS Total_Funded_Amount,
	SUM(total_payment) AS Total_Amount_Received
FROM bank_loan_data
GROUP BY term
ORDER BY term

SELECT 
	emp_length AS Employee_Length, 
	COUNT(id) AS Total_Loan_Applications,
	SUM(loan_amount) AS Total_Funded_Amount,
	SUM(total_payment) AS Total_Amount_Received
FROM bank_loan_data
GROUP BY emp_length
ORDER BY emp_length

SELECT 
	purpose AS PURPOSE, 
	COUNT(id) AS Total_Loan_Applications,
	SUM(loan_amount) AS Total_Funded_Amount,
	SUM(total_payment) AS Total_Amount_Received
FROM bank_loan_data
GROUP BY purpose
ORDER BY purpose

SELECT 
	home_ownership AS Home_Ownership, 
	COUNT(id) AS Total_Loan_Applications,
	SUM(loan_amount) AS Total_Funded_Amount,
	SUM(total_payment) AS Total_Amount_Received
FROM bank_loan_data
GROUP BY home_ownership
ORDER BY home_ownership





