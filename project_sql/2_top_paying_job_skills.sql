/*
Question: What skills are required for the top-paying Data Analyst jobs?
    - Use the top 10 highest-paying Data Analyst jobs from the frist query i.e. 1_top_paying_jobs.sql
    - Add the specific skills required for those roles.
    - Why? It helps us provide a deatiled look at which high-paying jobs demand certain skills,
      help job seekers inderstand which skills to develop that align with top salaries.
*/

-- Introducing in  CTE (Common Table Expression)

WITH top_paying_jobs AS (

    SELECT
        job_id,
        job_title,                
        salary_year_avg,        
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

)

SELECT
    top_paying_jobs.*,
    skills
FROM top_paying_jobs
INNER JOIN skills_job_dim ON top_paying_jobs.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
ORDER BY
    salary_year_avg DESC

/*

Key Insights from the Skills:

Top 3 Most In-Demand Skills:
    - SQL (8 mentions) – The most frequently required skill, emphasizing its importance in querying and managing data.
    - Python (7 mentions) – A key programming language for data analysis, automation, and machine learning.
    - Tableau (6 mentions) – A leading data visualization tool, highlighting the need for dashboard and reporting skills.

Other Notable Skills:
    - R (4 mentions) – Still relevant for statistical analysis and data science.
    - Snowflake, Pandas, Excel (3 mentions each) – Snowflake for cloud-based data warehousing, Pandas for data manipulation, and Excel for traditional data analysis.

Cloud & Big Data Skills:
    - Azure, AWS (2 mentions each) – Cloud computing platforms are increasingly relevant for data analysts.
    - Hadoop, Databricks, Pyspark (1 mention each) – Skills in big data processing frameworks are in demand but less frequent in these job postings.

Version Control & Collaboration Tools:
    - Bitbucket, GitLab, Atlassian, Jira, Confluence (2 mentions each) – These tools are important for managing code and projects.

Less Common but Valuable Skills:
    - Power BI (2 mentions) – Another strong business intelligence tool.
    - Jupyter, Numpy (2 mentions each) – Popular for data science workflows.

*/