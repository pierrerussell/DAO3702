## DBA3702 Advanced Data Wrangling

Chaithanya Bandi
NUS Department of Analytics & Operations


© Copyright National University of Singapore. All Rights Reserved.


GETTING STARTED
### Loading Data: Your First Step


The first step in any analysis: get your data into R. Whether you're loading from a URL or a local file path, the read.csv() function is your

entry point.


This loads a simulated retail dataset with weekly sales for two products across multiple stores and countries. In a real setting, this could be

your company's CRM export, a transaction log from your e-commerce platform, or survey responses downloaded from Qualtrics.


### Inspecting Data: The Three Essential Commands

Always run these three commands immediately after loading data. Think of them as your data health check—they reveal problems before

you invest time in analysis.



summary()


Quick overview of all variables


Look for: Min/max ranges, missing

values (NA's), factor levels



head()


First 6 rows of data


Look for: Does the data look right? Are

headers correct?



str()


Variable types and structure


Look for: Are numbers stored as

numbers? Are categories factors?


CATEGORICAL DATA
### Summarizing Categorical Data: table()


Frequency tables count how many times each category appears. This is the

starting point for understanding any categorical variable—from product

categories to customer segments to survey responses.


### Working with Table Objects

Tables in R are objects you can store, index, and manipulate just like vectors or data frames. This gives you tremendous flexibility for

custom analysis.





You can also plot tables directly using plot(p1.table). This produces a simple bar chart—a quick visual check before making something

publication-ready.


### Proportions with prop.table()

Raw counts are informative, but proportions are often more useful for comparison. When you want to know "what percentage" rather than

"how many," prop.table() is your tool.



Market Share Reporting


If each row represents a sale and the categories are brands, prop.table() gives you instant market share calculations. No Excel pivot

tables required.


### Row and Column Proportions in Two-Way Tables

Understanding the margin argument is critical for correct interpretation. Getting this wrong leads to incorrect business conclusions.



margin = 1


Proportions sum to 1 across each row



margin = 2


Proportions sum to 1 across each column


CORE METRICS
### Measures of Central Tendency & Spread


R provides individual functions for each descriptive statistic. These are your workhorses—you'll use them in virtually every analysis.


Pro Tip: Calling mean() on a binary 0/1 variable gives you the proportion of 1s. If p1prom is 0 or 1, mean(store.df$p1prom) is the

promotion rate. This is a handy shortcut.


### Spread Measures

Measures of spread tell you how much variability exists in your data. High variability means predictions are less certain; low variability

means the average is more representative.


### When to Use Which Statistic



Mean


Best for: Symmetric data,

calculating totals


Outlier sensitive? YES—one

extreme value shifts it


MAD



Median


Best for: Skewed data,

income, spending


Outlier sensitive? NO—

robust to extremes



SD (Standard
Deviation)


Best for: Symmetric data,

paired with mean


Outlier sensitive? YES



IQR


Best for: Skewed data,

paired with median


Outlier sensitive? NO—

robust



Best for: Very robust spread measure


Outlier sensitive? NO—most robust option


### Quantiles: Deeper Distribution Understanding

Quantiles (percentiles) let you ask questions like "What value separates the top 10% from everyone else?" or "What range contains the

middle 95% of observations?"


### The Power of summary()

The summary() function adapts to the data type automatically. For numeric variables, it returns the six-number summary. For factors, it

returns counts of each level.



This single command is the fastest way to audit an entire dataset. It reveals mins, maxes, quartiles, means, and NA counts in one function

call.


### The psych Package: Supercharged Descriptives

The psych package offers describe(), which provides more statistics than summary() including skewness, kurtosis, and standard error.


The describe() function returns: n, mean, sd, median, trimmed mean, mad, min, max, range, skew, kurtosis, and standard error. This is

especially useful for checking distribution shape before fitting statistical models.


VISUALIZATION
### Histograms: Seeing the Distribution


Histograms show the shape of a continuous variable's distribution. This is arguably the most important visualization in all of statistics.


Shape matters: Is the distribution symmetric or skewed? Unimodal or bimodal? Normal or heavy-tailed? These questions determine which

statistical methods are appropriate.


The default histogram works, but it's ugly and hard to interpret. We'll improve it step by step.


### Histograms: Adding Labels

Always label your plots. An unlabeled chart is meaningless to anyone but you. In

a business presentation, every axis needs a label and every chart needs a title.




### Histograms: More Bins and Color

The breaks argument controls how many bins appear. More bins reveal detail; fewer bins show the overall shape.



Rule of thumb: A good starting point for bins is the square root of n. For 2,000 observations, try approximately 45 bins. Then adjust

based on what reveals the most insight.


### Histograms: Density Scale with Curve Overlay

Adding a density curve helps you see the smooth underlying distribution beneath the histogram's binned data.


### Boxplots: The Five-Number Summary Visualized

Boxplots summarize a distribution with 5 numbers: min, Q1, median, Q3, max—

plus outliers as individual points. They're incredibly efficient for comparing

distributions.


### Reading a Boxplot

01


The Box


Spans Q1 to Q3 (the interquartile range). This contains the middle

50% of data.


03


The Whiskers


Extend to the most extreme data point within 1.5 × IQR of the box.



02


The Line


The thick line inside the box is the median (50th percentile).


04


The Dots


Points beyond the whiskers are potential outliers that deserve

investigation.


### Boxplots: Comparing Groups

The real power of boxplots is comparing distributions across groups. One visualization can replace a dozen summary tables.


### Boxplots: With Custom Axis Labels

Sometimes you need to override default axis labels to make your chart business-ready. The yaxt = "n" trick gives you full control.





This is essential when your factor levels are coded as 0/1 but you want to display "Yes"/"No" for clarity.


### Cumulative Distribution Function (ECDF)

The ECDF shows what percentage of observations fall below each value. It's perfect for answering questions like "What inventory level

covers 90% of demand?"


GROUP ANALYSIS
### Aggregating Data by Groups: by() and aggregate()


When you need summary statistics broken down by categories, R offers two main approaches. Understanding when to use each will save

you hours of frustration.










### The Formula Interface (Cleaner Syntax)

The formula interface makes aggregate() code more readable and maintainable. This is the professional standard for group-level analysis.





The formula reads naturally: "income by Segment" or "income by Segment and ownHome." This syntax scales beautifully to complex

analyses.


### aggregate() vs. by(): When to Use Which



Use aggregate() when:


- You want a data frame output

- You'll merge results with other data

- You need to plot or export the summaries

- You want clean, production-ready code



Use by() when:


- You're applying a complex custom function

- You just need to see results, not store them

- You want maximum flexibility

- Quick exploratory analysis


### Geographic Visualization with rworldmap

R can go beyond standard statistical plots to create geographic visualizations. This is powerful for multinational businesses that need to

visualize global performance.


### Creating the Map Visualization



Multinational companies routinely visualize sales, market share, or customer

counts on world maps. This code does in 6 lines what would take hours in Excel.


#### BIVARIATE ANALYSIS

The Business Case


In analytics, you are rarely interested in a single variable in isolation. Real business questions are always about relationships . Understanding

these connections separates strategic leaders from those making decisions in the dark.



Customer Risk
Assessment


"Does customer age

predict credit score?" →

Understand your customer

demographic risk profile



Location Strategy


"Does proximity to store

drive in-store spending?" →

Justify expensive real

estate decisions



Survey Validation


"Do satisfaction scores

correlate across

dimensions?" → Validate

survey instruments and

reduce respondent fatigue



Revenue Optimization


"What drives customer

lifetime value?" → Allocate

marketing budget to

highest-impact levers


### REAL-WORLD APPLICATION: RETAIL BANKING

Scenario: Customer Credit Risk Assessment


A mid-sized regional bank wants to understand its customer base better to optimize credit risk models and branch location strategy. They

maintain a comprehensive CRM system with rich demographic and behavioral data on active customers.



Available Data Assets


- Customer demographics (age, tenure)

- Credit metrics (credit score, payment history)

- Transaction behavior (store visits, online activity)

- Spatial data (distance to nearest branch)



Critical Business Questions


1. Do younger customers have lower credit scores? (Marketing:

target high-credit segments)

2. Does branch proximity increase store visits? (Operations:

justify expansion in dense areas)

3. Which factors correlate most with spending? (Product: build

bundles around drivers)



Why This Matters: Misallocating branch resources by 20% costs millions in lost revenue and wasted real estate investment.

Branch placement decisions are irreversible for 10+ year leases.


### REAL-WORLD APPLICATION: E-COMMERCE OPERATIONS

Scenario: Channel Optimization for Omnichannel Retailer


An online-first retailer has introduced physical stores and wants to understand how customers split spending across channels. The stakes

are high: store placement is irreversible, and understanding channel behavior determines multi-million dollar real estate decisions.



Customer Behavior Data


- Online spending: $0–$5,000 per customer annually

- Store spending: $0–$3,000 per customer annually

- Distance to nearest store: 0–50 miles

- Customer satisfaction: 1–5 Likert scale across dimensions



Strategic Questions


1. Is there a tradeoff between online and store spending (channel

substitution)?

2. Do customers 30+ miles away never visit stores (identify

distance threshold)?

3. Do satisfaction with "selection" and "service" correlate

(operational efficiency)?



Why This Matters: Store placement is irreversible. A poor location costs years of losses. Satisfaction data determines customer

retention strategies worth millions in lifetime value.


### REAL-WORLD APPLICATION: HUMAN RESOURCES ANALYTICS

Scenario: Faculty Salary & Career Progression


A university tracks faculty salary, rank, and discipline to ensure compensation equity and competitiveness. With increasing transparency

requirements and potential litigation risks, understanding these relationships has become mission-critical for HR leadership.


Compensation Data




- Salary: $40,000–$230,000 annually

- Years since Ph.D.: 0–60 years

- Rank: Assistant, Associate, Full Professor

- Discipline: Engineering, Business, Liberal Arts


Critical Questions


1. Does seniority (years since Ph.D.) justify salary differences?

2. Do STEM fields earn significantly more?

3. Are there gender pay gaps controlling for rank and experience?



Why This Matters: Compensation transparency is now a

legal and ethical requirement. Understanding these

relationships prevents costly litigation, maintains faculty

morale, and ensures competitive hiring. A single

discrimination lawsuit can cost millions in settlements and

reputational damage.


### REAL-WORLD APPLICATION: MARKET RESEARCH

Scenario: Product Satisfaction & Net Promoter Score


A software company surveys customers across multiple satisfaction dimensions to understand what drives loyalty and recommendations.

The goal: identify which investments yield the highest impact on customer advocacy.



Survey Dimensions


- Product quality (1–5 scale)

- Support responsiveness (1–5 scale)

- Pricing fairness (1–5 scale)

- Net Promoter Score: "Would you recommend us?" (0–10 scale)



Business Questions


1. Which single attribute drives NPS most strongly? (Resource

allocation)

2. Are satisfaction dimensions independent or redundant?

(Reduce survey length)

3. Do ordinal (Likert) scales give same insights as other methods?

(Validation)



Why This Matters: Survey redesigns save time and improve response rates. Wrong correlations lead to wasteful product

development. Understanding what truly drives recommendations determines where to invest product development dollars.


PART 1
###### LOADING & PREPARING CRM DATA

Loading the Customer Dataset


Our primary teaching dataset comes from a bank's customer relationship management (CRM) system. It contains transactional and demographic data on

1,000 active customers—a realistic sample size for mid-market business analytics.



What This Code Does


- Fetches a real CRM dataset (publicly hosted for teaching)

- Loads it as a data frame in R memory

- str() shows internal structure: variable names, types (numeric,

character, integer), first few values



Business Interpretation


- 1,000 observations: Our universe of active customers

- Mixed data types: IDs are integers, spending is numeric (decimals),

satisfaction is ordinal (1–5)

- NA values in satisfaction: Not all customers responded to surveys

(selection bias warning!)


###### Expected Dataset Structure

When you run str(cust.df), you'll see the internal structure revealing 1,000 customer observations across 12 variables. Understanding this structure is

critical before any analysis.



Notice the NA values in satisfaction variables—this is realistic! Not all customers complete surveys, introducing potential selection bias we must

acknowledge in our analysis.


CRITICAL: Converting IDs to Factors

The Problem


The cust.id variable is currently stored as an integer (1, 2, 3, ..., 1000). This is technically correct but analytically dangerous . R might accidentally include customer IDs

in correlations or models, producing nonsensical results.



Before Conversion



The Solution









Why This Matters: Prevents accidental numeric calculations on categorical variables. Makes code intent crystal clear: "This is an identifier, not a

measurement." Saves hours of debugging downstream. Best practice in any statistical analysis.


PART 2
BASIC SCATTERPLOTS WITH ENHANCED CUSTOMIZATION

The Simplest Scatterplot


We begin with R's most basic visualization: the scatterplot. This foundational tool reveals relationships between two continuous variables at a glance.



What You See


- X-axis: Customer age (40–50 years, mostly)

- Y-axis: Credit score (690–730, tightly clustered)

- Points: 1,000 customers, one per point

- Pattern: Maybe a very slight positive relationship? Hard to tell with default

settings.



Business Question


"Do older customers have better credit?"


- If yes → Target older demographics for premium products

- If no → Age-based targeting is waste of marketing budget


















Enhanced Scatterplot: Business-Ready Version


Transform a basic plot into a professional visualization ready for executive presentations. Each customization serves a specific analytical or communication purpose.



What Changed


1. Colors: Blue instead of black → Professional appearance
2. Point shape: pch=16 gives solid circles → Easier to see overplotting
3. Axis limits: Zoom to relevant ranges → Reveals subtle patterns
4. Labels: Business terminology → Stakeholders understand instantly



Output Interpretation


- Credit scores are tightly clustered (690–730)

- Age shows minimal relationship with credit score

- Most customers age 40–50

- Actionable insight: Age is not a primary driver of credit quality in this cohort


Adding a Regression Line


A regression line transforms a cloud of points into a clear directional statement. It quantifies the relationship and makes the trend immediately visible to non-technical stakeholders.





What This Does


- lm(credit.score ~ age): Fits a line: credit.score = intercept + slope×age

- abline(): Draws that line on the plot in red with thickness lwd=2



Interpreting the Line


- Slopes upward: Older → higher credit (positive relationship)

- Slopes downward: Older → lower credit (negative relationship)

- Nearly flat: Age has no relationship (correlation near zero)



In This Case: The line is nearly flat → Age does NOT predict credit score. Business Decision: Don't use age as primary credit filter. Focus resources on variables that actually
matter.


PART 3
### HANDLING SKEWED BUSINESS DATA

Why Business Data is Almost Always Right-Skewed


Most real-world business metrics exhibit right-skew (long right tail). This is not a data quality problem—it's a natural property of positive
valued metrics where most values cluster low but a few extreme values exist.



Customer
Spending


Many customers

spend little; few

spend a lot. The

80/20 rule in action.



Transaction
Revenue


Many low-value

transactions; few

high-value ones

drive

disproportionate

revenue.



Website Visits


Many users visit

once; power users

visit daily creating

extreme outliers.



Income
Distribution


Many earn $50K–

$100K; few earn

$500K+ creating

long tail.


###### Detecting Skewness: The Histogram

Before attempting any correlation analysis on spending data, visualize the distribution. The histogram reveals the true shape and helps you choose

appropriate analytical methods.



What You See


- X-axis: Spending from $0 to $3,500

- Y-axis: Number of customers in each $100 bucket

- Shape: Tall bar on the left (small spenders), long tail to the right (big

spenders)

- This is a right-skewed distribution



Business Implication


- Mean spending >> Median spending (outliers pull average up)

- Average-based decision-making is misleading

- Need robust methods that aren't fooled by outliers

- Transformation required for meaningful correlation analysis


The Problem: Plotting Skewed Variables Without Transformation


When both variables are heavily right-skewed, a standard scatterplot becomes unreadable. The bulk of your data compresses into an invisible corner while outliers dominate
the visual space.













Why? The scale is driven by the handful of extreme outliers. The bulk of your customers—where the real business patterns lie—are compressed into invisible
clusters.


The Solution: Log Transformation


Log transformation is the standard tool for visualizing and analyzing skewed business data. It compresses large values and expands small values, revealing

relationships hidden in the original scale.



What Changed


- Axes now logarithmic (10, 100, 1000, not 0, 1000, 2000)

- Small spenders ($0–$500) spread across half the graph

- Large spenders ($1,000–$3,000) spread across other half

- Suddenly, the relationship is visible!



Key Insight


Log transformation compresses large values and expands small values, making

skewed data readable and relationships visible.


When to Use Log Transformation

- Variables with positive values only

- Values span multiple orders of magnitude

- Business context makes multiplicative sense


###### The Mathematics Behind Log Transformation

Understanding why logarithms work requires thinking about ratios rather than differences. This matches how business people naturally think about change.



Linear Scale Thinking



Log Scale Thinking





A $10 increase means everything to a $1 customer but nothing to a $1000

customer.





"Stores 2x further away have 70% less spending" is more meaningful than

"$200 less spending"


Handling Zeros: log(0) = -Inf (undefined!), log(1) = 0 (safe, interprets as "no spending"). Always add 1 before logging to handle zero values:

log(spending + 1)


PART 4
##### MULTI-PANEL PLOTS WITH par(mfrow=)

Why Compare Multiple Relationships Simultaneously?


A single relationship examined in isolation can be misleading or incomplete. You need

context to make sound business decisions. Multi-panel plots provide that critical

context at a glance.



Example: "Distance affects
spending"


This statement is incomplete without

context:


- Which type of spending? Store vs.

online behave differently

- Is effect consistent? Same for both

channels?

- Does scale matter? Relationship

change on log scale?



What Multi-Panel Plots Reveal


A 2×2 grid answers these questions

instantly:


- Compare relationships across

different variables

- Test robustness across

transformations

- Identify patterns vs. scale artifacts

- Communicate multiple insights

efficiently


Creating Multi-Panel Plots


The par(mfrow=) function divides your plot window into a grid, allowing systematic comparison of related relationships. This is essential for comprehensive analysis.


### Interpreting Multi-Panel Analysis



What You See


- Top row (linear scale): Points clustered at bottom; relationship

unclear

- Bottom row (log scale): Clear pattern emerges; trends visible

- Left column (store): Strong negative slope (distance → less

store spending)

- Right column (online): Weaker or no relationship (distance

doesn't affect online)



Critical Insights


1. Distance drives store spending: Customers near stores visit

more

2. Distance doesn't drive online spending: E-commerce is

channel-agnostic

3. Log scale was essential: Revealed patterns hidden in linear

scale



Business Decision: Store
Locations


Stores are assets; their location matters.

ROI question: Does revenue increase

justify real estate cost at key distances?



Business Decision: Online
Channel


Online channel not cannibalized by

physical proximity. Online campaigns

work equally well in remote areas.



Analysis Lesson


Always check both scales; let data

speak. The transformation revealed

truth hidden in original scale.


PART 5
### SCATTERPLOT MATRICES WITH pairs() AND scatterplotMatrix()

The Limitation of Individual Plots


We've examined relationships between two variables: age & credit, distance &

spending, etc. But real business problems involve 10+ variables simultaneously.

Creating 45 individual plots (all possible pairs) is inefficient and hides the big

picture patterns.


Solution: A scatterplot matrix shows all pairwise relationships

simultaneously in a single comprehensive visualization. This is essential

for exploratory data analysis in business contexts.


Basic Scatterplot Matrix with pairs()


The pairs() function creates a grid showing every variable plotted against every other variable. This comprehensive view reveals patterns you might miss examining relationships one at a
time.



What You See


- 6 × 6 grid: 36 plots total (15 unique + 6 diagonals + symmetry)

- Diagonal cells: Histograms of each variable (distribution shape)

- Lower triangle: Scatterplots of each pair

- Upper triangle: Same plots, flipped (symmetric for visual balance)


Which relationships are strongest?


Look for tightest ellipse patterns


Are there outliers?


Spot lone points far from clusters



Reading the Matrix


Find row "age" and column "credit.score": You're looking at how age predicts credit score.


Find row "store.spend" and column "distance.to.store": You're examining distance effect
on store spending.


Which variables are skewed?


Examine histogram shape on diagonal


Are relationships linear?


Tight ellipse = linear; fan shape = curved


Enhanced Scatterplot Matrix with car Package


The car package (Companion to Applied Regression) provides scatterplotMatrix(), which adds professional features: regression lines, better styling, and flexible

diagonal displays.



Regression Lines


Each plot shows the linear trend

(helps spot relationships

immediately)



Better Aesthetics


Colors, fonts, spacing optimized for

readability



Diagonal Options


Histograms show actual

distributions, not just point clouds



Outlier Detection


Unusual points stand out clearly

with better contrast


### Business Interpretation of Scatterplot Matrix

The real power of scatterplot matrices emerges when you interpret visual patterns in business terms. Each pattern has strategic

implications.



No Regression Slope


Variable doesn't predict the other—don't waste resources on this

relationship


Spread Around Line


Noisy relationship with many exceptions—predictions will be

uncertain



Steep Slope


Strong predictor—this is a lever you can pull to influence

outcomes


Curved Pattern


Relationship isn't linear—transformation might help reveal true

pattern


PART 6
##### CORRELATION COEFFICIENTS & HYPOTHESIS TESTS

What is Correlation?


Correlation quantifies the strength and direction of a linear relationship between two variables. It's one of the most fundamental concepts in business

analytics, but also one of the most misunderstood.


# -1

Perfect Negative


As x increases, y decreases proportionally


Key Properties


- Ranges from –1 to +1 (bounded scale)

- 0 = no linear relationship

- +1 = perfect positive relationship

- –1 = perfect negative relationship


# 0

No Relationship


Variables are independent


# +1

Perfect Positive


As x increases, y increases proportionally



Critical Limitation: Correlation ONLY captures linear

relationships. A curved or complex pattern might have

correlation near 0 even if a strong relationship exists!




- 0.5 or 0.8 = "some relationship" (context determines significance)


Calculating a Single Correlation


Let's test a specific business hypothesis: Does customer age predict credit score? The cor.test() function provides both the correlation coefficient and statistical significance.









Interpreting Each Component


1. r = 0.030 (correlation coefficient)


- Very small positive relationship (nearly zero)

- Knowing age tells you almost nothing about credit score

- Business decision: Don't use age as credit filter

2. p-value = 0.340 (hypothesis test)


- 34% chance of seeing this correlation if NO true relationship

- Threshold: p < 0.05 is "statistically significant"

- Verdict: This correlation is NOT significant



3. 95% CI: [–0.031, 0.089]


- 95% confident true population correlation is in this range

- Zero is in interval (supporting p > 0.05)

- Range doesn't include strong effects (–0.5 or +0.8)


Business Translation: Even if age and credit were related in the true population,
the relationship is too weak to act on. Better allocate marketing dollars to variables
that actually correlate with behavior.


###### Correlation Matrix: Multiple Relationships at Once

For serious business analysis, you need correlations between all numeric variables simultaneously . A correlation matrix provides this comprehensive view

efficiently.





How to Read This: Each cell (row, column) is a correlation. Diagonal is always 1.000 (a variable correlates perfectly with itself). Matrix is symmetric

(distance→spending = spending→distance).


###### Handling Missing Data: use="complete.obs"

Our satisfaction variables have many NAs (not all customers responded to surveys). R's default behavior with missing data can silently ruin your analysis—

you must be explicit.



The Problem



Trade-off


- use="complete.obs": Sample size shrinks but data is clean

- Default behavior: Analysis fails if any NA appears



The Solution



Business Implication


- Survey non-response reduces sample for satisfaction analysis

- Decision: Report sample size explicitly ("Based on 800 responding

customers...")

- Investigate non-response bias (Are high spenders less likely to

answer?)


Installing and Using corrplot


The corrplot package provides publication-quality correlation visualizations with extensive customization options. It's essential for any serious business analysis workflow.



Large Circles

Strong relationships (r close to ±1)



Small Circles

Weak relationships (r close to 0)



Blue Circles

Positive correlations (both variables increase
together)



Red Circles

Negative correlations (one increases, other
decreases)


Alternative Visualization Methods


The corrplot package offers multiple visualization methods. Choose based on your audience and purpose: presentations favor visuals, reports favor precision, publications combine
both.



Ellipse Method


Best for presentations—visual appeal, no clutter,
patterns obvious



Number Method


Best for reports—exact values visible, precision for
technical audience



Mixed Method


Best for publications—combines precision and visual
appeal elegantly


Business-Ready Corrplot with Full Customization


Create a publication-quality correlation visualization with professional styling, intelligent variable ordering, and export capability.



Key Customizations


1. order = "hclust": Variables reordered so similar variables cluster together (makes patterns
even more obvious)
2. Custom colors: red (negative) → white (zero) → blue (positive), intuitive color mapping
3. Saved as PNG: png() and dev.off() save high-resolution image for reports



Related variables (store.spend, store.trans) naturally sit next to each other when using
hierarchical clustering. This automatic grouping reveals the structure of your data.


PART 8
### DATA TRANSFORMATIONS & REVEALING HIDDEN RELATIONSHIPS

Why Transformation Matters


Sometimes, a strong relationship exists but isn't linear . A curved or inverse relationship produces low Pearson correlation even when the

business relationship is powerful and actionable.



Example: Distance Effect


Distance to store has a non-linear effect on spending:


- 1 mile away: High spending

- 5 miles away: Moderate spending

- 10 miles away: Low spending



True Relationship May Be


- 1/distance (inverse): Nearness matters

- 1/sqrt(distance) (square root inverse): Diminishing returns to

distance

- log(distance) (logarithmic): Proportional thinking



Linear correlation: r = –0.391 (moderate). Inverse correlation: r = ? (potentially much stronger if true relationship is inverse)


Testing Inverse Relationships


Test different mathematical transformations to discover which best captures the true business relationship. Each transformation represents a different theory about how variables relate.



Comparing Results


- Original distance: r = –0.391

- 1 / distance: r = +0.420

- 1 / sqrt(distance): r = +0.395



Interpretation


1/distance gives slightly stronger correlation (+0.420 vs –0.391). Suggests that "nearness"
(inverse of distance) is a better predictor.


Business insight: Proximity has a threshold effect (below ~3 miles, store is viable; beyond
~15 miles, customer rarely visits)


Visual Comparison: Original vs. Transformed


Always visualize transformations—numbers alone can mislead. The scatterplot reveals whether the transformation truly improves linearity or just creates mathematical artifacts.



Plot 1: Original


Clear funnel shape (small x-values have high variance in
y)



Plot 2: Inverse


Relationship tightens (ellipse shape, less funnel effect)



Plot 3: Sqrt Inverse


Similar to Plot 2 (sqrt doesn't help much in this case)


PART 9
### POLYCHORIC CORRELATION FOR ORDINAL DATA

The Problem: Treating Likert Scales as Numeric


Our satisfaction variables are ordinal (1 = poor, 2 = fair, 3 = good, 4 = very good, 5 = excellent). Standard Pearson correlation treats these

as continuous numbers, which is technically incorrect and can bias results.





Problem 1: Continuity


Pearson assumes

continuous data (0.5

meaningful between 0 and 1)



Problem 2: Discrete
Nature


Likert is discrete ordinal (no

meaningful value between

"good" and "very good")



Problem 3: Unequal
Gaps


Gap 1→2 might feel very

different from gap 4→5 to

respondents



Problem 4: Bias


Result: Pearson correlation

is biased (too conservative

for Likert data)


Polychoric Correlation: The Correct Approach


Polychoric correlation accounts for the ordinal nature of survey data by modeling an underlying continuous latent variable. This gives more accurate relationship estimates.







Interpreting Results


- Polychoric r = 0.156 (very similar to Pearson r = 0.143 in this case)

- Suggests "satisfaction with service" and "satisfaction with selection" are nearly independent



Business Insight


A customer can be happy with service but unhappy with selection (or vice versa). These are distinct
dimensions.

Implication: Can't improve overall satisfaction by fixing one dimension alone; need multi-dimensional
approach.


###### KEY TAKEAWAYS & NEXT STEPS



Visualization Mastery


Create publication-quality

scatterplots, multi-panel

comparisons, and correlation

matrices


Avoid Pitfalls



Transformation Skills


Handle skewed business data

with log transformations and

reveal hidden patterns



Statistical Rigor


Calculate correlations, interpret

p-values, choose appropriate

methods for data types


Next Steps



Business Application


Apply these tools to customer

analysis, location strategy,

compensation equity, survey

research



Recognize causation vs. correlation, handle outliers, use appropriate

methods for ordinal data



Apply these techniques to your own data. Build on this foundation with

multivariate analysis and predictive modeling


