SELECT job_id,
    job_title,
    job_location,
    job_schedule_type,
    salary_year_avg,
    job_posted_date,
    name AS company_name

FROM job_postings_fact AS job
LEFT JOIN company_dim AS cp ON job.company_id = cp.company_id
WHERE
job_title_short = 'Data Analyst' AND
job_location = 'New York, NY' AND
salary_year_avg IS NOT NULL
ORDER BY salary_year_avg DESC

