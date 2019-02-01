--select tname from tab; 
--select * from employees;

/* Select [ All || Distinct ] 선택하는 열 or 그룹함수 from 데이터 이름 where group by, having, order by */

/* 오라클 날짜 기본형식 RR/MM/DD 최근 날짜일 수록 값이 커지니, 비교연산자로도 조건 지정 가능 */
/* 부분만 비교할 때는 %, _등을 이용하고, like 연산자를 사용 */
--Select Employee_id, hire_date from employees where  hire_date like '___01%'
-- 대상 열이름 like '찾을 문자열'  %는 0이상의 문자, _는 한개의 문자 표현

/* < Between And 연산자 > */ 
--select employee_id, hire_date from EMPLOYEES where hire_date between '08/01/01' AND '08/12,30';

/* < substr(문자열, 시작 인덱스, 길이 ) >  - 문자열의 시작인덱스부터 길이개의 문자열을 가져옴*/
--select substr('javaprogram',4,6) from dual;      => 결과 aprogr

/* < substrb(문자열, 시작인덱스, 바이트수) >  - 문자열에서 시작인덱스부터 바이트수만큼 가져옴 */
-- select substrb('javaprogram',4,6) from dual;    => 결과 ap


/* < order by 정렬기준 > -정렬기준 : desc(내림차순), asc(오름차순) default 값은 asc */
-- select *from employees order by employee_id desc; 
-- select salary,employee_id from employees order by salary desc, employee_id asc; salary를 내림차순으로 정렬하되 같으면 employeeid로 오름차순 정렬

/* < order by - nulls first, nulls last >  지정하지 않으면 asc는 null값이 뒤에, desc는 null값이 앞에 들어감 */ 
-- select commission_pct from employees order by commission_pct desc;

/* < group by >*/ 
-- select department_id, sum(salary) from employees group by department_id; 
 
/* < having > - 계산 순서 상 group by이 조건함수보다 빠르기 때문에 따로 having 요소를 사용해 group by에 적용, group by 함수의 조건만 having 에 적음 : row 줄어듬  */
-- select department_id, sum(salary) from employees  group by department_id having sum(salary) > 50000; 

/*------------------------------------------------------<     그룹함수        >---------------------------------------------------------*/
/* < 그룹함수 - sum, avg, count, max, min > */
/* sum, avg는 숫자만 가능, min, max, count 모든 타입 */
-- select sum(salary) from employees;  
-- select avg(salary) from employees; 
-- select min(salary) from employees;
-- select count(commission_pct) from employees; -- null 값을 제외한 값을 가져옴. 
-- select count(*) from employees;
-- select salary, sum(salary) from employees -- salary의 값의 개수와 sum의 값의 개수가 달라서 실행이 안됨. 
-- select department_id,sum(salary) from employees group by department_id; --그룹별로 합이 나옴 


-- day1 예제 
-- select first_name, salary, department_id from employees where salary>=15000; -- 1.1 
-- select first_name, salary*12 from employees where salary*12 > 170000; -- 1.2
-- select first_name, salary from employees where department_id is null;  -- 1.3R
-- select first_name, salary, hire_date from employees where hire_date < '2004/01/01'order by hire_date; -- 1.4
-- select first_name, salary, department_id from employees where department_id in (80,50) and salary between 1300 and 20000; -- 2.1
-- select first_name, salary, department_id, hire_date from employees where hire_date >= '95/01/01' and salary between 1300 and 20000; -- 2.2
-- select * from employees where hire_date >= '96/01/01';
-- select first_name,salary, job_id from employees where job_id like '%CLERK%';
-- select first_name, job_id, hire_date from employees where hire_date like '___12%';
-- select first_name, salary, hire_date from EMPLOYEES where first_name like '%ie%';
-- select first_name, salary, hire_date from EMPLOYEES where first_name like '%d';
-- select first_name, salary, hire_date from EMPLOYEES where first_name like '___d%';
-- select  first_name, commission_pct, salary from EMPLOYEES where commission_pct is not null;
-- select  first_name, commission_pct, salary from EMPLOYEES where commission_pct is null;
-- select * from employees where (commission_pct is not null)  and ( hire_date like '08%') and department_id in (30,50,80) and salary between 5000 and 17000
-- order by hire_date asc, salary desc;


-----------  < DAY2 >  -----------------
--< INITCAP(String) > - 첫글자만 대문자 나머지는 소문자로 변환, upper(), lower()도 있음.
-- select first_name, salary from employees where first_name=INITCAP('jenniffer');

--< sysdate > - sysdate 시스템 시간 출력 함수, dual은 가상 레코드 
-- select sysdate from employees;
-- select sysdate from dual;

--< instr(검색 레코드, 찾을 문자) > - 찾은 곳의 인덱스를 반환, 없으면 0반환
-- select instr(first_name, 'Jen') from employees; 
-- select hire_date,employee_id from employees where instr(hire_date,'10')=4;

--< mod(A,B) > - A를 B로 나눈 나머지 출럭
-- select mod(9,2) from dual; 
-- select employee_id from employees where mod(employee_id,2)=0;

-- < round(A,b) > - b자리 이하 소수점 반올림 매개변수 없을 땐 0, 양수는 소수점 자릿수, 음수는 정수 자릿수
-- select round(345.13456) from dual;
-- select round(345.13456,1) from dual;
-- select round(345.13456,2) from dual;
-- select round(345.13456,-1) from dual;
-- select round((sysdate-hire_date)/365.0) || '년 경과' from employees;
-- select round((sysdate-hire_date)/7) || '주 경과' from employees;

-- < trunc(A,b) b자리 이하 소수점 절삭 >
-- select trunc(345.13456) from dual;
-- select trunc(345.13456,1) from dual;
-- select trunc(345.13456,2) from dual;
-- select trunc(345.13456,-1) from dual;
-- select trunc(months_between(sysdate, hire_date)) || '개월 경과' from employees;

-- < 변환 함수 > - to_number. to_char 
-- select to_number('100,000', '000,000') from dual;
-- select to_char(100000) from dual; 
-- select hire_date, to_char(hire_date, 'mm:dd:yyyy') from employees;
-- select hire_date, to_char(hire_date, 'mm:dd:yyyy') from employees; 
-- select hire_date, to_char(hire_date,'fmmm "월" dd "일" yyyy "년도" hh-mi-ss')from employees;
-- select first_name, nvl(to_char(department_id),'미배정') from employees where department_id is null;

-- select department_id, decode(department_id, 100, 'A', 110, 'B', 'DEFAULT') as Dname from employees;
-- select first_name, depARTMENT_NAME from employees, departments where employees.department_id = departments.department_id;
-- select first_name, depARTMENT_NAME from employees Natural join departments;
-- select e.first_name, d.depARTMENT_NAME from departments d join  employees e using first_name;


--< equi join > - where절의 다른 컬럼의 값으로 =을 사용. 
-- select e.first_name, e.department_id,d.department_name from employees e, departments d where e.first_name = 'Jennifer';
-- select e.first_name || '-' || l.city from employees e, departments d, locations l  where  (e.department_id = d.department_id) and d.location_id = l.location_id;

-- < self join > 같은 테이블의 2개의 속성을 연결하여 eauql join을 하는 방법 
-- select a.employee_id 내사번,a.first_name 내이름, b.employee_id 상사 사번, b.first_name 상사이름 
-- from employees a, employees b
-- where a.manager_id = b.employee_id;
-- ees where (department_id, salary)=(select department_id,salary from employees where upper(first_name) ='SARAH');
-- select first_name, salary from employees whe
-- < outer join > 
-- select a.employee_id 내사번,a.first_name 내이름, b.employee_id 상사사번, b.first_name 상사이름 from employees a, employees b where a.manager_id(+) = b.employee_id;
-- select a.employee_id 내사번,a.first_name 내이름, b.employee_id 상사사번, b.first_name 상사이름 from employees a, employees b where a.manager_id(+) = b.employee_id;
-- select e.first_name, nvl( e.department_id, '미배정') from employees e,DEPARTMENTS d where e.department_id= d.department_id(+) order by department_id desc; 

--< 단일 쿼리문 > 조건이 하나면 =사용 
-- select a.employee_id 내사번,a.first_name 내이름, nvl(b.employee_id , 0)상사사번, nvl(b.first_name ,'boss') 상사이름 from employees a, employees b where a.manager_id = b.employee_id(+);
-- select first_name, department_id from employees where department_id=(select department_id from employees where upper(first_name) ='SARAH');
-- select first_name, department_id from employre salary > (select salary from employees where LOWER(first_name) = 'sarah')


--< 다중 쿼리문 > 조건이 여러개면 IN 사용
-- select first_name, department_id from employees where department_id IN (select department_id from employees where upper(first_name) ='JENNIFER');

--< ANY, ALL > 
-- select first_name, salary from employees where salary > ANY(select salary from employees where LOWER(first_name) = 'jennifer');
-- select first_name, salary from employees where salary > ALL(select salary from employees where LOWER(first_name) = 'jennifer');











