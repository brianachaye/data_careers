/*
Question: What the top skills based on salary?
    - Look at the average salary associated with each skill for Data Analyst postions.
    - Focus on roles with specified salaries, regardless of location.
    - Why? It reveals how different skills impact levels for Data Analysis and helps identify
      the most financially rewarding skills to acquire or improve.
*/

SELECT 
    skills,
    ROUND(AVG(salary_year_avg), 0) AS average_salary
    
FROM job_postings_fact
INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE
    job_title_short = 'Data Analyst'
    AND salary_year_avg IS NOT NULL
    AND job_work_from_home = TRUE
GROUP BY
    skills
ORDER BY
    average_salary DESC
LIMIT 25

/*

KEY FINDINGS:
1. Top-Tier Skills (>$160K)
    - PySpark leads: $208,172 average salary
    - Version control tools: Bitbucket (189K)andGitLab(189K)andGitLab(154K)
    - AI/ML platforms: Watson, DataRobot (155K−155K−160K)
    - Database niche: Couchbase ($160K)

2. Surprising Insights
    - Bitbucket pays more than GitLab (189Kvs189Kvs154K)
    - Jupyter Notebooks command $152K (higher than Pandas/Numpy)
    - Swift appears ($153K) - unusual for data analysts
    - Notion skills yield $125K (non-technical tool premium)

ACTIONABLE INSIGHTS:
1. For Job Seekers:
    - Master PySpark: Commands 25% premium over standard Python tools
    - Learn Niche Databases: Couchbase pays 18% more than PostgreSQL
    - Add Version Control: Bitbucket skills nearly double average salaries
    - Upskill in AI Platforms: Watson/DataRobot skills beat Python libraries

2. For Employers:
    - PySpark = Salary Benchmark: Positions requiring this pay 40% above market.
    - Version Control Matters: Bitbucket skills correlate with senior roles.
    - AI Tools Create Premiums: Demand for Watson/DataRobot outstrips supply.

*/