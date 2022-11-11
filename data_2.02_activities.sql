-- DATA WAREHOUSES AND OPERATORS

-- Activity 1
use bank;

-- Select districts and salaries (from the district table) where salary is greater than 10000.
select A2 as district_name, A11 as average_salary from district
where A11 > 10000;

-- Select those loans whose contract finished and were not paid.
select loan_id from loan
where status = 'B';

-- Select cards of type junior. Return just first 10 in your query.
select card_id from card
where type = 'junior'
limit 10;

-- -----------------------------------

-- Activity 2

-- Select those loans whose contract finished and not paid back. Return the debt value from the status you identified in the last activity, together with loan_id and account_id.
select loan_id, account_id, amount from loan
where status = 'B';

-- Calculate the urban population for all districts.
select A2 as district_name, A4 as urban_population, A10 as `urban_population_%` from district
order by district_name;

-- Re-run it but filtering out districts where the rural population is greater than 50%.
select A2 as district_name, A4 as urban_population, A10 as `urban_population_%` from district
where A10 > 50
order by district_name;

-- -----------------------------------

-- Activity 3

-- Get all junior cards issued last year.
select * from card
where type = 'junior' 
order by issued desc
limit 365;

-- Get the first 10 transactions for withdrawals that are not in cash.
select * from trans
where type = 'VYDAJ' and operation = 'VYBER KARTOU'
limit 10;

-- Refine your query from last activity on loans whose contract finished and not paid back - filtered to loans where they were left with a debt bigger than 1000. 
-- Return the debt value together with loan_id and account_id. Sort by the highest debt value to the lowest.
select loan_id, account_id, amount from loan
where status = 'B' and amount > 1000
order by amount desc;

-- -----------------------------------

-- Activity 4

-- Get the biggest and the smallest transaction with non-zero values in the database (use the trans table in the bank database).
select max(amount) as max, min(amount) as min from trans
where amount > 0;

-- Get account information with an extra column year showing the opening year as 'YY'. Eg., 1995 will show as 95.
select *, substr(date, 1, 2) as year from account;




















