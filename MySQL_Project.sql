/*Tema  DDL exercise slide 25*/ 

create database humanresources; 
create table employees (
employeeId int,
firstName varchar (20),
lastName varchar (20),
dateOfBirth date); 

desc employees; 

alter table employees 
add column phoneNumber varchar (20) not null; 
alter table employees 
add column email varchar (30);   
alter table employees 
add column salary int not null;

alter table employees          /* Error Code: 1091. Can't DROP 'postalAdress'; check that column/key exists */
drop column postalAdress; 
/* sau*/
alter table employees
drop postalAdress; 


create table employeeAdress (
country varchar (25) not null );
 drop table employeeAdress; 

/* Tema slide 26*/

create database humanResources;
use humanResources; 
create table employees (
employeeId int,
firstName varchar (100), 
lastName varchar (100),
dateOfBirth date,
postalAdress varchar (200)); 
alter table employees
add phoneNumber varchar (100); 
alter table employees 
add email VARCHAR (100); 
alter table employees 
add column salary int; 
desc employees; 

alter table employees
drop postalAdress;

create table employeeAdress (
country varchar (100)); 

drop table employeeAdress; /*tabela s-a sters*/


/* tema slide 31*/

use cinema;
insert into employees (employeeId, firstName, lastName, dateOfBirth, phoneNumber, email, salary)
values ( "1", "Jhon", "Jhonson", "1975-01-01", "0800800314", "jhon@jhonson.com", "1000"); 
select * from employees;

update employees            
set dateOfBirth = "1980-01-01";

update employees
set dateOfBirth= "1980-01-01" where firstName= "Jhon" and LastName= "Jhonson";

select * from employees;

delete from employees
where firstName= "Jhon" and lastName="Jhonson";


insert into employees ( firstName, lastName, dateOfBirth, phoneNumber, email, salary)
values ("Jhon", "Jhonson", "1975-01-01", "0-800-800-888", "jhon.jhonson.com", "1000"),
("James", "Jameson", "1985-02-02", "0-800-800-999", "james.jameson.com", "2000");

insert into employees (employeeId, firstName, lastName, dateOfBirth, phoneNumber, email, salary) 
values (1, 'John', 'Johnson', '1975-01-01', '0-800-800-314', 'john@johnson.com', 1000);

select * from employees;

/*update employees set dateOfBirth=1980-01-01; //fix the error*/

update employees
set dateOfBirth= "1980-01-01";   

update employees
set dateOfBirth = "1975-01-01" where firstName= "Jhon" and lastName= "Jhonson";

update employees
set dateOfBirth= "1985-02-02" where firstName= "James" and lastName= "Jameson"; 

select * from employees;
delete from employees; 

/*insert into employees (employeeId, firstName, lastName, dateOfBirth, phoneNumber, email, salary) 
values (1, 'John', 'Johnson', '1975-01-01', '0-800-800-888', 'john@johnson.com', 1000),
 (2, 'James', 'Jameson', '1985-02-02', '0-800-800-999', 'james@jameson.com', 2000);*/
 
 insert into employees (employeeId, firstName, lastName, dateOfBirth, phoneNumber, email, salary)
 values ("1", "Jhon", "Jhonson", "1975-01-01", "0-800-800-888", "jhon@jhonson.com", "1000"),
 ( "2", "James", "Jmaeson", "1985-02-02", "0-800-800-999", "james@jameson.com", "2000"); 

select * from employees;

-- tema slide 39--

-- Select everything from table: employees --
select * from employees;

-- Select only firstName and lastName from table: employees --
select firstName lastName from  employees; 

-- Select all employees with lastName Johnson --
select lastName from employees where lastName= "Jhonson"; 

-- select all employees whose lastName starts with J --
select lastName from employees where lastName like "J%";

-- Select all employees whose lastName contains so --
select lastName from employees where lastName like "%so%"; 

-- Select all employees born after 1980 --
select dateOfBirth from employees where dateOfBirth like "198%"; 

-- Select all employees born after 1980 and whose firstName is James--
select * from employees where dateOfBirth like "198%" and firstName = "James";

--   Select all employees born after 1970 or whose firstName is John --
select * from employees where dateOfBirth like "197%" and firstName= "Jhon"; 

-- Select all employees whose lastName is not Jameson --
select * from employees where lastName !="Jameson"; 

-- facem o corectie din Jmaeson in Jameson--
update employees 
set lastName= "Jameson" where lastName= "Jmaeson"; 

-- Select the maximum salary-- 
select max(salary) from employees;

--  Select the minium salary---
select min(salary) from employees;

-- Select the average salary --
select avg(salary) from employees;


-- tema slide 40--
-- select all--
select * from employees;

-- Select 2 columns: select firstName, lastName from employees;--
select firstName, lastName from employees;

select * from employees where lastName= "Johnson"; -- nu returneaza pt ca nu am in tabel acest nume, schimb numele din Jhonson in Johnson--

update employees
set lastName="Johnson" where lastName="Jhonson";

-- select * from employees where left (lastName, 1)='J';--
select * from employees where lastName like "J%" and employeeId="1"; 

-- select * from employees where YEAR(dateOfBirth) > 1980;--
select * from employees where dateOfBirth like "198%";

-- slide 41--

-- Select after year and .. select * from employees where YEAR(dateOfBirth) > 1980 and firstName = 'John';--
select * from employees where dateOfBirth like  "198%" and firstName = 'John';
-- aceasta instructiune nu returneaza nimic pentru ca angajatul firstName= 'John' este nascut in 1975--

-- Select after year or ..select * from employees where YEAR(dateOfBirth) > 1980 or  firstName = 'John';--
select * from employees where dateOfBirth like '198%' or firstName =' John';
-- '2', 'James', 'Jameson', '1985-02-02', '0-800-800-999', 'james@jameson.com', '2000'--

-- Select where not select * from employees where lastName != 'John'--
select * from employees where lastName !='John';

update employees
set firstName = 'John' where firstName = 'Jhon'; 

select * from employees;

-- Select max select MAX(salary) from employees;
select max(salary) from employees;

-- Select min select MIN(salary) from employees;
select min(salary) from employees;

-- Select average select AVG(salary) from employees;--
select avg(salary) from employees;


-- slide 59 join--
-- o sa cream doua tabele--
-- create table smoke_tests (id INT, name VARCHAR(100), steps VARCHAR (300));--
-- create table regression_tests (id INT, name VARCHAR(100), steps VARCHAR (300));--

create table smokeTests (
id int, 
name varchar (100),
steps varchar (300));

create table regressionTests (
id int, 
name varchar (100),
steps varchar (300));

-- insert into smoke_tests(id, name, steps) values (1, 'tc1', '3 steps'), (2, 'tc2', '2 steps');--
insert into smoketests (id, name, steps)
values ('1', 'tc1', '3steps'), ('2', 'tc', '2steps');
select * from smoketests;

-- insert into regression_tests(id, name, steps) values (1, 'tc1', '3 steps'), (3, 'tc3', '4 steps’);--

insert into regressiontests (id, name, steps)
values ('1', 'tc1', '3steps'), ('3', 'tc3', '4steps');
select * from regressiontests;

-- select * from smoke_tests join regression_tests;--
select * from smoketests cross join regressiontests;

-- select * from smoke_tests inner join regression_tests on smoke_tests.name= regression_tests.name; --
 select * from smoketests inner join regressiontests on smoketests.name=regressiontests.name;
 
 -- select * from smoke_tests left join regression_tests on smoke_tests.name = regression_tests.name;--
 select * from smoketests left join regressiontests on smoketests.name=regressiontests.name;
 
 -- select * from smoke_tests right join regression_tests on smoke_tests.name = regression_tests.name;--
 select * from smoketests right join regressiontests on smoketests.name=regressiontests.name;
 
-- CRUD slide 62--
-- create table tests--
create table tests (
id int not null auto_increment,
name varchar (30),
stept varchar (500),
expected varchar (100),
primary key (id));

alter table tests 
change stept steps varchar (500); -- schimba numele unei coloane--

select * from tests;

-- insert values--
insert into tests (name, steps, expected)
values('tc1','3steps', 'asdfas'), ('tc2', '5steps', 'asda'), ('tc3', 'sdfas', 'fdsfasd');
select * from tests;
select id from tests;
select name from tests;
select steps from tests;
select expected from tests;
-- select by--
select * from tests where expected= 'asda';
select *from tests where name= 'tc1';
select name expected from tests where name= 'tc1';
select n as name, s as steps from tests;
select * from tests;

--  UPDATE--
update tests
set name='n' where expected ='asda';
update tests
set name= 'n' where name = 'n';

insert into tests (name, steps, expected)
values ('tc4', 'x', 'map visible'), ('tc5', 'y', 'error');

select * from tests;

update tests
set steps ='z' where name= 'tc5';

-- crud delete--
insert into tests (name, steps, expected)
values ('test', 't', 't');
delete from tests where name= 'test';
 create table test2 (
 a varchar (2),
 b int); 
insert into test2 (a, b)
values ('2', '2'); 

select * from test2;

delete from test2 where a='2'and b='2'; 
drop table test2;

-- crud exercises-create_

/* SELECT database();
 CREATE DATABASE shirts_db;
use shirts_db; 
SELECT database();
CREATE TABLE shirts(
	shirt_id INT NOT NULL AUTO_INCREMENT,
	article VARCHAR(100),
	color VARCHAR(100),
	shirt_size VARCHAR(100),
	last_worn INT,
	PRIMARY KEY(shirt_id));
create database shirtdb*/
create database shirtsdb;
use shirtsdb;
create table shirts (
shirtId int not null auto_increment,
article varchar (100),
color varchar (100), 
shirtSize varchar (100),
lastWorn int,
primary key (shirtId));
select article, color from shirts;
select * from shitrs where shirtSize='M'; -- nu returneaza nimic pentru ca tabela noastra este goala--
select article, color, shirtSize, lastWorn from shirts where shirtsize='M';-- nu returneaza nimic--
-- SELECT * FROM shirts WHERE article='polo shirt'; UPDATE shirts SET shirt_size='L' WHERE article='polo shirt';--
desc shirts;
select * from shirts;


















 
 


























 















 


























































































