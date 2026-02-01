
# --- Install packages if needed ---
# install.packages("dplyr")
# install.packages("tibble")
# install.packages("igraph")
# install.packages("RColorBrewer")

library(dplyr)
library(tibble)
library(igraph)
library(RColorBrewer)

# ==============================================================================
# PART 1: DATA WRANGLING (45 pts) test
# ==============================================================================

# --- Q1.1: Data Exploration (5 pts) ---

# a) Read in employees data
employees <- read.csv("data/employees.csv")

# b) Convert to tibble, show first 10 rows
employees <- as_tibble(employees)
print(employees, n = 10)

# c) Basic info about the dataset
cat("Rows:", nrow(employees), "\n")
cat("Columns:", ncol(employees), "\n")

sapply(employees, class)
summary(employees)

# --- Q1.2: Selecting and Filtering (8 pts) ---

# d) Select name, department, role, performance_score
employees %>%
  select(name, department, role, performance_score)

# e) Filter performance > 4.0
high_performers <- employees %>%
  filter(performance_score > 4.0)
high_performers

# f) Engineering or Marketing AND >5 years exp
employees %>%
  filter((department == "Engineering" | department == "Marketing") & years_exp > 5)

# g) Select helpers - columns with "score" or starting with "p"
employees %>%
  select(contains("score") | starts_with("p"))

# --- Q1.3: Sorting and Ranking (7 pts) ---

# h) Top 5 by salary
employees %>%
  arrange(desc(salary)) %>%
  head(5)

# i) Sort by department then performance (desc)
employees %>%
  arrange(department, desc(performance_score))

# j) Lowest salary per department
employees %>%
  arrange(department, salary) %>%
  group_by(department) %>%
  slice_head(n = 1) %>%
  ungroup()

# --- Q1.4: Creating New Variables (10 pts) ---

# k) Salary per year of experience
employees %>%
  mutate(salary_per_year_exp = salary / years_exp) %>%
  select(name, salary, years_exp, salary_per_year_exp)

# l) Performance category
employees %>%
  mutate(performance_category = case_when(
    performance_score >= 4.5 ~ "Outstanding",
    performance_score >= 3.5 ~ "Exceeds Expectations",
    performance_score >= 2.5 ~ "Meets Expectations",
    TRUE ~ "Needs Improvement"
  )) %>%
  select(name, performance_score, performance_category)

# m) Experience level
employees %>%
  mutate(experience_level = case_when(
    years_exp <= 3 ~ "Entry",
    years_exp <= 7 ~ "Mid",
    years_exp <= 12 ~ "Senior",
    TRUE ~ "Expert"
  )) %>%
  select(name, years_exp, experience_level)

# n) High performer flag
employees %>%
  mutate(is_high_performer = performance_score > 4.0 & projects_completed >= 10) %>%
  filter(is_high_performer) %>%
  select(name, department, performance_score, projects_completed)

# --- Q1.5: Aggregation and Grouping (15 pts) ---

# o) Company summary stats
employees %>%
  summarise(
    total_employees = n(),
    avg_salary = mean(salary),
    avg_performance = mean(performance_score),
    total_projects = sum(projects_completed)
  )

# p) Group by department
employees %>%
  group_by(department) %>%
  summarise(
    count = n(),
    avg_salary = mean(salary),
    avg_perf = mean(performance_score),
    min_exp = min(years_exp),
    max_exp = max(years_exp)
  )

# q) Group by department AND role
dept_role <- employees %>%
  group_by(department, role) %>%
  summarise(avg_salary = mean(salary), count = n(), .groups = "drop") %>%
  arrange(desc(avg_salary))
dept_role
# Highest avg salary combo:
dept_role %>% head(1)

# r) Salary as % of department average
employees %>%
  group_by(department) %>%
  mutate(
    dept_avg = mean(salary),
    pct_of_avg_salary = salary / dept_avg * 100
  ) %>%
  ungroup() %>%
  arrange(desc(pct_of_avg_salary)) %>%
  select(name, department, salary, dept_avg, pct_of_avg_salary)

# s) Pipeline: 3+ yrs exp, group by dept, avg perf, top 3
employees %>%
  filter(years_exp >= 3) %>%
  group_by(department) %>%
  summarise(avg_perf = mean(performance_score)) %>%
  arrange(desc(avg_perf)) %>%
  head(3)

# ==============================================================================
# PART 2: SOCIAL NETWORK ANALYSIS (45 pts)
# ==============================================================================

# --- Q2.1: Network Construction (10 pts) ---

# t) Load network data
email_edges <- read.csv("data/email_edges.csv")
email_nodes <- read.csv("data/email_nodes.csv")

head(email_nodes)
head(email_edges)

# u) Build undirected graph
email_graph <- graph.data.frame(email_edges, vertices = email_nodes, directed = FALSE)

cat("Nodes:", vcount(email_graph), "\n")
cat("Edges:", ecount(email_graph), "\n")

# v) 
deg <- degree(email_graph)
plot(email_graph, vertex.label = NA, vertex.size = sqrt(deg) * 3,
     edge.width = 0.5, main = "Improved Plot")

# w) Color by department
depts <- V(email_graph)$department
unique_depts <- unique(depts)
colors <- brewer.pal(length(unique_depts), "Set1")
names(colors) <- unique_depts

plot(email_graph, vertex.label = NA, vertex.size = sqrt(deg) * 3,
     vertex.color = colors[depts], edge.width = 0.5,
     main = "By Department")
legend("topright", unique_depts, fill = colors, cex = 0.7, bty = "n")

# --- Q2.2: Connected Components (8 pts) ---

# x) Find components
comp <- components(email_graph)
cat("Number of components:", comp$no, "\n")

# y) Largest component size
lcc_size <- max(comp$csize)
cat("Largest component size:", lcc_size, "\n")
cat("Percentage:", round(lcc_size / vcount(email_graph) * 100, 1), "%\n")

# z) Extract largest component
lcc_id <- which.max(comp$csize)
lcc_nodes <- which(comp$membership == lcc_id)
lcc <- induced_subgraph(email_graph, lcc_nodes)

cat("LCC nodes:", vcount(lcc), "edges:", ecount(lcc), "\n")

# Plot it
deg_lcc <- degree(lcc)
depts_lcc <- V(lcc)$department
par(mar = c(1, 1, 2, 5))
plot(lcc, vertex.label = NA, vertex.size = sqrt(deg_lcc) * 3,
     vertex.color = colors[depts_lcc], edge.width = 0.5,
     main = "Largest Connected Component")
legend("topright", unique_depts, fill = colors, cex = 0.7, bty = "n")

# aa) Why use LCC for centrality?
# Closeness requires all nodes to be reachable. If the graph is disconnected,
# you get infinite distances which messes up the calculation. So we use the
# largest component to get meaningful centrality values.

# --- Q2.3: Centrality Metrics (15 pts) ---

# bb) Degree centrality
deg_cent <- degree(lcc)
deg_df <- data.frame(id = as.integer(V(lcc)$name), degree = deg_cent) %>%
  left_join(employees %>% select(employee_id, name), by = c("id" = "employee_id")) %>%
  select(id, name, degree) %>%
  arrange(desc(degree))
head(deg_df, 5)

# Visualize
par(mar = c(1, 1, 2, 5))
plot(lcc, vertex.label = V(lcc)$name, vertex.label.cex = 0.5,
     vertex.size = 2 * sqrt(deg_cent), vertex.color = colors[depts_lcc],
     edge.width = 0.5, main = "Sized by Degree")
legend("topright", unique_depts, fill = colors, cex = 0.6, bty = "n")

# cc) Closeness
close_cent <- closeness(lcc, normalized = TRUE)
close_df <- data.frame(id = as.integer(V(lcc)$name), closeness = close_cent) %>%
  left_join(employees %>% select(employee_id, name), by = c("id" = "employee_id")) %>%
  select(id, name, closeness) %>%
  arrange(desc(closeness))
head(close_df, 5)
# High closeness = can reach everyone quickly, good for spreading info

# dd) Betweenness
btw_cent <- betweenness(lcc, normalized = TRUE)
btw_df <- data.frame(id = as.integer(V(lcc)$name), betweenness = btw_cent) %>%
  left_join(employees %>% select(employee_id, name), by = c("id" = "employee_id")) %>%
  select(id, name, betweenness) %>%
  arrange(desc(betweenness))
head(btw_df, 5)
# High betweenness = sits on many shortest paths, controls info flow

# ee) PageRank
pr <- page_rank(lcc)$vector
pr_df <- data.frame(id = as.integer(V(lcc)$name), pagerank = pr) %>%
  left_join(employees %>% select(employee_id, name), by = c("id" = "employee_id")) %>%
  select(id, name, pagerank) %>%
  arrange(desc(pagerank))
head(pr_df, 5)
# PageRank considers who you're connected to, not just how many connections

# ff) Compare all metrics for top 10 by degree
all_cent <- data.frame(
  id = as.integer(V(lcc)$name),
  degree = deg_cent,
  closeness = close_cent,
  betweenness = btw_cent,
  pagerank = pr
) %>%
  left_join(employees %>% select(employee_id, name, department, role),
            by = c("id" = "employee_id")) %>%
  select(id, name, dept = department, role, degree, closeness, betweenness, pagerank)

top10 <- all_cent %>% arrange(desc(degree)) %>% head(10)
top10

# Add ranks
top10 <- top10 %>%
  mutate(
    deg_rank = rank(-degree),
    close_rank = rank(-closeness),
    btw_rank = rank(-betweenness),
    pr_rank = rank(-pagerank)
  )
top10 %>% select(id, name, deg_rank, close_rank, btw_rank, pr_rank)

# --- Q2.4: Community Detection (12 pts) ---

# gg) Spinglass clustering
set.seed(42)
comm <- cluster_spinglass(lcc)
cat("Communities found:", length(comm), "\n")

# hh) Size of each community
mem <- membership(comm)
table(mem)

# ii) Plot by community
num_comm <- length(unique(mem))
comm_colors <- brewer.pal(max(3, num_comm), "Set2")

par(mar = c(1, 1, 2, 5))
plot(lcc, vertex.label = V(lcc)$name, vertex.label.cex = 0.5,
     vertex.size = 10, vertex.color = comm_colors[mem],
     edge.width = 0.5, main = "By Community")
legend("topright", paste("Comm", 1:num_comm), fill = comm_colors[1:num_comm],
       cex = 0.6, bty = "n")

# jj) Cross-tab community vs department
comm_dept <- data.frame(
  id = as.integer(V(lcc)$name),
  community = mem,
  department = V(lcc)$department
) %>%
  left_join(employees %>% select(employee_id, name), by = c("id" = "employee_id"))
xtab <- table(comm_dept$community, comm_dept$department)
xtab
prop.table(xtab, 1) * 100

# Communities are completely made up of single department.


# kk) Business insights:
# - Communities show how info actually flows (not just org chart)
# - People bridging communities are valuable for coordination
# - If a community is all one dept, might be a silo problem

# ==============================================================================
# PART 3: INTEGRATION (10 pts)
# ==============================================================================

# --- Q3.1: Joining Data (5 pts) ---

# ll) Join employee data with centrality metrics
cent_df <- data.frame(
  employee_id = as.integer(V(lcc)$name),
  degree = degree(lcc),
  closeness = closeness(lcc, normalized = TRUE),
  betweenness = betweenness(lcc, normalized = TRUE),
  pagerank = page_rank(lcc)$vector
)

combined <- employees %>%
  inner_join(cent_df, by = "employee_id")

combined %>%
  select(employee_id, name, department, performance_score,
         degree, closeness, betweenness, pagerank) %>%
  head(10)

# mm) Correlation between centrality and performance
cor(combined$degree, combined$performance_score)
cor(combined$closeness, combined$performance_score)
cor(combined$betweenness, combined$performance_score)
cor(combined$pagerank, combined$performance_score)

# nn) High performers with low network centrality
med_deg <- median(combined$degree)
combined %>%
  filter(performance_score > 4.0 & degree < med_deg) %>%
  select(employee_id, name, department, role, performance_score, degree, projects_completed) %>%
  arrange(desc(performance_score))

# These are solid performers who just aren't super connected. Could be
# independent contributors or specialists. Management should make sure
# they don't get overlooked for promotions just because they're quieter.

# --- Additional stuff for executive summary ---

# Top performers by combined performance + network
combined %>%
  mutate(perf_rank = rank(-performance_score), deg_rank = rank(-degree)) %>%
  arrange(perf_rank + deg_rank) %>%
  select(name, department, role, performance_score, degree) %>%
  head(5)

# Dept summary with network metrics
combined %>%
  group_by(department) %>%
  summarise(
    avg_perf = mean(performance_score),
    avg_deg = mean(degree),
    avg_btw = mean(betweenness),
    n = n()
  )

# Communication hubs
combined %>%
  arrange(desc(betweenness)) %>%
  select(name, department, role, degree, betweenness, performance_score) %>%
  head(5)

# ==============================================================================
# Done!
# ==============================================================================
