/*
Question: What are the most in demand skills for Data Analysts?
    - Join job postings to inner join table similar to query 2 in 2_top_paying_jobs.sql
    - Identify the top 5 in-demand skillsfor a Data Analyst.
    - Focus on all job postings.
    - Why? Retrieves the top 5 skills with the highest demand in the job market,
    proving insights into the most valuable skills for job seekers.
*/

SELECT 
    skills,
    COUNT(skills_job_dim.job_id) AS demand_count
FROM job_postings_fact
INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE
    job_title_short = 'Data Analyst' AND
    job_work_from_home = TRUE
GROUP BY
    skills
ORDER BY
    demand_count DESC
LIMIT 5

/*

Key Takeaways:
    - SQL is #1 – Appeared in 7,291 postings (58% more than Excel), making it the essential skill.
    - Excel > Python – Traditional tools (Excel: 4,611) still edge out programming (Python: 4,330), but the gap is narrow.
    - Tableau leads visualization – Used in 3,745 postings vs. Power BI’s 2,609 (43% more demand).
    - Modern vs. Traditional Balance – The field requires both foundational skills (SQL/Excel) and modern tools (Python/Tableau).

Priority for Job Seekers
    - Full master SQL
    - Learn both Excel and Python (equally important)
    - Focus on Tableau first, then Power BI

Why It Matters
    - SQL’s dominance reflects its role in data querying across industries.
    - Python’s near-parity with Excel signals a shift toward programming in analytics.
    - Tableau’s lead suggests it remains the top choice for data visualization.
    - This data confirms that 2023’s data analysts need hybrid skills—bridging classic tools and modern tech.

*/