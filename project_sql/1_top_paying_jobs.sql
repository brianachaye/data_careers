/*
Question: What are the top-paying data analyst jobs?
    - Identify the top 10 highest-paying remote  Data Analyst roles that are available remotely.
    - Which companies are offering these highest-paying Data Analyst roles?
    - Focuses on job postings with specified salaries (remove nulls).
    - Why? Highlight the top-paying opportunities for Data Analysis, offering insights into employement.
    - What 
*/

SELECT
    job_id,
    job_title,
    job_location,
    job_schedule_type,
    salary_year_avg,
    job_posted_date,
    name AS company_name
FROM
    job_postings_fact
LEFT JOIN company_dim ON job_postings_fact.company_id = company_dim.company_id
WHERE
    job_title_short = 'Data Analyst' AND
    job_location = 'Anywhere' AND
    salary_year_avg IS NOT NULL
ORDER BY
    salary_year_avg DESC
LIMIT 10

/*

Key Findings
1. Salary Range:
    - Highest Salary: $650,000 (Data Analyst at Mantys - outlier position)
    - Typical High-End Range: 180,000−180,000−340,000 for director/principal-level roles
    - Average (excluding outlier): ≈$230,000

2. Job Titles & Levels:
    - Leadership Roles Dominate: 7 of 10 positions are director/principal-level
    - Standard Titles: Only 3 positions use the generic "Data Analyst" title
    - Specializations: Marketing, AV Performance, and ERM roles appear

3. Company Types: 
    - Tech Giants: Meta, AT&T, Pinterest
    - Finance: SmartAsset (appears twice)
    - Healthcare: UCLA Health
    - Recruiting: Get It Recruit
    - Startup/Unicorn: Mantys (extreme outlier)

*/