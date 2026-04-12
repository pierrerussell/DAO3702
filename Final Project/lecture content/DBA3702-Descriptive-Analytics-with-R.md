## DBA3702: Descriptive Analytics with R Lecture 1: Analytics in the Age of AI

Chaithanya Bandi
NUS Department of Analytics & Operations


© Copyright National University of Singapore. All Rights Reserved.


### Agenda

01


The Analytics Landscape: Where
We Are Today


Understanding the current state of data

analytics and the AI revolution reshaping our

field


04


Tools of the Trade: The Modern
Analytics Stack


Discovering the technologies that power

today's data-driven organizations


07



02


The Three Pillars: Descriptive →
Predictive → Prescriptive


Exploring the progression from

understanding what happened to

recommending what to do


05


AI-Assisted Analytics: The New
Paradigm


Examining how artificial intelligence is

transforming the analytics profession



03


The Analytics Workflow: CRISP-DM
Framework


Learning the industry-standard approach to

structuring analytics projects


06


What This Means for DBA3702


Understanding how this course prepares you

for the AI-augmented analytics landscape



Course Expectations & Getting Started


Setting up your environment and preparing for success in this course


# Part 1

### The Analytics Landscape

Understanding where we are in the evolution of data analytics and why this

moment is critical for your career


### Why Analytics Matters Now More Than Ever



The Data Explosion


We're experiencing unprecedented growth in data generation.

Global data creation reached approximately 120 zettabytes in

2023, with projections exceeding 180 zettabytes by 2025.

Remarkably, 90% of the world's data has been created in just the

last two years.


Organizations today face a paradox: they're drowning in data while

simultaneously starving for meaningful insights. The challenge isn't

collecting data—it's transforming that data into actionable

intelligence.



The AI Inflection Point


We've reached a watershed moment in artificial intelligence

adoption. ChatGPT achieved 100 million users in just two months

after its November 2022 launch—the fastest technology adoption

in history. Today, 65% of organizations use generative AI regularly,

up from just 33% in 2023.


According to Gartner's 2023 research, 79% of corporate

strategists view AI and analytics as critical to their success. This

isn't hype—it's fundamental business transformation.



The Skills Gap: Demand for analytics skills is growing 28% faster than average across all professions. The U.S. Bureau of Labor

Statistics projects 28,300 new operations research jobs by 2033, representing significant career opportunities for those with the

right skills.


#### The Evolution: From BI to AI-Augmented Analytics



1990s: Business Intelligence


Static reports and basic dashboards dominated.

Analysts spent weeks generating monthly reports

that were often outdated by the time they reached

decision-makers.







2010s: Big Data & Machine Learning


Hadoop, Spark, and Python/R transformed analytics

capabilities. Organizations could now process

massive datasets and build predictive models at

scale.


|Col1|1 2|Col3|3 4|Col5|
|---|---|---|---|---|
||||||



2000s: Data Warehousing


OLAP cubes and SQL analytics enabled faster

querying. Organizations consolidated data from

multiple sources, but analysis remained reactive

rather than predictive.



2020s: AI-Augmented Analytics


Large Language Models and AutoML democratize

analytics. Natural language interfaces allow anyone

to query data and generate insights, fundamentally

changing who can do analytics work.



Key Shift: We're moving from "What tool syntax do I need?" to "What question should I ask?" This
represents a fundamental change in how we approach analytics work.


The Gartner Analytic Ascendancy Model


Not all analytics are created equal. Gartner's framework helps us understand the progression from basic reporting to strategic optimization, with each level adding more value but requiring

greater sophistication.



Historical reporting, dashboards, and KPIs. This is where most organizations operate—

understanding past performance through aggregation and visualization.


Forecasting, machine learning models, and probability assessments. Using historical

patterns to anticipate future outcomes with quantified confidence.



Root cause analysis, drill-down capabilities, and pattern recognition. Moving beyond the

numbers to understand the underlying drivers of performance.


Optimization, simulation, and decision automation. Recommending specific actions to

achieve desired outcomes, often with automated execution.



Reality Check: Despite the promise of advanced analytics, fewer than 50% of organizations actively use predictive analytics, and only approximately 20% leverage machine

learning tools in production. There's enormous opportunity for those who master these capabilities.


# Part 2

### The Three Pillars of Analytics

Understanding the distinct but interconnected approaches to extracting value from data


Descriptive Analytics: What Happened?


Descriptive analytics forms the foundation of all data analysis. It involves examining historical data to understand past

performance and identify patterns that inform decision-making. This is where every analytics project begins—you must

understand what happened before you can predict what will happen or prescribe what should happen.


Core Questions Answered


- What were our sales last quarter?


- Which products are most popular with which customer segments?


- Where are our customers located geographically?


- What is our customer churn rate and how has it trended?


Key Techniques


- Data aggregation and summarization across dimensions


- Statistical measures: mean, median, variance, percentiles


- Data visualization to reveal patterns and anomalies


- Trend analysis and pattern recognition over time



Typical Outputs


- Interactive dashboards


- Executive reports


- Key Performance Indicators (KPIs)


- Data visualizations


Descriptive Analytics: Technical Components


Behind every insightful dashboard lies a foundation of statistical rigor and efficient data manipulation. Let's examine the mathematical and technical foundations that power descriptive analytics.


Statistical Foundations


Three fundamental statistical concepts underpin all descriptive analytics:


Mean: Central tendency of your data


Variance: Spread and variability


Correlation: Relationship strength between variables


Data Wrangling Operations



This Course Focus: We'll master these operations in R using the tidyverse, giving you a transferable mental model that applies across languages and tools.


Descriptive Analytics: Real-World Example

Netflix: Processing 1.3 Trillion Events Daily


Netflix exemplifies descriptive analytics at massive scale. Every interaction—from viewing patterns to browse behavior—generates data that feeds sophisticated analytics pipelines.


User Events Collection


      - Viewing patterns: start, stop, pause, rewind timestamps


      - Search queries and browse behavior


      - Device types and location metadata


      - Rating and review interactions


Descriptive Analytics Processing


      - Content performance dashboards by region and demographic


      - Regional viewing trend analysis


      - Peak usage pattern identification for infrastructure planning


      - A/B test results aggregation and visualization


Business Insights & Action


      - Content acquisition and production decisions


      - Recommendation algorithm refinement


      - Infrastructure capacity planning


      - Regional content library optimization


Impact: This descriptive analytics foundation enables Netflix's famous insight that 80% of content streamed comes from their recommendation system—a statistic that drives billions in value.


Predictive Analytics: The ML Pipeline


Building effective predictive models requires a systematic approach. The machine learning pipeline represents a structured workflow that data scientists follow to transform raw data

into actionable predictions.



01


Raw Data Collection


Gather relevant historical data from databases, APIs, files, or real-time streams. Data

quality at this stage determines model ceiling.


03


Model Training


Feed prepared data into algorithms that learn patterns. Split data into training and

validation sets to prevent overfitting.


05


Model Selection


Compare multiple models and choose based on performance, interpretability, and

deployment constraints. Often involves ensemble methods combining multiple models.



02


Feature Engineering


Transform raw variables into predictive features. This creative step—combining domain

knowledge with data exploration—often determines model success more than algorithm

choice.


04


Model Evaluation


Assess performance using appropriate metrics. For classification: Accuracy, Precision,

Recall, F1, AUC-ROC. For regression: MAE, MSE, RMSE, R², MAPE.


06


Deploy & Monitor


Put the model into production and continuously monitor for drift. Real-world data

changes; models must be retrained regularly to maintain accuracy.



Critical Insight: Model selection matters less than feature engineering and data quality. A simple model with great features often outperforms complex algorithms with poor

features.


Predictive Analytics: Algorithm Selection Guide


Choosing the right algorithm is like selecting the right tool for a job. Each has strengths, weaknesses, and ideal use cases. Here's a practical guide for the most common scenarios.





















XGBoost Dominance: Gradient boosting algorithms like XGBoost win the majority of Kaggle competitions for structured data. They're the go-to choice when accuracy matters most and you have sufficient training data.


### Prescriptive Analytics: What Should We Do?



Prescriptive analytics represents the pinnacle of analytical

maturity. It goes beyond predicting what will happen to

recommending optimal actions. Using mathematical optimization,

simulation, and decision analysis, prescriptive analytics identifies

the best course of action given constraints and objectives.


This is where analytics directly drives strategy and operations,

often automating complex decisions that once required human

judgment.


Core Questions Answered


- How should we price products to maximize revenue while

maintaining market share?


- What's the optimal delivery route to minimize cost and time?


- How should we allocate marketing budget across channels?


- Which portfolio maximizes return for given risk tolerance?



Key Techniques


- Mathematical Optimization (Linear Programming, Mixed Integer

Programming)


- Simulation (Monte Carlo, Agent-Based Modeling)


- Decision Analysis (Decision Trees, Expected Value)


- Reinforcement Learning (Learning optimal policies through trial)


Typical Outputs


- Recommended actions with quantified impact


- Optimal schedules and resource allocations


- Risk-adjusted portfolio recommendations


- Automated pricing and inventory decisions


### Comparing the Three Analytics Types









Most organizations remain at the descriptive and diagnostic stages. According to Gartner, only approximately 12.5% have mature

predictive or prescriptive analytics capabilities. This represents a significant opportunity for competitive advantage.


How the Three Pillars Work Together


In practice, descriptive, predictive, and prescriptive analytics form an interconnected workflow. Let's see how they combine in a real retail scenario.

|Descriptive: Understanding the Past<br>Analysis: "Last month, Store A sold 500 units of Product X. Sales consistently peak on weekends,<br>with the highest volumes occurring in December during the holiday season."<br>Value: Establishes baseline understanding and identifies patterns.<br>Prescriptive: Recommending Action<br>Analysis: "Order 620 units on January 15 for delivery by January 22. Allocate 40% of inventory to<br>weekend displays based on peak demand patterns. This strategy yields expected revenue of $X<br>with stockout risk reduced below 5%, while minimizing excess inventory costs."<br>Value: Provides specific, actionable recommendations with quantified tradeoffs.|Col2|
|---|---|
|Descriptive: Understanding the Past<br>Analysis: "Last month, Store A sold 500 units of Product X. Sales consistently peak on weekends,<br>with the highest volumes occurring in December during the holiday season."<br>Value: Establishes baseline understanding and identifies patterns.<br>Prescriptive: Recommending Action<br>Analysis: "Order 620 units on January 15 for delivery by January 22. Allocate 40% of inventory to<br>weekend displays based on peak demand patterns. This strategy yields expected revenue of $X<br>with stockout risk reduced below 5%, while minimizing excess inventory costs."<br>Value: Provides specific, actionable recommendations with quantified tradeoffs.|Predictive: Forecasting the Future<br>Analysis: "Based on historical patterns, weather forecasts, and promotional calendar, Store A will<br>likely sell 550-600 units next month. With current inventory of 480 units, there's a 23% probability<br>of stockout."<br>Value: Quantifies risk and provides early warning.|
|Descriptive: Understanding the Past<br>Analysis: "Last month, Store A sold 500 units of Product X. Sales consistently peak on weekends,<br>with the highest volumes occurring in December during the holiday season."<br>Value: Establishes baseline understanding and identifies patterns.<br>Prescriptive: Recommending Action<br>Analysis: "Order 620 units on January 15 for delivery by January 22. Allocate 40% of inventory to<br>weekend displays based on peak demand patterns. This strategy yields expected revenue of $X<br>with stockout risk reduced below 5%, while minimizing excess inventory costs."<br>Value: Provides specific, actionable recommendations with quantified tradeoffs.||



Key Insight: Each pillar builds on the previous one. You cannot predict without first describing. You cannot prescribe without first predicting. Mastering this progression is essential to analytics excellence.


# Part 3

### The Analytics Workflow

CRISP-DM Framework


Learning the industry-standard framework that guides successful analytics

projects from conception to deployment


#### CRISP-DM: The Industry Standard Framework

Cross-Industry Standard Process for Data Mining (CRISP-DM) remains the most widely adopted framework for structuring data science projects,

with over 49% adoption among practitioners. It provides a proven roadmap from business question to deployed solution.



Business Understanding


Define objectives and determine data mining

goals


Deployment


Implement solution, monitor, maintain,

document


Evaluation


Validate results against business objectives



Data Understanding


Collect, describe, explore, and verify data

quality


Data Preparation


Select, clean, construct features, integrate

sources


Modeling


Select techniques, build models, assess

performance



The framework is iterative by design. Insights from later stages often send you back to earlier phases. Evaluation might reveal you need more data.

Deployment might uncover business requirements you missed initially. This flexibility is a feature, not a bug.


CRISP-DM Phases Detailed


Let's examine each phase in depth, understanding the key activities and deliverables that ensure project success.















The 60-80 Rule: Data Preparation typically consumes 60-80% of project time. This isn't inefficiency—it's reality. Quality data preparation is the foundation of

successful analytics. Rushing this phase to get to "the fun part" (modeling) guarantees failure.


# Part 4

### Tools of the Trade

Exploring the technologies that power contemporary data analytics, from data

storage to presentation


Machine Learning Taxonomy


Machine learning encompasses three fundamental paradigms, each suited to different types of

problems. Understanding when to apply each approach is essential for effective analytics.



Supervised Learning


Learn from labeled examples

to predict outcomes. Both

input features and target

outcomes are provided during

training.



Unsupervised Learning


Discover patterns in data

without predefined labels. The

algorithm finds structure

autonomously.



Reinforcement Learning


Learn optimal behavior through

trial and error, receiving

rewards or penalties for

actions.


CLASSIFICATION
Supervised Learning: Classification


Classification algorithms predict categorical outcomes—determining which class or category an observation belongs to. These are among the most commonly applied

ML techniques in business analytics, used for customer segmentation, fraud detection, medical diagnosis, and countless other applications.


Key Algorithms You'll Learn



Evaluation Metrics


Accuracy alone is insufficient. Use precision, recall, F1-score, ROC-AUC, and confusion matrices to fully understand classifier performance. Always validate using

cross-validation to ensure models generalize beyond training data.


UNSUPERVISED
Unsupervised Learning: Clustering


Clustering algorithms discover natural groupings in data without predefined labels. Unlike supervised learning, there's no "correct answer" to learn from—the

algorithm identifies structure based solely on patterns in the features. This is particularly valuable for exploratory analysis and segmentation.



K-Means


Approach: Centroid-based partitioning


Best for: Spherical clusters when you know the number of groups (K) in

advance


DBSCAN


Approach: Density-based region growing


Best for: Arbitrary cluster shapes and automatic outlier detection


Evaluation Challenges



Hierarchical


Approach: Distance-based tree building


Best for: Creating dendrograms to explore clustering at multiple levels of

granularity


Gaussian Mixture


Approach: Probabilistic modeling


Best for: Soft clustering where observations can belong to multiple groups



Without ground truth labels, evaluating clusters requires different metrics: silhouette scores measure cluster cohesion versus separation, the elbow method

identifies optimal K, and the Davies-Bouldin index quantifies cluster quality. Common applications include customer segmentation, anomaly detection, and

document grouping.


The Modern Analytics Stack


Today's data-driven organizations rely on a layered technology stack, with each layer serving specific purposes. Understanding this architecture helps you see where different tools fit in

the bigger picture.


Presentation Layer


Where insights meet stakeholders: Tableau, Power BI, Shiny, Streamlit, Looker


Analytics Layer


Where analysis happens: R, Python, SQL for descriptive work; scikit-learn, XGBoost for predictive; Gurobi, PuLP for prescriptive


Data Processing Layer


Where data is transformed: Spark, Hadoop, dbt, Airflow, Prefect orchestrating workflows


Storage Layer


Where data lives: PostgreSQL, BigQuery, Snowflake, Databricks, S3/GCS providing

scalable storage


In this course, we'll primarily work at the Analytics and Presentation layers, using R for analysis and Shiny for interactive applications. However, understanding the full stack helps you

collaborate effectively with data engineers and IT teams.


Cloud Migration: Organizations increasingly move analytics to cloud platforms (AWS, Google Cloud, Azure) for scalability and reduced infrastructure costs. Cloud-native tools like

BigQuery and Snowflake are becoming standard.


The R Ecosystem for Analytics


Why R?


- Purpose-built for statistics and data analysis from the ground up


- Rich ecosystem of over 20,000 packages covering virtually every

analytical technique


- Exceptional capabilities for publication-quality visualization


- Strong academic and research community ensuring cutting-edge

methods



Core Tidyverse Packages


Key R Packages for This Course

















Installation tip: Use `install.packages("packagename")` for CRAN packages. For development versions, use `devtools::install_github("author/package")` . The caret package

provides a unified interface across hundreds of ML algorithms, making it easier to compare methods.


The Python Ecosystem for Analytics


Why Python?


- General-purpose language with powerful data science libraries built on top


- Dominant in machine learning and deep learning applications


- Superior for production deployment and system integration


- Massive community with extensive documentation and resources


Core Data Science Stack



Python vs R


Python excels at general programming tasks, production deployment, and deep learning.

R remains superior for statistical analysis and specialized visualization. Many practitioners

use both—Python for engineering and deployment, R for statistical exploration and

reporting.


Key Python Libraries for This Course

Data Manipulation & Visualization





Machine Learning (scikit-learn modules)






R vs Python: When to Use Which?



This Course


We primarily use R for its statistical rigor and visualization excellence. However,

all concepts transfer directly to Python, and you're encouraged to practice in

both environments.



Career Advice


Learn both languages. Use R for analysis, exploration, and research. Use Python

for production systems, engineering, and deployment. The best data scientists

are bilingual.


# Part 5

### AI-Assisted Analytics

The New Paradigm


Exploring how artificial intelligence is fundamentally transforming the practice of

data analytics


The AI Revolution Timeline


We're witnessing the fastest technology adoption in human history. What began with ChatGPT's launch has cascaded into a complete transformation of how we work with data and code.


ChatGPT Launches


Reaches 100M users in just 2 months—unprecedented adoption velocity that signals


GPT-4 Released


improvement in reasoning ability

Code Interpreter


bringing analytics to natural language

Claude 3 Series


in single conversations

Enhanced Reasoning


hallucinations significantly

Agentic AI Emerges


Autonomous multi-step workflows become reality. AI agents can plan, execute, and

verify complex tasks with minimal supervision


Current Reality (2025): According to IBM, 99% of developers building enterprise AI solutions are actively exploring AI agents. This isn't future speculation—it's happening now.


AI Tools Landscape for Analytics


The AI tool ecosystem has exploded in the past two years. Understanding which tools serve which purposes helps you choose the right solution for each task.
















ChatGPT Advanced Data Analysis: Example


Let's walk through a realistic example showing how Advanced Data Analysis turns a simple question into comprehensive insights.


|User Prompt<br>"I've uploaded sales_data.csv. Find the top 10 products by revenue, show monthly revenue trends,<br>and identify any seasonality patterns. Create visualizations for each insight."<br>Key Strengths<br>• Automatic Data Cleaning: Handles missing values, type conversions without prompting<br>• Smart Visualization Choices: Selects appropriate chart types for different data<br>• Statistical Explanation: Explains concepts like seasonality, trend decomposition<br>• Iterative Refinement: Can build on previous analysis ("Now segment by region")<br>• Model Building: Can train regression, classification models with appropriate train-test splits|Col2|
|---|---|
|User Prompt<br>"I've uploaded sales_data.csv. Find the top 10 products by revenue, show monthly revenue trends,<br>and identify any seasonality patterns. Create visualizations for each insight."<br>Key Strengths<br>•<br>Automatic Data Cleaning: Handles missing values, type conversions without prompting<br>•<br>Smart Visualization Choices: Selects appropriate chart types for different data<br>•<br>Statistical Explanation: Explains concepts like seasonality, trend decomposition<br>•<br>Iterative Refinement: Can build on previous analysis ("Now segment by region")<br>•<br>Model Building: Can train regression, classification models with appropriate train-test splits|AI Process (Behind the Scenes)<br>1.<br>Data Inspection: Reads file, examines schema (columns, data types), displays sample rows<br>2.<br>Code Generation: Writes Python:`df.groupby('product').revenue.sum().nlargest(10)`<br>3.<br>Execution & Error Handling: Runs code, catches errors (e.g., missing values), auto-corrects<br>with`na.rm=TRUE`<br>4.<br>Visualization: Generates bar chart for top products, line plot for monthly trends<br>5.<br>Advanced Analysis: Performs seasonal decomposition using statsmodels<br>6.<br>Interpretation: Provides narrative explanation of findings and business implications|
|User Prompt<br>"I've uploaded sales_data.csv. Find the top 10 products by revenue, show monthly revenue trends,<br>and identify any seasonality patterns. Create visualizations for each insight."<br>Key Strengths<br>•<br>Automatic Data Cleaning: Handles missing values, type conversions without prompting<br>•<br>Smart Visualization Choices: Selects appropriate chart types for different data<br>•<br>Statistical Explanation: Explains concepts like seasonality, trend decomposition<br>•<br>Iterative Refinement: Can build on previous analysis ("Now segment by region")<br>•<br>Model Building: Can train regression, classification models with appropriate train-test splits||


GitHub Copilot: AI in Your IDE


GitHub Copilot represents a different paradigm: AI that lives directly in your development environment, suggesting code as you type and assisting throughout your workflow.



Core Capabilities (2025)


- Multi-Model Support: Choose between GPT-4/4.5, Claude Opus 4.5, or Gemini based on task


- Inline Completion: Suggests complete functions, loops, or data transformations as you type


- Copilot Chat: Ask questions, debug errors, explain code without leaving your editor


- Agent Mode: Autonomous task completion across multiple files—refactor entire modules with a

single prompt


- GitHub Integration: Automatic PR summaries, issue triage, intelligent code review



Workflow Example









Free for Students: GitHub Copilot is free for verified students through GitHub Education. Visit github.com/education to get access.


Data Science Agents: The Next Frontier



What Are Data Science Agents?


Unlike simple AI assistants that respond to individual prompts, autonomous agents

can:


- Interpret high-level natural language objectives


- Plan multi-step analytical workflows autonomously


- Execute code and use tools without constant guidance


- Iterate based on intermediate results


- Generate comprehensive reports and visualizations


The Vision



Current Examples



"Specify high-level objectives in natural language while the agent autonomously orchestrates data collection, analysis, modeling, and reporting—with human oversight at

critical decision points."


Source: ACM Survey on LLM-Based Data Science Agents (2025)


AUTOML
AutoML: Automated Machine Learning


AutoML platforms automate the repetitive aspects of machine learning, from data preprocessing through hyperparameter tuning. This democratizes ML by enabling non-experts to build models while allowing experts to rapidly prototype.


Leading AutoML Platforms


When to Use AutoML vs. Custom Models



Use AutoML When:


Rapid prototyping needed


Get a working baseline model quickly to assess feasibility


Limited ML expertise


Team lacks specialized machine learning knowledge


Standard problems


Classification or regression tasks with structured data


Baseline comparison


Establish benchmark performance before custom work


Time constraints


Time-to-deployment is the primary constraint



Use Custom Models When:


Unique requirements


Domain-specific constraints or unusual data structures


Interpretability critical


Need to explain model decisions to stakeholders or regulators


Complex features


Sophisticated feature engineering is required


Production optimization


Need fine-tuned control over performance and resources


Research applications


Novel methodologies or academic contributions



"AutoML handles the 80% of routine ML work, freeing data scientists to focus on the 20% that requires human judgment, domain expertise, and creativity."


Market projection: Global AutoML market expected to reach $15 billion by 2030, driven by democratization of AI and shortage of ML talent.


Prompt Engineering for Data Science



What Is Prompt Engineering?


The practice of crafting clear, precise inputs to guide AI models toward producing

accurate and actionable outputs. In data science, effective prompts mean better code,

fewer errors, and more time spent on high-value work.


Why It Matters


- LLMs generate code based on your instructions—better prompts yield better

results


- Structured prompts enable reproducible workflows


- Reduces debugging time and iteration cycles


- Enables effective collaboration with AI tools


Source: Dataquest Prompt Engineering for Data Professionals (2025)



The "Clarify, Confirm, Complete" Framework


Before providing analysis, instruct the AI to:


01


Clarify


What metrics and variables are relevant to the analysis?


02


Confirm


Which analytical approaches are appropriate for this problem?


03


Complete


Create a structured plan including data preparation steps, modeling approach, and

evaluation criteria


Prompt Templates for Analytics Tasks












AI Coding Tools Comparison


Let's compare the major AI coding assistants across key dimensions to help you choose the right tool for different situations.



Recommendation for This Course: Use GitHub Copilot for writing R code in RStudio or VS Code—it excels at inline completion and learning syntax. Use ChatGPT or

Claude for conceptual explanations, debugging complex errors, and understanding why code works the way it does.


Agentic AI: The 2025 Frontier


The latest evolution in AI represents a fundamental shift from answering questions to achieving goals. Agentic AI systems can plan multi-step workflows, use tools,

iterate on failures, and work toward objectives autonomously.



The Paradigm Shift


Traditional LLM Interaction:


"Answer this specific question" → Single response → Done


Agentic AI Interaction:


"Achieve this goal" → AI plans steps → Uses tools → Checks results → Iterates

until success


What Makes It "Agentic"


- Planning: Breaks complex goals into actionable steps


- Tool Use: Can execute code, query databases, call APIs, browse web


- Self-Correction: Detects errors and tries alternative approaches


- Memory: Maintains context across multi-step workflows



Example: Autonomous Data Analysis


User Goal: "Analyze customer churn and build a prediction model"


Agent Planning & Execution:


1. Loads data, examines structure and quality


2. Cleans missing values using appropriate methods


3. Engineers features based on domain knowledge


4. Trains multiple models (logistic regression, random forest, XGBoost)


5. Evaluates using stratified cross-validation


6. Selects best model based on recall (minimizing false negatives)


7. Generates comprehensive report with visualizations


Output: Complete analysis, trained model, documentation—all automated



Time Transformation: Tasks that previously took analysts hours or days can now complete in minutes with agent oversight. However, human validation

remains essential for high-stakes decisions.


Agentic AI Platforms


The agentic AI landscape is rapidly evolving. Here are the major platforms and frameworks available in 2025.



Reality Check: Gartner 2025 Predictions
##### 25%


Pilot Projects


Percentage of companies actively piloting agentic AI in 2025


##### 40%

Cancellation Rate


Agentic AI projects projected to be canceled by 2027 due to unrealistic expectations



Success Requirements: Scoped workflows + validation checkpoints + human oversight. Agentic AI works best for well-defined, repeatable tasks with clear success criteria.


Agentic Analytics in Practice


Let's examine how agentic AI is transforming specific analytics workflows, comparing traditional analyst-driven processes with AI-augmented approaches.



Real Example: Autonomous Data Cleaning


User Request: "Clean this customer dataset"


Agent Autonomous Actions:


1. Scans for missing values → Detects 5% missing in 'age' column


2. Identifies duplicate records → Finds 127 duplicate customer_ids


3. Detects statistical outliers → 23 transactions exceed 3 standard deviations


4. Standardizes inconsistent formats → Fixes date formats, capitalizes names consistently


5. Validates transformations → Generates comprehensive data quality report


6. Asks human for decision: "Should I impute missing age with median, mean, or remove rows?"


Time Saved: What previously took hours of manual inspection and cleaning now completes in minutes. However, the analyst's expertise remains critical for making judgment calls on ambiguous situations.


Natural Language Analytics Platforms


A new category of tools enables non-technical users to perform sophisticated analytics using plain English. This democratization of analytics represents a significant shift in who can extract

insights from data.















Key Distinctions


No-Code Tools


Julius AI, ThoughtSpot: Pure natural language interface.

No coding knowledge required. Best for business users

and executives.



Hybrid Platforms


Hex, Mode: Combine code (SQL, Python, R) with AI

assistance. Best for technical teams that want AI

acceleration.



Enhanced BI


Tableau AI, Power BI Copilot: Add AI to existing business

intelligence tools. Best for organizations with established

BI investments.


Hex: Where Notebooks Meet AI


Hex reimagines collaborative data analysis by combining the power of computational notebooks with real-time collaboration and AI assistance. It's like Google Docs for data

science.



What Makes Hex Unique


- Multi-Language Support: SQL, Python, and R in the same notebook—use each

where it makes sense


- Real-Time Multiplayer: Multiple team members edit simultaneously with conflict

resolution


- Hex Magic (AI Assistant): AI writes code, fixes errors, explains complex logic


- Publishing: Convert notebooks to interactive web apps stakeholders can use


- Version Control: Track changes, revert to previous versions, branch for

experiments


Hex Magic in Action


Type `/ai` in any cell to invoke AI assistance. Examples:


- "Generate a correlation heatmap for these variables"


- "This code is throwing an error. Please fix it and explain what was wrong."


- "Write a function to handle missing values in this dataset"



Ideal Collaboration Model


Data Engineer: Writes optimized SQL to pull data from warehouse


Data Scientist: Adds Python for machine learning and statistical analysis


Business Analyst: Views results, adds commentary, requests additional cuts


Stakeholders: Access published app with interactive filters and visualizations


All working in the same Hex notebook, seeing updates in real-time. No more

emailing files back and forth or wondering which version is current.



Pricing: Free tier available for individual use. Team plans start at $16/user/month with advanced collaboration features.


RAG for Enterprise Analytics


RAG isn't just a technical architecture—it's enabling entirely new ways to interact with organizational knowledge. Here's why RAG matters for business analytics and how leading organizations are using it.


Why RAG Matters for Business



Always Current


Unlike static AI models, RAG systems retrieve information in real-time. Add new data, and it's immediately

available for queries—no model retraining required.


Source Traceability


RAG systems cite sources, allowing verification. Critical for compliance, auditing, and building stakeholder

trust in AI-generated insights.


Enterprise RAG Use Cases by Industry



Proprietary Data Access


Query internal documents, databases, and reports that the base LLM has never seen. Your competitive

intelligence remains private.


Reduced Hallucinations


Grounding responses in retrieved documents dramatically reduces made-up information. The AI works

from facts, not guesses.







Success Story (Forbes, 2025): A major retailer implemented RAG-driven product recommendations and saw a 25% increase in customer engagement. The system pulled from product catalogs, customer reviews, and

purchase patterns to generate personalized suggestions.


RAG vs. Fine-Tuning vs. Prompting


There are three main approaches to adapting LLMs to specific use cases. Understanding when to use each is crucial for building effective AI systems.













Decision Framework


01


Need up-to-date information?


YES → Choose RAG (retrieves current data)


NO → Continue to next decision



02


About style/behavior or facts?


STYLE → Consider fine-tuning (teach writing style, tone)


FACTS → Continue to next decision



03


Examples fit in prompt?


YES → Use prompting (fast, flexible)


NO → Choose RAG or fine-tuning based on volume



2025 Industry Trend: Most enterprises start with RAG because it provides maximum flexibility with reasonable effort. Fine-tuning is reserved for specialized applications where

style consistency or behavior patterns are critical and you have thousands of training examples.


### Why Do LLMs Hallucinate?

Understanding the root causes of hallucinations helps us use AI more safely and develop appropriate mitigation strategies.



Training Data Issues


- Outdated information: Training data

has a cutoff date; models don't know

about recent events


- Knowledge gaps: Rare topics, niche

domains, or specialized knowledge

may not be well-represented


- Biased or incorrect sources: If

training data contains errors, models

learn those errors



Architectural Limitations


- Prediction-based: LLMs predict

"likely next words" based on

patterns, not truth


- No fact-checking: No real-time

verification mechanism to validate

generated content


- Pressure to respond: Architecture

incentivizes always generating an

answer over admitting uncertainty



Evaluation Incentives


- Benchmark design: Tests reward

accuracy on known questions, not

calibrated confidence


- Guess vs. abstain: Models learn to

guess rather than say "I don't know"


- Confidence miscalibration: Model

confidence scores don't correlate

well with actual correctness



Critical Insight: Hallucinations aren't bugs to be fixed—they're inherent to how current LLMs work. These models are fundamentally

probabilistic text generators optimized for fluency, not accuracy. Understanding this helps us use them appropriately.


Hallucination Rates in Practice


Let's examine real-world hallucination rates and understand which scenarios pose the highest risks.


Benchmark Data (2025 Evaluations)



*On standard factual Q&A benchmarks; rates vary significantly by task type and domain


Domain-Specific Risks


Medical Hallucinations



Legal Fabrications



In one study, up to 83% of LLMs repeated intentionally planted fake lab values

in medical records



Fabricated case citations remain significant problem, with ~35% of legal

citations requiring verification



Financial Errors


Numerical hallucinations and calculation errors occur in roughly 25% of

complex financial analyses



Critical Takeaway: Even the best models hallucinate 12-20% of the time on straightforward factual questions. For high-stakes decisions—medical diagnoses, legal advice, financial recommendations—independent verification is not

optional. It's mandatory.


###### Mitigating Hallucinations

While we can't eliminate hallucinations entirely, we can significantly reduce their occurrence and impact through deliberate strategies.



Strategies for Users (You!)


- Always verify critical facts: Cross-check important claims against

authoritative sources independently


- Ask for sources: Request citations and verify they exist and support

the claims made


- Use RAG: Ground AI responses in your actual documents rather than

relying on training data


- Request confidence levels: Ask "How certain are you?" to surface

uncertainty


- Cross-check with multiple models: Different models hallucinate

differently; agreement increases confidence


- Be skeptical of specific numbers: Dates, statistics, and quantitative

claims need extra verification



Strategies for Developers


- Implement RAG: Connect LLMs to authoritative knowledge bases for

factual grounding


- Add verification layers: Fact-checking pipelines that validate claims

before presenting to users


- Train for uncertainty: Use prompts that encourage models to admit

when they don't know


- Calibration-aware training: Optimize for accurate confidence, not just

accuracy


- Human-in-the-loop: Require human review for high-stakes outputs

before taking action


- Structured output: Force specific formats that reduce generation

freedom



The Verification Principle: Trust but verify. Use AI to accelerate work, but establish verification checkpoints appropriate to the stakes involved. A factual

error in an exploratory analysis is annoying; the same error in a regulatory filing could be catastrophic.


AI Ethics: Bias in Analytics


AI systems can perpetuate and even amplify existing societal biases. As future analytics professionals, you must understand these risks and how to mitigate them.


The Bias Feedback Loop


Bias in AI systems often follows a self-reinforcing cycle:


Model Training



Historical Data


Contains patterns reflecting past biases and inequalities


Biased Outcomes


Become new historical data, reinforcing the cycle



Algorithm learns these patterns as "truth"


Biased Predictions


Model outputs reflect and amplify learned biases


Decisions


Organizations act on biased predictions



Common Types of AI Bias


AI Ethics: Real-World Consequences


These aren't theoretical concerns. AI bias has caused real harm to real people. Understanding these cases helps us build better, fairer systems.









Amazon Hiring Tool (2018)


The System: AI resume screening tool trained on 10

years of historical hiring decisions


The Problem: Historical hires were predominantly

male. The model learned to penalize resumes

containing words like "women's" (e.g., "women's

chess club captain") and graduates of all-women's

colleges.


The Outcome: Amazon scrapped the entire project

after discovering it systematically discriminated

against female candidates.


The Lesson: Historical data often encodes past

discrimination. Training on biased data produces

biased models.



Healthcare Algorithm Bias (2019)


The System: Major hospital system used an

algorithm to identify patients needing extra medical

attention


The Problem: Algorithm used healthcare costs as a

proxy for health needs. Black patients faced more

barriers to care and therefore had lower costs

despite similar health conditions.


The Outcome: The algorithm recommended less

care for Black patients at the same health level,

affecting millions of patients.


The Lesson: Proxy variables can embed

discrimination. What seems like an objective

measure (cost) can reflect systemic inequality.



COMPAS Recidivism Prediction


The System: Algorithm used in criminal sentencing

to predict likelihood of reoffending


The Problem: ProPublica investigation found the

system had higher false positive rates for Black

defendants—incorrectly labeling them as high risk

more often than white defendants.


The Outcome: Ongoing debate about whether

algorithms should be used in criminal justice, and

what "fairness" even means in this context.


The Lesson: Different definitions of fairness

conflict. Optimizing for one fairness metric can

worsen others.



Key Insight: AI doesn't create bias—it automates and scales existing human biases, often invisibly. This makes bias harder to detect and potentially more harmful, as

biased decisions can be made at unprecedented scale and speed.


Responsible AI Framework


Building ethical AI systems requires intentional design choices and ongoing vigilance. Here's a practical framework for responsible analytics.


















Prompt Engineering: Advanced Techniques


Prompt engineering has evolved from simple question-asking to sophisticated techniques that dramatically improve AI output quality and reliability.





Chain-of-Thought Example for Analytics







This structured prompt produces more thorough, logical analysis than simply asking "Should we expand to Germany?"


Prompt Engineering: Data Analytics Templates


Effective prompts for analytics work follow repeatable patterns. Here are battle-tested templates you can adapt for your projects.


Template 1: Exploratory Data Analysis




Prompt Engineering: More Templates


Template 2: Data Cleaning





Template 3: Debugging







Pro Tip: Save these templates and customize them for your specific needs. Over time, you'll develop a personal prompt library—a competitive advantage that makes you faster and more effective with AI

tools.


The Iterative Prompting Process


Great AI outputs rarely come from first prompts. Effective prompt engineering is iterative—each attempt informs refinements that improve results.


Version 1: Too Vague


Prompt: "Summarize this article"


Result: Generic summary that misses key technical points and includes irrelevant background. Not useful.


Version 2: Add Structure


Prompt: "Summarize this article in 3 bullet points: (1) Key finding (2) Methodology (3) Limitations"


Result: Better structure, but too brief—each point is only one sentence. Missing important details.


Version 3: Specify Role, Length, Format


Prompt: "You are a research analyst. Summarize this article in 3 bullets with 2-3 sentences each: (1) Key finding with specific numbers (2) Methodology 
how was this studied? (3) Limitations and caveats"


Result: Much better! Detailed, structured, includes specifics. Save this as a template for future use.


The Learning Loop: Each unsatisfying response teaches you what to specify. "I wish it included X" → Add "Include X" to next prompt. "This format is hard to read"

→ Specify output format. Over time, you develop intuition for what works.


Meta Tip: Keep a running document of prompts that worked well. Your future self will thank you when you need to perform similar tasks months later.


AI Model Comparison for Analytics


Different models excel at different tasks. Understanding their strengths helps you choose the right tool for each analytics challenge.























API Pricing Consideration (per 1M tokens, approximate)


###### $2.50

GPT-4o


Mid-range pricing for excellent capabilities


###### $3.00

Claude Sonnet


Competitive pricing for high quality


###### $1.25

Gemini


Most cost-effective major model


###### $0

Open-source


Compute costs only; no API fees



Recommendation: Start with GPT-4o or Claude for learning (both have generous free tiers). As you scale up production use, cost considerations become important.


When NOT to Use AI


AI is powerful, but it's not always the right tool. Knowing when to avoid AI is as important as knowing when to use it.









Decision Framework


01


Is this routine & well-defined?


→ Traditional tools (SQL, R, Excel) likely faster and more reliable


03


Is this critical & irreversible?


→ AI assists, human validates and decides



02


Is this exploratory & creative?


→ AI can help generate ideas and approaches


04


Does this involve sensitive data?


→ Check compliance requirements before using AI


AI Limitations Summary


Understanding current AI limitations helps set realistic expectations and avoid costly mistakes. These aren't permanent—but they're real in 2025.



Reasoning Limitations


- Multi-step logic: Still error-prone on complex chains of reasoning


- Math: Unreliable for calculations; use calculators or code execution instead


- Rule consistency: Struggles applying rules consistently across long contexts


Reliability Issues


- Consistent format: Outputs vary; use structured output constraints when

needed


- Reproducibility: Same prompt → different responses (temperature,

randomness)


- Guaranteed correctness: Always verify; hallucinations happen even in best

models



Knowledge Gaps


- Current events: Training data has cutoff; use RAG or web search for recent

info


- Specialized domains: Performance varies widely; niche expertise may

require fine-tuning


- Your private data: Not in training; must provide via RAG or uploads


Understanding Gaps


- True comprehension: Pattern matching, not genuine understanding


- Common sense: Often fails on edge cases humans handle easily


- Causal reasoning: Confuses correlation with causation



Key Takeaway: AI is an incredibly powerful tool that excels at many tasks—but it's not magic. Understanding limitations helps you use AI effectively while avoiding pitfalls

that could undermine your work.


The Future of AI in Analytics


AI as Assistant: Accelerates routine tasks like code generation and documentation


Human as Director: Sets goals, validates outputs, makes final decisions


AI as Collaborator: More autonomous workflows with multi-step planning


Human as Supervisor: Higher-level oversight, strategic guidance


AI as Analyst: End-to-end automation for routine analytical work


Human as Strategist: Focus on judgment, creativity, ethics, and communication


What Won't Change



Domain Expertise

Deep understanding of

business context



Critical Thinking

Questioning

assumptions and

validating results



Ethical Judgment

Navigating complex

tradeoffs and values



Communication

Storytelling and

stakeholder influence



"AI will handle more of the 'how'—humans will increasingly focus on the 'why' and 'so what'."


Practical AI Workflow for This Course


01


Understand First


Grasp the problem, objectives, and analytical approach before involving AI. You must be able to

evaluate whether AI's suggestions make sense.


04


Explain Your Work



Leverage AI for code generation, exploration, documentation, and debugging to work more

efficiently.


05


Iterate





03


Verify Everything



02


Use AI to Accelerate



Test, validate, and review all AI-generated content. Run the code, check the logic, validate the

results.



You must be able to explain your analysis in your own words. If you can't explain it, you don't understand it.


Course Policy on AI Use



Use insights from verification to refine your approach and prompts, continuing the improvement cycle.



AI tools are allowed and encouraged for learning and productivity You must understand what your code does and be able to explain it


You must verify all AI-generated content before submission You must cite when AI substantially contributed to your work


The AI Skills Stack for Data Scientists





Key Takeaway: AI skills are additive, not replacement. Build advanced AI capabilities on top of strong traditional data science foundations. The best practitioners excel at both.


LIVE DEMO
Demo: AI-Assisted Customer Churn Analysis


Let's walk through a practical example of using AI to analyze customer churn in a telecom dataset. This demonstrates the recommended workflow in action.


Step 1: Data Understanding Prompt





Step 2: AI Generates Code







Step 3: Human Validates


Run the code—does it execute without errors? Review the output—are the results sensible given the data?


Check the logic—did it address all requirements? Identify gaps—what additional analysis might be needed?


What This Means for Your Career


AI is fundamentally changing what it means to be an analytics professional. Here's how to position yourself for success in this new landscape.



The Evolving Skill Set


Traditional Skills (Still Essential):


- SQL, R, Python fundamentals


- Statistical reasoning and methodology


- Data visualization principles


- Business domain understanding


- Clear communication with stakeholders


Emerging Skills (Increasingly Critical):


- Prompt engineering and context engineering


- AI tool orchestration and workflow design


- RAG architecture and implementation


- AI ethics and responsible AI practices


- Human-AI collaboration patterns



The Real Differentiator


In 2025, AI can generate code, perform analysis, and create visualizations. So what makes you valuable?


Asking the Right Questions


AI answers what you ask. You must know what to ask.


Domain Expertise


Validate AI outputs against business reality and catch nonsensical results.


Judgment Calls


Navigate ambiguity, make tradeoff decisions, handle edge cases.


Taking Responsibility


AI assists; you own the decisions and outcomes.


Building Trust


Stakeholder relationships and credibility can't be automated.



The Career Equation: Domain Expertise + Technical Foundation + AI Fluency + Critical Thinking = Sustainable Competitive Advantage


AI accelerates the routine work, freeing you to focus on judgment, creativity, and strategy—the distinctly human skills that create real value.


