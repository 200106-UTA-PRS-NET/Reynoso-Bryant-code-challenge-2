create database EmployeeDatabase;
go
use EmployeeDatabase;
go

create table Department(
	ID int Identity(1,1),
	Name varchar(50) not null,
	Location varchar(50) not null,
	Primary key(ID)
)

create table Employee(
	ID int Identity(1,1),
	FirstName varchar(50) not null,
	LastName varchar(50) not null,
	SSN char(9) unique,
	DeptID int not null,
	Primary key(ID),
	Foreign key(DeptID) references Department(ID)
)

create table EmpDetails(
	ID int Identity(1,1),
	EmployeeID int not null,
	Salary money,
	Address1 varchar(100) null,
	Address2 varchar(100) null,
	City varchar(50),
	State varchar(50),
	Country varchar(70),
	Primary key(ID),
	Foreign key(EmployeeID) references Employee(ID)
)

insert into Department(Name,Location)
			values('Marketing','Building 1'),
				('I.T.','Building 2'),
				('Sales','Building 3')

select * from Department

insert into Employee(FirstName,LastName,SSN,DeptID)
	values('Tina','Smith','123456789', '1'),
		  ('Bill','Skarsgard','987654321','2'),
		  ('James','Swindle','546879213','3')

insert into EmpDetails(EmployeeID,salary,Address1,City,State,Country)
	values('1',50000,'1234 Market St','Tampa','Florida', 'United States of America'),
		  ('2',30000,'6616 Penny St','Houston','Texas', 'United States of America'),
		  ('3',180000,'1234 Money St','New York','New York', 'United States of America')

select * from Employee
where DeptID=1

select sum(salary) from EmpDetails
where EmployeeID in (select ID from Employee
where DeptID=1)

select count(ID) as TotalEmployees from Employee
group by DeptId

update EmpDetails
	set salary = 90000
	where EmployeeID in (select ID from Employee
where FirstName='Tina' And LastName = 'Smith')

select * from EmpDetails