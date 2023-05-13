------csv data must be imported in order of tables created or errors will appear due to keys being referenced


drop table if exists employees;

---create table for 'employees.csv'
create table employees(
    emp_no integer primary key not null,
    emp_title_id varchar(5) not null,
    birth_date date not null,
    first_name varchar(30) not null, 
    last_name varchar(30) not null,
    sex varchar(1) not null,
    hire_date date not null
);


------IMPORT DATA FOR employees.csv; right click table in PGAdmin4-->Import/Export Data

drop table if exists departments;

--- create table for departments.csv; dept_no is primary key; no foreign keys
create table departments(
    dept_no varchar(5) primary key not null,
    dept_name varchar(50) not null
);
------IMPORT DATA FOR departments.csv; right click table in PGAdmin4-->Import/Export Data


drop table if exists dept_emp;

---create table for dept_emp.csv; primary key is emp_no (is also a foreign key)
create table dept_emp (
    emp_no int not null, 
    dept_no varchar(5) not null references departments(dept_no),
    foreign key (emp_no) references employees(emp_no),
    primary key (emp_no, dept_no)
);
------IMPORT DATA FOR dept_emp.csv; right click table in PGAdmin4-->Import/Export Data


drop table if exists dept_manager;

---Create table for Department managers; both columns are primary keys
create table dept_manager(
    dept_no varchar(5) not null references departments(dept_no),
    emp_no int not null,
    foreign key (emp_no) references employees(emp_no),
    primary key(dept_no, emp_no)
);
------IMPORT DATA FOR dept_manager.csv; right click table in PGAdmin4-->Import/Export Data


drop table if exists salaries;

----create table for salaries
create table salaries(
    emp_no int primary key not null, 
    salary int,
    foreign key (emp_no) references employees(emp_no)
);
------IMPORT DATA FOR salaries.csv; right click table in PGAdmin4-->Import/Export Data

drop table if exists titles;

-- create table for titles.csv

CREATE TABLE titles(
	title_id VARCHAR(5) NOT NULL,
	title VARCHAR(30) NOT NULL,
	PRIMARY KEY (title)
);
------IMPORT DATA FOR titles.csv; right click table in PGAdmin4-->Import/Export Data

----check if data imported correctly
select*from employees;
select*from departments;
select*from dept_emp;
select*from dept_manager;
select*from salaries;
select*from titles;
