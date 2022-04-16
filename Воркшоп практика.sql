select *
from row.vacancies_row vr;

--сделаем несколько первичных проверок аттрибутов
select distinct address
from row.vacancies_row vr;

select distinct salary 
from row.vacancies_row vr;

select distinct contacts
from row.vacancies_row vr;

--проверяем первичный ключ
select count (id), count(distinct id) 
from row.vacancies_row vr;

select id, count(id)
from row.vacancies_row vr
group by id;

select *
from row.vacancies_row vr 
where id = '54520533'

select *
from row.vacancies_row vr 
where id is null;

select distinct * 
from row.vacancies_row vr;

select  distinct 
		id as vacancy_id, 
		name as vacancy_name,
		employer_name,
		employment_name,
		schedule_name,
		department_name,
		experience_name,
		key_skills,
		salary_from,
		salary_to,
		salary_currency,
		case when salary_currency = 'RUR' or salary_currency is null then min(salary_from) over (partition by experience_name) else 0 end as min_salary,
		case when salary_currency = 'RUR' or salary_currency is null then max(salary_to) over (partition by experience_name) else 0 end as max_salary
from row.vacancies_row vr;

select max(salary_to), min(salary_from)
from row.vacancies_row vr 

		
;
create view row.vacancies_bcl as (
select  distinct 
		id as vacancy_id, 
		name as vacancy_name,
		employer_name,
		employment_name,
		schedule_name,
		department_name,
		experience_name,
		key_skills,
		salary_from,
		salary_to,
		salary_currency,
		case when salary_currency = 'RUR' or salary_currency is null then min(salary_from) over (partition by experience_name) else 0 end as min_salary,
		case when salary_currency = 'RUR' or salary_currency is null then max(salary_to) over (partition by experience_name) else 0 end as max_salary
from row.vacancies_row vr
)



