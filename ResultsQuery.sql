--List the following details of each employee: employee number, last name, first name, sex, and salary
select emp.emp_no,emp.last_name,emp.first_name,emp.sex,sal.salary
from employees as emp left join salaries as sal
on emp.emp_no = sal.emp_no;

--List first name, last name, and hire date for employees who were hired in 1986
select first_name, last_name,hire_date
from employees
where extract('year' from hire_date)=1986;

--List the manager of each department with the following information: department number, 
--department name, the manager's employee number, last name, first name
select mag.dept_no,dept.dept_name,mag.emp_no,emp.last_name,emp.first_name
from dept_manager as mag 
join departments as dept on mag.dept_no=dept.dept_no
join employees as emp on mag.emp_no=emp.emp_no;

--List the department of each employee with the following information:
--employee number, last name, first name, and department name
select emp.emp_no,emp.last_name,emp.first_name,dept.dept_name
from dept_emp join employees as emp on dept_emp.emp_no=emp.emp_no
join departments as dept on dept_emp.dept_no=dept.dept_no;

--List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B"
select first_name, last_name, sex
from employees
where first_name='Hercules' and last_name like 'B%';

--List all employees in the Sales department, including their employee number, last name, first name, and department name
select emp.emp_no,emp.last_name,emp.first_name,dept.dept_name
from dept_emp join employees as emp on dept_emp.emp_no=emp.emp_no
join departments as dept on dept_emp.dept_no=dept.dept_no
where dept.dept_name='Sales';

--List all employees in the Sales and Development departments, 
--including their employee number, last name, first name, and department name
select emp.emp_no,emp.last_name,emp.first_name,dept.dept_name
from dept_emp join employees as emp on dept_emp.emp_no=emp.emp_no
join departments as dept on dept_emp.dept_no=dept.dept_no
where dept.dept_name in ('Sales','Development');

--In descending order, list the frequency count of employee last names, i.e., how many employees share each last name
select last_name, count(emp_no) as name_count
from employees
group by last_name
order by name_count desc;
