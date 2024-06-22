WITH top_paying_jobs AS (
    SELECT job_id,
    job_title,
    salary_year_avg,
    name AS company_name

    FROM job_postings_fact AS job
    LEFT JOIN company_dim AS cp ON job.company_id = cp.company_id
    WHERE
    job_title_short = 'Data Analyst' AND
    job_location = 'New York, NY' AND
    salary_year_avg IS NOT NULL
    ORDER BY salary_year_avg DESC
)
SELECT top_paying_jobs.*,skills_dim.skills
FROM top_paying_jobs
INNER JOIN skills_job_dim ON skills_job_dim.job_id= top_paying_jobs.job_id
INNER JOIN skills_dim ON skills_dim.skill_id= skills_job_dim.skill_id
ORDER BY salary_year_avg DESC 
