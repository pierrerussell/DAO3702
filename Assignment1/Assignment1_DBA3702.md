# DBA3702: Descriptive Analytics with R

## Assignment 1: Data Wrangling & Social Network Analysis

```
Due Date: Feb 3 at 11:59 PM
Submission: Canvas (R Script + PDF Report)
Group Size: 2-4 students per group
Total Points: 100 points
```
## Learning Objectives

Upon completing this assignment, you will be able to:

1. Apply fundamental R data structures (vectors, lists, data frames) to organize and
    manipulate data
2. Use dplyr verbs (select, filter, arrange, mutate, group_by, summarise) to perform data
    wrangling tasks
3. Construct and execute data manipulation pipelines using the pipe operator (%>%)
4. Build and visualize social network graphs using the igraph package
5. Calculate and interpret network centrality metrics (degree, closeness, betweenness,
    PageRank)
6. Perform community detection and analyze network structure

## Background Scenario

You have been hired as a Data Analytics Consultant for **TechConnect Inc.** , a mid-sized
technology company. The company wants to understand two critical aspects of their
organization:

7. **Employee Performance Analysis:** The HR department has collected data on 50
    employees and wants insights into performance patterns across departments,
    experience levels, and project involvement.
8. **Internal Communication Network:** The management team wants to understand how
    information flows through the organization by analyzing email communication patterns
    among employees.
Your task is to analyze the provided datasets and deliver actionable insights to help
TechConnect improve employee performance and communication efficiency.


## Datasets

You are provided with three CSV files:

### 1. employees.csv

Contains information about 50 employees at TechConnect Inc.
**Column Type Description**
employee_id Integer Unique identifier (1-50)
name Character Employee name
department Character Engineering, Marketing, Sales, HR,
Finance
role Character Junior, Senior, Lead, Manager
years_exp Numeric Years of experience (1-20)
salary Numeric Annual salary in USD
performance_score Numeric Performance rating (1.0-5.0)
projects_completed Integer Number of completed projects

### 2. email_nodes.csv

Node attributes for the email communication network (one row per employee).
**Column Type Description**
id Integer Employee ID (matches
employees.csv)
department Character Department affiliation
role Character Job role level

### 3. email_edges.csv

Email communication edges representing email exchanges between employees.
**Column Type Description**
from Integer Sender employee ID
to Integer Receiver employee ID
weight Integer Number of emails exchanged


## Part 1: Data Wrangling with dplyr (45 points)

Use the _employees.csv_ dataset to answer the following questions. Show all your R code and
output.

#### Question 1.1: Data Exploration (5 points)

```
a) Load the required packages (dplyr, tibble) and read in the employees.csv file.
b) Convert the data frame to a tibble and display the first 10 rows.
c) Use appropriate functions to report: the number of rows, number of columns, data
types of each column, and a statistical summary of numeric variables.
```
#### Question 1.2: Selecting and Filtering (8 points)

```
d) Select only the columns: name, department, role, and performance_score.
e) Filter employees who have a performance score greater than 4.0.
f) Filter employees who are in either the Engineering OR Marketing department AND
have more than 5 years of experience.
g) Use select helpers to select all columns that contain the word "score" or start with
"p".
```
#### Question 1.3: Sorting and Ranking (7 points)

```
h) Sort the employees by salary in descending order and show the top 5 highest-paid
employees.
i) Sort employees first by department (alphabetically), then by performance_score
(descending within each department).
j) Identify the employee with the lowest salary in each department using arrange() and
slice_head().
```
#### Question 1.4: Creating New Variables (10 points)

```
k) Create a new column called salary_per_year_exp that calculates salary divided by
years of experience.
l) Create a new column called performance_category using case_when() with the
following rules: score >= 4.5 is "Outstanding", score >= 3.5 is "Exceeds
Expectations", score >= 2.5 is "Meets Expectations", otherwise "Needs
Improvement".
m) Create a column called experience_level that categorizes employees as "Entry" (1-
years), "Mid" (4-7 years), "Senior" (8-12 years), or "Expert" (13+ years).
n) Create a column called is_high_performer that is TRUE if the employee has both
performance_score > 4.0 AND projects_completed >= 10.
```
#### Question 1.5: Aggregation and Grouping (15 points)

```
o) Calculate the following summary statistics for the entire company: total number of
employees, average salary, average performance score, and total projects
completed.
```

p) Group by department and calculate: employee count, average salary, average
performance score, minimum and maximum years of experience.
q) Group by both department AND role, then calculate the average salary and count for
each combination. Which department-role combination has the highest average
salary?
r) Use group_by() with mutate() (not summarise) to add a column showing each
employee's salary as a percentage of their department's average salary. Who earns
the most relative to their department average?
s) Build a single pipeline that: filters to employees with 3+ years experience, groups by
department, calculates average performance score, arranges in descending order,
and returns only the top 3 departments by performance.


## Part 2: Social Network Analysis (45 points)

Use the _email_nodes.csv_ and _email_edges.csv_ files to analyze the company's internal
communication network.

#### Question 2.1: Network Construction and Visualization (10 points)

```
t) Load the igraph and RColorBrewer packages. Read in both CSV files.
u) Construct an undirected graph using graph.data.frame(). How many nodes and
edges does the network have?
v) Create a basic plot of the network. Then improve it by: removing vertex labels, sizing
nodes by the square root of their degree, and adjusting margins.
w) Create a visualization where node colors vary based on department. Include a
legend.
```
#### Question 2.2: Connected Components (8 points)

```
x) Use the components() function to identify connected components in the network.
How many components are there?
y) What is the size of the largest connected component? What percentage of
employees are in this component?
z) Create a subgraph containing only the nodes in the largest connected component.
Plot this subgraph.
aa) Why is it important to work with the largest connected component when calculating
centrality metrics like closeness?
```
#### Question 2.3: Centrality Metrics (15 points)

Using the largest connected component subgraph, calculate and analyze the following metrics:
bb) **Degree Centrality:** Calculate the degree of each node. Who are the top 5 most
connected employees? Create a visualization with node sizes proportional to degree.
cc) **Closeness Centrality:** Calculate closeness centrality. Who are the top 5 employees
by closeness? What does high closeness centrality indicate about an employee's
position in the network?
dd) **Betweenness Centrality:** Calculate betweenness centrality. Who are the top 5
employees by betweenness? Explain what betweenness measures and why these
employees might be important for information flow.
ee) **PageRank:** Calculate PageRank values. Who are the top 5 employees by
PageRank? How does PageRank differ from simple degree centrality?
ff) **Comparison:** Create a data frame comparing all four centrality metrics for the top 10
employees by degree. Are there any employees who rank highly on all metrics? Are
there any who rank high on one but low on others? What might explain these
differences?

#### Question 2.4: Community Detection (12 points)


gg) Apply the cluster_spinglass() algorithm to detect communities in the largest
connected component. Set a seed for reproducibility. How many communities were
detected?
hh) Create a table showing the number of employees in each community.
ii) Visualize the network with nodes colored by their community membership.
jj) Cross-tabulate community membership with department. Do the detected
communities align with the organizational structure (departments)? Discuss your
findings.
kk) What business insights might management gain from understanding these
communication communities?


## Part 3: Integration and Insights (10 points)

Combine your findings from Parts 1 and 2 to provide integrated business insights.

#### Question 3.1: Joining Data (5 points)

```
ll) Join the employee performance data with the network centrality metrics (degree,
betweenness, closeness, PageRank) using appropriate join functions.
mm) Is there a relationship between network centrality and performance score?
Calculate the correlation between degree centrality and performance_score.
nn) Identify employees who have high performance scores (>4.0) but low network
centrality (below median degree). What might this suggest?
```
#### Question 3.2: Executive Summary (5 points)

Write a brief executive summary (250-400 words) for TechConnect's management team
addressing:

- Key findings about employee performance across departments
- Important insights about the communication network structure
- Identification of key employees who serve as communication hubs
- At least 3 actionable recommendations based on your analysis


## Submission Requirements

Your group must submit the following files:

#### 1. R Script File (GroupX_Assignment1.R)

- Well-commented code organized by question number
- Clear section headers using comments (# --- Question 1.1 ---)
- Code must run without errors from start to finish
- Include all required package installations at the top (commented out)

#### 2. PDF Report (GroupX_Assignment1.pdf)

- Cover page with group name, member names, and student IDs
- Answers to each question with relevant code snippets and outputs
- All visualizations clearly labeled with titles and legends
- Written interpretations and explanations where required
- Executive summary in Part 3

## Grading Rubric

```
Component Points Percentage
Part 1: Data Wrangling with dplyr 45 45%
Part 2: Social Network Analysis 45 45%
Part 3: Integration and Insights 10 10%
TOTAL 100 100%
```
#### Grading Criteria

- **Code Correctness (40%):** Code runs without errors and produces correct results
- **Code Quality (20%):** Proper use of dplyr/igraph functions, efficient pipelines, clear
    variable names
- **Visualization (15%):** Clear, informative, and properly labeled visualizations
- **Interpretation (20%):** Accurate and insightful interpretation of results
- **Presentation (5%):** Professional formatting, organization, and clarity

## Academic Integrity

This is a group assignment. While you may discuss general concepts with other groups, all
submitted work must be your own group's original work. Plagiarism or code sharing between
groups will result in a score of zero for all parties involved.


**Permitted:** Using course materials, R documentation, Stack Overflow (with understanding)
**Not Permitted:** Sharing code with other groups, copying from previous semesters, using AI
tools without disclosure

## Tips for Success

9. Start early and divide tasks among group members
10. Review the lecture demo code before starting
11. Test your code incrementally as you write
12. Use set.seed() for reproducible results in network analysis
13. Comment your code to explain what each section does
14. Attend office hours if you have questions

### Good luck!


