/*
Questions:
    - What are the top-paying jobs for my role?
    - What are the skills required for these top-paying roles?
    - What are the most-in-demand skills for my role?
    - What are the top skills based on salary for my role?
    - What are the mopst optimal skills to learn?
        - Optimal: High Demand AND High Paying
*/

-- Introducing in  CTE (Common Table Expression)

WITH skills_demand AS (
    SELECT 
        skills_dim.skill_id,
        skills_dim.skills,
        COUNT(skills_job_dim.job_id) AS demand_count
    FROM job_postings_fact
    INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
    INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
    WHERE
        job_title_short = 'Data Analyst'
        AND salary_year_avg IS NOT NULL
        AND job_work_from_home = TRUE
    GROUP BY
        skills_dim.skill_id
), average_salary AS (
    SELECT 
        skills_job_dim.skill_id,        
        ROUND(AVG(salary_year_avg), 0) AS avg_salary        
    FROM job_postings_fact
    INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
    INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
    WHERE
        job_title_short = 'Data Analyst'
        AND salary_year_avg IS NOT NULL
        AND job_work_from_home = TRUE
    GROUP BY
        skills_job_dim.skill_id
)

SELECT
    skills_demand.skill_id,
    skills_demand.skills,
    demand_count,
    avg_salary
FROM      
    skills_demand
INNER JOIN average_salary ON skills_demand.skill_id = average_salary.skill_id
WHERE
    demand_count > 15
ORDER BY
    avg_salary DESC,
    demand_count DESC
LIMIT 25 

/*

1. Top-Paying Jobs for Data Analysts
    Highest-Paying Skills (Avg Salary >$100K):
        - Go ($115K) - Surprisingly leads despite low demand
        - Snowflake ($113K) - Cloud data warehousing
        - Azure/AWS (108K−108K−111K) - Cloud platforms
        - Oracle ($105K) - Enterprise databases
        - Looker ($104K) - BI tool premium

2. Top-Paying Data Analyst Skills (Avg Salary)
    Go          $115,320 ████████████████
    Snowflake   $112,948 ███████████████
    Azure       $111,225 ██████████████
    AWS         $108,317 ████████████
    Looker      $103,795 █████████

3. Learning Roadmap
    - Immediate Focus:
        - SQL + Python (non-negotiable fundamentals)
        - Tableau (visualization standard)

    - Next Tier (Salary Boosters):
        - Snowflake (+12% salary premium)
        - Azure/AWS (cloud migration projects)

    - Niche Options:
        - Go (if targeting high-performance systems)
        - Looker (for enterprise BI roles)

Pro Tip: Combine high-demand skills (SQL/Python) with one high-salary niche (Snowflake/Azure) for maximum marketability.
Key Takeaway:

The optimal data analyst in 2023 needs:
    - Core: SQL + Python + Tableau
    - Premium: Snowflake + Cloud (Azure/AWS)
    - Bonus: Go/Looker for specialized roles

*/