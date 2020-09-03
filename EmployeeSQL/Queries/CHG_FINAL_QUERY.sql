-- creating my tables, ensuring that I maintain all primary, foreign, and composite keys

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
	hire_date date not null,
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
	
select * from employees
	
create table dept_manager(
	dept_no varchar(15)not null,
	emp_no int not null,
	primary key (dept_no,emp_no));
	
create table salaries(
	emp_no int not null,
	salary int not null,
	primary key (emp_no,salary));
	
-- creating my query to list the employee number, last name, first name, sex, and salary
	
select employees.emp_no, employees.last_name, employees.first_name, employees.sex, salaries.salary
from employees
join salaries
on employees.emp_no = salaries.emp_no

-- creating my query to list the first name, last name, and hire date for employees that were hird in 1986

select employees.first_name, employees.last_name, employees.hire_date
from employees
where hire_date between '1986-01-01' and '1986-12-31'

-- creating my query to list the manager of each department and their department number, department name, manager's employee number,
-- last name, and first name

select departments.dept_no,departments.dept_name,dept_manager.emp_no,employees.first_name,employees.last_name
from departments
join dept_manager
on departments.dept_no = dept_manager.dept_no
join employees
on dept_manager.emp_no = employees.emp_no

-- creating my query to list the department of each employee with their employee number, last name, first name, and department name

select employees.emp_no, employees.last_name, employees.first_name, departments.dept_name
from employees
join dept_emp
on employees.emp_no = dept_emp.emp_no
join departments
on dept_emp.dept_no = departments.dept_no

-- creating my query to list the first name, last name, and sex for employees whose first name is Hercules, and last name
-- starts with a 'B'

select employees.first_name, employees.last_name, employees.sex
from employees
where first_name = 'Hercules' and last_name like 'B%'

-- creating my query to list all of the employees in the sales department including their employee number,
-- last name, first name, and department name

select employees.emp_no, employees.last_name, employees.first_name, departments.dept_name
from employees
join dept_emp
on employees.emp_no = dept_emp.emp_no
join departments
on dept_emp.dept_no = departments.dept_no
where dept_name = 'Sales'

-- creating my query to list all of the employees in the sales and development departments including their employee number,
-- last name, first name, and department name

select employees.emp_no, employees.last_name, employees.first_name, departments.dept_name
from employees
join dept_emp
on employees.emp_no = dept_emp.emp_no
join departments
on dept_emp.dept_no = departments.dept_no
where dept_name = 'Sales' or dept_name = 'Development'

-- creating my query to list the frequency count of employee last names in descending order

select employees.last_name, count(last_name)
from employees
group by employees.last_name
order by last_name desc