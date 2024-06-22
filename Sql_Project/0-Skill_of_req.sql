--SELECT company_id,
  --     name AS company_name
--FROM company_dim
--WHERE company_id IN (
  --  SELECT company_id
    --FROM job_postings_fact
   -- WHERE job_no_degree_mention=true
--)--


WITH remote_job_skills AS (
     SELECT skill_id, COUNT(*) AS skill_num
      FROM skills_job_dim AS sk
      INNER JOIN job_postings_fact AS job ON sk.job_id = job.job_id
      WHERE job.job_work_from_home = TRUE AND job.job_title_short = 'Data Analyst'
      GROUP BY skill_id
)

SELECT skills.skill_id,
        skills AS skill_names,
        skill_num
FROM remote_job_skills
INNER JOIN skills_dim AS skills ON skills.skill_id = remote_job_skills.skill_id
ORDER BY skill_num DESC