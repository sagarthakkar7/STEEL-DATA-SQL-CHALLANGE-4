#1. What are the names of all the customers who live in New York?
select FirstName, LastName 
from customers
where city = 'New York';

#2. What is the total number of accounts in the Accounts table?
select count(accountID) as 'Total Number of accounts'
from accounts;

#3. What is the total balance of all checking accounts?
select accounttype, sum(balance)
from accounts
where accounttype = 'checking';

#4. What is the total balance of all accounts associated with customers who live in Los Angeles?
select city as 'City', sum(balance)
from customers c 
join accounts a 
on a.customerID = c.customerID
where city = 'Los Angeles'
group by city;

#5. Which branch has the highest average account balance?
select b.branchID , branchname, avg(balance)
from branches b 
join accounts a 
on a.branchID = b.branchID
group by b.branchID
order by avg(balance) desc
limit 1;

#6. Which customer has the highest current balance in their accounts?
select a.customerID , concat(FirstName ,' ', LastName) as Customer_Name,
sum(balance)
from customers c 
join accounts a 
on c.customerID = a.customerID
group by a.customerID
order by sum(balance) desc 
limit 1;

#7. Which customer has made the most transactions in the Transactions table?
select customerID , count(transactionID)
from accounts a 
join transactions t 
on t.accountID = a.accountID
group by customerID
order by count(transactionID) desc 
limit 1;

#8.Which branch has the highest total balance across all of its accounts?
select b.branchID, branchName, sum(balance)
from branches b 
join accounts a 
on a.branchID = b.branchID
group by b.branchID
order by sum(balance) desc 
limit 1;

#9. Which customer has the highest total balance across all of their accounts, including savings and checking accounts?
select c.customerID, concat(FirstName,' ', LastName) as Customer_Name, sum(balance)
from accounts a 
join customers c 
on c.customerID = a.customerID
where a.accounttype in ('checking', 'savings')
group by c.customerID
order by sum(balance) desc 
limit 1;


#10. Which branch has the highest number of transactions in the Transactions table?
select BranchName , count(transactionID)
from branches b 
join accounts a 
on a.branchID = b.branchID
join transactions t 
on t.accountID = a.accountID
group by BranchName
order by count(transactionID) desc 
limit 1;