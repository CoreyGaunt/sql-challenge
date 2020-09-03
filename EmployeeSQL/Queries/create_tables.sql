create table titles(
	title_id varchar(15) not null,
	title varchar(100) not null,
	primary key (title_id));
	
create table employees(
	emp_no int not null,
	emp_title_id varchar(15) not null,
	birth_date varchar(20) not null,
	first_name varchar(100)not null,
	last_name varchar(100)not null,
	sex varchar(2)not null,
	hire_date varchar(20)not null,
	primary key (emp_no),
	foreign key (emp_title_id) references titles(title_id));
	
create table departments(
	dept_no varchar(15)not null,
	dept_name varchar(100)not null,
	primary key (dept_no));
	
create table dept_emp(
	emp_no int not null,
	dept_no varchar(15)not null,
	primary key (emp_no,dept_no));
	
create table dept_manager(
	dept_no varchar(15)not null,
	emp_no int not null,
	primary key (dept_no,emp_no));
	
create table salaries(
	emp_no int not null,
	salary int not null,
	primary key (emp_no,salary));