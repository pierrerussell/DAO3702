# DBA3702: Descriptive Analytics with R Lecture 2: Data Wrangling with R & Social Network Analysis

Chaithanya Bandi
NUS Department of Analytics & Operations


© Copyright National University of Singapore. All Rights Reserved.


#### Plan today

01


R Programming Foundations


Master essential R concepts, data types, and

structures that form the backbone of data

science workflows


04


Centrality Metrics Deep Dive



02


Tidyverse & dplyr Mastery


Learn the elegant grammar of data

manipulation with pipes, verbs, and tidy

principles


05



03


Network Analysis Fundamentals


Discover how relationships between entities

reveal insights traditional analysis misses



Understand and calculate measures of importance, influence, and

structural position



Real-World Applications


Apply your knowledge to industry case studies from Google,

Amazon, Uber, and beyond


#### Introduction to R Programming

R is a free, open-source programming language specifically designed for statistical computing and graphics. With over 18,000 packages

and a thriving community, R has become the lingua franca of data science in both academia and industry.


Why R Dominates Data Science



Open Source
Power


Completely free to

download, use, and

modify. This

democratizes access

to powerful statistical

tools and creates a

vibrant ecosystem of

contributors

worldwide.



Package
Ecosystem


Over 18,000+

packages on CRAN

covering everything

from basic statistics to

machine learning,

bioinformatics, and

financial modeling. If

you need it, there's

probably a package for

it.



Statistical
Excellence


Built by statisticians for

statisticians, R has

unparalleled support

for statistical methods.

It's the gold standard

for academic research

and data analysis.



Download R from [r-project.org and consider using RStudio as your IDE for a](https://www.r-project.org/)

more user-friendly experience with syntax highlighting, debugging tools, and

project management.


R's Fundamental Data Types


Every programming language has basic building blocks for representing different kinds of information. Understanding R's data types is essential for effective data

manipulation.


















Why Factors Matter for Analysis


Factors are crucial because they tell R that a variable is categorical rather than just text. This fundamentally affects how statistical models treat the

variable and how data is analyzed.



Character Vectors


Treated as simple text strings. Limited analytical capabilities. Example:

"Small", "Medium", "Large" are just words.



Factor Variables


Recognized as categories with order and meaning. Enable proper

statistical analysis. Example: Factor levels can be ordered (ordinal) or

unordered (nominal).


Vectors: R's Most Basic Structure


Vectors are ordered collections of elements of the same type. They're the foundation of all data structures in R, and understanding them is essential for effective programming.



Creation


Use c() to combine elements into a vector. Create

sequences with : or seq(). Repeat values with rep().



Access


Use square brackets with indices. R uses 1-based

indexing (first element is [1]).



Operations


Perform vectorized operations and apply functions to

entire vectors at once.



Critical: R uses 1-based indexing, meaning the first element is at position 1, not 0 like Python or JavaScript. This is one of the most common sources of errors when

transitioning from other languages.


Lists: Flexible Containers



What Are Lists?


Lists are more flexible than vectors 
they can contain elements of

different types, including other lists.

This makes them perfect for

representing complex, hierarchical

data structures.



Accessing List Elements


Multiple ways to extract data, each

with different behavior:


- $ or [[]] - Extracts the actual

element


- [] - Returns a sub-list


- By name or by position










Data Frames: Your Primary Tool


The data frame is the most important data structure for data analysis in R. Think of it as a spreadsheet or database table where each column

is a variable and each row is an observation.







Essential Functions


- nrow() - Number of rows


- ncol() - Number of columns


- dim() - Dimensions


- head() - First 6 rows


- tail() - Last 6 rows


- str() - Structure overview


- summary() - Statistical summary


The R Package Ecosystem


R's true power comes from its extensive package ecosystem. Packages extend R's capabilities with specialized functions for specific tasks, from data manipulation to machine learning.



Install Once


Download packages from CRAN or GitHub using install.packages()



Use Functions


Access all package functions and start analyzing data









Load Each Session


Activate packages in your current R session with library()







dplyr


Data manipulation with intuitive verbs like filter,

select, mutate



ggplot2


Create publication-quality graphics with grammar of

graphics



tidyr


Reshape and tidy your data for analysis



readr


Fast and friendly data import from CSV, TSV files


#### The Tidyverse & dplyr

The tidyverse represents a modern, cohesive approach to data science in R.

Created largely by Hadley Wickham, it's a collection of packages that share a

common design philosophy, making your code more readable, maintainable, and

elegant.


The Tidyverse Philosophy


Consistent Syntax


All tidyverse functions follow similar patterns, dramatically

reducing the learning curve. Once you understand one package,

you understand the ecosystem.


Composability


Operations chain together seamlessly using the pipe operator.

Build complex transformations from simple, testable steps.



Human-Readable Code


Code reads almost like English prose. When you see filter(data,

age > 25), you immediately understand what's happening

without mental translation.


Tidy Data Principles


Every variable forms a column, every observation forms a row,

every type of observational unit forms a table. This

standardization makes all tools work together effortlessly.



Why This Matters: When data is tidy, it works seamlessly with all tidyverse tools. You spend less time wrestling with data formats

and more time doing actual analysis that generates insights.


The Pipe Operator: %>%


The pipe operator is arguably the most transformative concept in the tidyverse. It takes the output of one function and passes it as the first argument to

the next function, creating readable, flowing code.



Without Pipe: Hard to Read


Nested functions force you to read from inside-out, making logic difficult

to follow.



With Pipe: Natural Flow


Operations flow top to bottom, left to right - exactly how you think about

the process.





Read as: "Take df, and thenfilter for age > 25, and thenarrange by score descending, and thentake the first 10 rows."


Keyboard Shortcut: Ctrl+Shift+M (Windows/Linux) or Cmd+Shift+M (Mac). R 4.1+ also includes native pipe |> with similar functionality.


Tibbles: Enhanced Data Frames


Tibbles are the tidyverse's modern reimagining of data frames. While functionally similar to traditional data frames, they include several quality-of-life improvements that make data analysis more intuitive and

less error-prone.



Intelligent Printing


Shows only first 10 rows and columns that fit your console width, with clear column types

displayed.


No Auto-Conversion


Never automatically converts strings to factors. Your data types stay exactly as you specified.



Consistent Subsetting


Subsetting always returns a tibble, never surprises you with a vector. More predictable behavior

reduces bugs.


Flexible Names


Allows column names with spaces or special characters using backticks, improving readability.






dplyr: The Grammar of Data Manipulation


dplyr provides an elegant set of "verbs" for data manipulation. These six core functions handle the vast majority of data wrangling tasks

you'll encounter.



select()


Choose which columns to keep, remove, or reorder. Like

selecting columns in a spreadsheet.


arrange()


Sort rows by one or more columns in ascending or

descending order.


group_by()


Group data by categories, setting up for grouped operations

like aggregation.



filter()


Choose which rows to keep based on conditions. Similar to

filters in Excel or SQL WHERE clauses.


mutate()


Create new columns or modify existing ones using

calculations or transformations.


summarise()


Collapse groups into summary statistics like means, counts,

or totals.


select(): Choosing Columns


Basic Selection





Selection Helpers







Selection helpers make it easy to work with datasets that have many columns with consistent naming patterns. This is particularly useful in datasets

with repeated measures or time series data.


filter(): Choosing Rows by Condition


The filter() function is your primary tool for subsetting data based on logical conditions. It's more intuitive than base R subsetting and handles missing values gracefully.



|Single Condition<br>ds %>%<br>filter(agegp == "65-74")|Multiple Conditions (AND)<br>ds %>%<br>filter(agegp == "65-74",<br>ncases > 10)|
|---|---|
|OR Conditions<br>`ds %>%`<br>`filter(agegp == "65-74" |`<br>`agegp == "75+")`|Set Membership<br>`ds %>%`<br>`filter(agegp %in%`<br>`c("65-74", "75+"))`|


Comparison Operators


- == Equal to


- != Not equal to


- >, >= Greater than (or equal)


- <, <= Less than (or equal)


- %in% Is in a set


- is.na() Is missing


- !is.na() Not missing




arrange(): Sorting Your Data


The arrange() function orders rows by one or more columns. It's straightforward but powerful, especially when combined with other dplyr verbs in a pipeline.



Basic Sorting



Multi-Column Sorting










mutate(): Creating New Columns


The mutate() function is your tool for creating new variables or modifying existing ones. It's incredibly flexible and can reference columns created earlier in the same mutate() call.







Conditional Logic



Complex Conditions



Time Series






















group_by() + summarise(): Aggregation


The combination of group_by() and summarise() is how you perform grouped aggregations - one of the most common operations in data analysis. This pattern replaces complex base R aggregation with elegant,

readable code.



Basic Grouped Summary



Multiple Statistics







Groups data by age group, then calculates the mean odds for each group.


1 Common Summary Functions


   - n()    - Count of rows


   - n_distinct()    - Count unique values


   - sum()    - Sum of values


   - mean(), median()    - Central tendency


   - sd(), var()    - Dispersion


   - min(), max()    - Range


   - first(), last()    - Endpoints





Calculate multiple summary statistics for each group in one operation.



Pro Tip: Use `na.rm = TRUE` inside summary functions to ignore missing values: `mean(value, na.rm = TRUE)`


mutate() vs summarise(): A Critical Distinction


Understanding when to use mutate() versus summarise() with group_by() is crucial. The difference lies in whether you want to keep all rows

or collapse to summaries.



group_by() + mutate()


Adds columns, keeps all rows



group_by() + summarise()


Collapses rows to summaries









Use when: You need group statistics but want to keep individual

rows (e.g., for normalization, calculating percentages of group

total, or creating group-level features).



Use when: You want aggregate statistics per group and don't need

the individual observations (e.g., creating summary reports or

dashboards).


Combining Data: Joins and Binds


Real-world analysis often requires combining data from multiple sources. dplyr provides intuitive functions for both vertical stacking and relational joins.


Stack data frames on top of each other, combining rows from multiple sources.





Add columns side by side. Datasets must have same number of rows.







Combine tables based on matching key columns, like SQL joins.






The Power of Pipelines


When you combine dplyr verbs with the pipe operator, you create readable, efficient data analysis pipelines that transform raw data into insights.



01


Filter Data


Select relevant subset based on criteria


04


Sort Results


Arrange by importance or value



02


Group By Category


Organize data into meaningful groups


05


Extract Top Results



Focus on most relevant findings



03


Calculate Statistics


Compute summary metrics per group




#### Social Network Analysis

Network analysis represents a fundamental shift in how we think about data.

Rather than focusing solely on attributes of individual entities, we examine the

patterns of relationships between them - revealing insights invisible to traditional

analysis.


##### Traditional vs Network Thinking


Why Network Position Matters


Network thinking has revealed that structural position often predicts behavior and outcomes more accurately than individual characteristics.

This insight has transformed fields from sociology to business analytics.


















The Evolution of Network Analysis


Jacob Moreno develops sociometry, creating the first systematic methods for mapping social structures and group dynamics.


Graph theory provides rigorous mathematical framework for analyzing network structures and properties.


The World Wide Web emerges, enabling large-scale network data collection and analysis of online interactions.


Facebook, Twitter, LinkedIn generate massive network datasets, democratizing access to real-world social networks.


Network analysis pervades business strategy, scientific research, public policy, and daily decision-making across industries.


What Network Analysis Reveals


Network analysis uncovers patterns and structures that remain invisible when examining individual entities in isolation. These insights drive decision-making across domains

from business to biology.








Network Building Blocks


Every network, regardless of domain or complexity, consists of just two fundamental components. Understanding these building blocks is essential

for any network analysis.



Nodes (Vertices)


The entities in your network - the things being connected.


- People in social networks


- Web pages on the internet


- Products in retail systems


- Genes in biological systems


- Airports in transportation


- Accounts in financial systems


- Computers in IT networks



Edges (Links)


The relationships connecting nodes - the connections between entities.


- Friendships between people


- Hyperlinks between pages


- Co-purchases of products


- Regulatory relationships between genes


- Flights between airports


- Transactions between accounts


- Data transfers between computers



Representation: Networks can be represented as visual diagrams (nodes as circles, edges as lines), adjacency matrices (N×N where entry

[i,j]=1 if connected), or edge lists (tables with "from" and "to" columns).


Directed vs Undirected Networks


Essential Network Vocabulary


Network analysis has its own language. Mastering these fundamental concepts allows you to describe, analyze, and communicate about network structures effectively.



Degree


Number of connections a node has. Alice with 5 friends has degree = 5.


Path


Sequence of edges connecting two nodes. Alice→Bob→Charlie is a path.


Connected Component


Group where every node can reach every other node. Isolated clusters in

network.


Diameter


Longest shortest path in the network. The "width" of the network structure.



Neighborhood


All nodes directly connected to a given node. Alice's neighborhood = her

friends.


Shortest Path


Minimum number of edges between two nodes. Alice to Charlie via Bob = 2

hops.


Density


Ratio of actual edges to possible edges. How interconnected is the network?


In-Degree / Out-Degree


For directed networks: incoming edges vs outgoing edges from a node.


Types of Network Structures


Real-world networks exhibit distinctive structural patterns. Recognizing these patterns helps you understand network behavior and predict properties.



Random Graphs


Edges placed randomly

with equal probability.

Most real networks are

NOT random. Used as

null model for

comparison to detect

meaningful patterns.


Bipartite Networks


Two types of nodes;

edges only between

types, never within.

Examples: people
movies (who acted in

what), customers
products (who bought

what).



Regular Graphs


Every node has exactly

the same number of

connections. Examples:

lattice networks, ring

networks, crystal

structures. Highly

ordered and predictable.


Weighted Networks


Edges have values

representing strength,

frequency, cost, or

distance. Examples:

trade networks (value),

communication

(frequency),

transportation (distance).



Scale-Free
Networks


Follows power law: few

"hubs" with many

connections, many

nodes with few.

Examples: World Wide

Web, citation networks,

protein interactions.

Robust to random failure

but vulnerable to

targeted hub attacks.



Small World
Networks


High local clustering

(your friends know each

other) plus short global

paths (reach anyone in

few steps). Examples:

social networks, neural

networks. The "six

degrees of separation"

phenomenon.


Networks Are Everywhere


Once you understand network thinking, you'll see networks in every domain. The same analytical tools apply whether you're studying social

connections, biological systems, or digital infrastructure.



Infrastructure


Electricity grids, telecommunications,

water systems, pipelines, roads, railways


Information


Citation networks, knowledge graphs,

semantic networks, recommendation

systems


Economic


Supply chains, trade networks, financial

systems, inter-organizational partnerships



Digital


Internet routers, World Wide Web, email,

social media, online marketplaces


Social


Friendships, family, professional

networks, organizational hierarchies,

collaborations


Biological


Neural networks, protein interactions, gene

regulation, food webs, disease

transmission


**Epidemiologic Travel Network**


© Copyright National University of Singapore. All Rights Reserved.



22


**Oil Pipeline Network**


© Copyright National University of Singapore. All Rights Reserved.



23


**Twitter Retweet Network**


© Copyright National University of Singapore. All Rights Reserved.



24


Customer Networks in Business


Customer relationships form rich, multidimensional networks with multiple types of connections. Analyzing these networks reveals patterns that traditional customer analytics miss entirely.



Co-Purchase Networks


Customers who bought the same products. Enables recommendations and reveals product

associations.


Communication Networks


Email, calls, messages between customers. Reveals organic communities and information flow.


Churn Prediction


Customers connected to churners are significantly more likely to churn themselves. Network position

predicts risk.


Fraud Detection


Fraudulent activity often occurs in connected clusters, making network analysis essential.



Referral Networks


Customer who referred another. Critical for marketing attribution and identifying brand advocates.


Similarity Networks


Customers with similar demographics or behavior patterns. Enables targeted segmentation.


Targeted Marketing


Identify influential customers for campaigns who will spread messages through their networks.


Lifetime Value


Network position affects customer value - well-connected customers are more valuable.



Research Finding: Studies consistently show that network characteristics often predict customer behavior better than individual attributes . Who you're connected to matters as much as who you are.


Employee Networks: The Informal Organization


Inside organizations, informal networks of communication and collaboration often matter more than formal reporting structures. Understanding these invisible networks is crucial for organizational effectiveness.



Data Sources for Employee Networks


- Email communication patterns


- Calendar and meeting attendance


- Slack/Teams message threads


- Document collaboration (Google Docs, SharePoint)


- Physical proximity (badge swipes, seating)


- Project team assignments



What Employee Networks Reveal


Informal Leaders


High centrality without formal authority - the people everyone actually asks for help


Silos


Disconnected departments that should be collaborating but aren't communicating


Bottlenecks


Overloaded connectors slowing information flow and creating dependencies


Flight Risk


Isolated employees with weak connections are more likely to leave


Innovation Hubs


Well-connected diverse groups where new ideas emerge and spread


###### The formal org chart ≠ real information flow

Decisions are made, problems are solved, and innovation happens through informal networks. Understanding these networks is crucial for organizational effectiveness, change management, and leadership

development.


Case Study: The Enron Email Network


The Enron scandal of 2001 inadvertently created one of the most studied email networks in history when company communications became public during federal

investigation. This dataset has become a gold standard for organizational network research.


### 148

Employees


Nodes in the network


Informal Power Structures


### 644

Email Connections


Directed edges (sender → receiver)


Information Brokers


### 1000+

Research Papers


Published using this dataset



Network analysis revealed who actually communicated with whom versus the

formal organizational chart. Real influence didn't always match titles.


Behavioral Changes


Communication patterns shifted dramatically as the scandal unfolded, visible

in temporal network analysis.



Identified people connecting different groups who weren't in management

positions but held structural power through network position.


Prediction Power


Network position helped predict who would be implicated in wrongdoing

better than formal role alone.



Key Takeaway: The formal org chart shows who reports to whom. The email network shows who actually talks to whom. These are often very different - and

the informal network often matters more for understanding how organizations really function.


#### Network Metrics: Measuring Importance

How do you measure importance in a network? The answer depends on what

"important" means. Network science offers multiple centrality measures, each

capturing a different dimension of influence, power, and structural position.


The Four Fundamental Centrality Measures


Each centrality metric answers a different question about importance. The same node can rank very differently depending on which measure you use, so choosing the right metric for your question is critical.










Degree Centrality: Counting Connections


The simplest and most intuitive centrality measure - just count how many connections a node has. Despite its simplicity, degree centrality is powerful and widely used.



The Formula


Normalized by (n-1) to enable comparison across networks of different sizes. The

denominator is the maximum possible degree.


For Directed Networks


- In-degree: Number of incoming edges (popularity, being chosen)


- Out-degree: Number of outgoing edges (activity, choosing others)



Interpretation


High degree centrality identifies nodes with many direct connections - the "popular"

nodes and potential influencers in the network.


Advantages:


- Easy to compute and explain


- Intuitively meaningful


- Works for directed and undirected networks


Limitation: Treats all connections equally. A person connected to 100 random strangers

might have higher degree than someone connected to 10 CEOs, but the latter

connections might be far more valuable.


Closeness Centrality: Strategic Position


Closeness centrality measures how close a node is to all other nodes in the network. Nodes with high closeness can reach everyone else quickly, making them ideal for broadcasting

information.



The Formula


Where d(v,u) is the shortest path distance from v to u. Higher closeness means shorter

average distance to everyone.



Interpretation


High closeness centrality indicates a node can reach everyone in the network in relatively

few steps. These nodes are in central positions for spreading information efficiently.



Finding Optimal Locations


Best location for a new store that minimizes average

distance to all customers



Information Dissemination


Identifying who should disseminate company

announcements to reach everyone quickly



Network Infrastructure


Finding central servers or routers that optimize network

performance



Important Limitation: Requires a connected network. If the network has disconnected components, closeness is undefined (infinite distance to unreachable nodes). Use only when

all nodes can reach each other.


Betweenness Centrality: The Broker

```
 # Calculate betweenness centrality

 betweenness(g)

 # Returns betweenness score for each node

```

Bridges Between Departments


People connecting siloed organizational units who may not have formal authority but control cross -functional communication



Network Vulnerabilities


Identifying whose removal would most disrupt the network - critical for risk management and succession planning


PageRank: The Google Algorithm


How PageRank Works


PageRank's elegance lies in its recursive definition: your importance depends on the importance of those linking to you. This creates a virtuous cycle where quality content attracts quality links.


The Mathematical Formula


Where: d = damping factor (typically 0.85), N = total pages, M(A) = pages linking to A, L(T) = outgoing links from T



01


Initialize


Start with equal PageRank for all pages: 1/N for each page in the network


03


Iterate


Repeat the distribution process many times as values propagate through the network



Recursive


Your importance depends on your linkers' importance - must

compute iteratively until stable



Link Dilution



02


Distribute


Each page passes its PageRank to pages it links to, divided by number of outgoing links


04


Converge


Continue until PageRank values stabilize and stop changing significantly


Universal



More outgoing links means less rank passed per link 
prevents spam



Works on ANY directed network, not just web pages - social

networks, citations, etc.


Choosing the Right Centrality Measure


Different questions require different centrality measures. Understanding what each measure captures helps you choose the right tool for your analysis goal.





Popularity Question


"Who knows the most people?" → Use Degree


Disruption Question


"Whose removal disrupts communication?" → Use Betweenness



Speed Question


"Who can spread information fastest?" → Use Closeness


Influence Question


"Who has the most influential connections?" → Use PageRank


#### Real-World Applications

Network analysis has transformed industries from technology to finance to healthcare. Let's explore how companies like Google, Amazon,

and Uber apply network thinking to solve real-world problems at massive scale.


Google: Search Powered by Networks


Google's revolutionary insight was to use network structure rather than just text matching to rank web pages. This transformed search from a

keyword matching problem into a network analysis problem.



Before PageRank


Search engines ranked pages by:


- Keyword matching frequency


- Keyword density on page


- Meta tags (easily manipulated)


This approach was easily gamed through keyword stuffing, invisible

text, and meta tag spam. Quality results were buried beneath

manipulated pages.



After PageRank


Quality determined by link structure:


- Links treated as "votes" for quality


- Votes from important pages count more


- Spam-resistant (hard to fake thousands of legitimate incoming

links)


Self-reinforcing: good content gets linked, gets ranked higher, gets

more links. Quality rises to the top organically.


## 130T+

Pages Indexed


Trillion web pages in Google's index


## 8.5B+

Daily Searches


Billion searches processed per day


## 200+

Ranking Signals


PageRank now one of hundreds of factors


Amazon: Product Recommendation Networks


"Customers who bought this also bought..." is one of the most effective features in e-commerce, powered by a product co-purchase network that drives billions in revenue.



01


Build Network


Create network from transaction data where products are nodes and edges connect

frequently co-purchased items


03


Find Neighbors


When viewing Product A, identify strongly connected products in the network graph


Applications Beyond Recommendations


- Product bundling ("Frequently bought together")


- Store layout optimization


- Inventory management and forecasting


- Cross-category promotions


- Email campaign targeting



02


Calculate Weights


Edge weights represent frequency of co-purchase - stronger connections for more common

pairings


04


Rank & Filter


Sort by edge weight, filter by relevance and availability, display top recommendations


Revenue Impact


Recommendations drive ~35% of Amazon's total revenue


Market Basket Analysis


Market basket analysis discovers product associations in transaction data, revealing unexpected purchasing patterns that drive business strategy.















Interpreting Lift


- Lift = 1: Items are independent (no association)


- Lift > 1: Items are positively associated (often bought together)


- Lift < 1: Items are negatively associated (rarely together)


Cross-Selling


Classic "Would you like fries with that?" - using associations to suggest

complementary items at point of sale


Promotional Bundles


Create product bundles based on actual purchasing patterns rather than guesswork



The Classic Example


Walmart discovered that beer and diapers were frequently purchased together - young

fathers buying both on diaper runs. This insight led to:


- Strategic product placement


- Targeted promotions


- Store layout optimization


Store Layout


Place associated items near each other to increase basket size, or far apart to

increase store navigation


Campaign Targeting


Target customers who bought A with promotions for associated product B


Uber: Transportation Networks


Uber operates on multiple interconnected networks simultaneously, using real-time network optimization to match millions of riders with drivers daily.



Geographic Network


Roads, routes, locations forming the physical infrastructure


Supply-Demand Network


Real-time matching of drivers to riders



Driver-Rider Matching


Optimize distance and time in geographic network to minimize

wait times and maximize efficiency


Pool Matching



Dynamic Pricing



Identify supply-demand imbalances in real-time across network

regions to adjust surge pricing


Driver Positioning



Driver Network


Driver locations, availability patterns, and historical data


Rider Network


Pickup/dropoff patterns and rider preferences


Route Optimization



Apply shortest path algorithms considering traffic, time of day,

and road conditions



Find riders with compatible routes to share rides, analyzing network paths for overlap


10B+


Trips Completed


Billion trips globally



Predict demand hotspots and guide drivers to optimize future matches


70+


Countries


Operating worldwide


Industry Applications: LinkedIn


LinkedIn is fundamentally a professional network, and virtually every feature leverages network analysis to create value for users and the platform.


People You May Know


Network proximity algorithm suggests connections based on shared connections, workplaces, schools, and interests. Friends of friends

are more likely to be relevant connections.


Job Recommendations


Combines network structure (who works where) with skills data to recommend relevant opportunities. Jobs at companies where your

connections work are highlighted.


Recruiter Search


Finding paths to candidates through mutual connections. "Get introduced through John" leverages network paths to facilitate warm

introductions.


Content Feed Ranking


Network-based relevance determines what content you see. Posts from close connections and topics important to your network rise to

the top.


Industry Applications: Netflix & Financial Services


Netflix: Content Recommendation


The Network: User-content bipartite network connecting viewers to shows/movies they've watched



Financial Services: Fraud & Risk


Applications:


|Telecom & Healthcare Applications|Col2|
|---|---|
|Telecommunications<br>Key Finding: Friends of churners are significantly more likely to churn themselves. Network position predicts behavior.<br>Applications:<br>•<br>Churn prediction: Identify at-risk customers based on network exposure<br>•<br>Service bundling: Recommend plans based on friend groups' usage<br>•<br>Network capacity planning: Optimize infrastructure based on call patterns<br>•<br>Influencer marketing: Target well-connected customers for promotions||
|Telecommunications<br>Key Finding: Friends of churners are significantly more likely to churn themselves. Network position predicts behavior.<br>Applications:<br>•<br>Churn prediction: Identify at-risk customers based on network exposure<br>•<br>Service bundling: Recommend plans based on friend groups' usage<br>•<br>Network capacity planning: Optimize infrastructure based on call patterns<br>•<br>Influencer marketing: Target well-connected customers for promotions|Healthcare Systems<br>Network analysis transforms healthcare delivery and medical research through understanding connections between patients, providers, diseases, and treatments.<br>Applications:<br>•<br>Disease spread modeling: Predict and contain outbreak patterns<br>•<br>Drug interaction networks: Identify dangerous combinations<br>•<br>Provider referral patterns: Optimize patient care coordination<br>•<br>Hospital patient flow: Reduce bottlenecks and improve efficiency|


Fraud Detection with Networks


Network analysis has become essential for fraud detection because fraudsters rarely operate alone. Their collaborative patterns create network signatures that traditional analytics miss.


Why Networks Work for Fraud Detection


Fraudsters often operate in organized rings, and these rings are visible in network structure even when individual transactions appear legitimate.



Shared Attributes


Multiple accounts sharing phone numbers, addresses, devices, or IP addresses - unusual overlap suggests

coordination


Application Timing


Coordinated applications within narrow time windows - suggests organized effort rather than independent

actions


Dense Clusters


Fraud rings appear as tightly connected groups with unusually high edge density


Guilt by Association


Nodes connected to confirmed fraudsters have elevated fraud probability



Transaction Patterns


Money flowing in circles or unusual patterns - funds cycling through accounts to obscure origin


Behavioral Similarity


Multiple accounts with identical or highly similar action patterns - automated or scripted activity


Unusual Patterns


New accounts connecting immediately to known fraudsters - early warning signal


Community Detection


Algorithms identify organized fraud rings as distinct communities in the network



Key Principle: "Guilt by association" is a valid and powerful principle in fraud detection. Being connected to fraudsters significantly increases fraud probability, even if individual behavior appears normal.


Network Analysis in R


R provides excellent tools for network analysis, from basic calculations to sophisticated visualizations. The igraph package is the foundation, with tidygraph and ggraph adding modern, tidyverse-friendly interfaces.



Core Package: igraph



Tidyverse Integration: tidygraph








Network Visualization with ggraph


The ggraph package brings the grammar of graphics to network visualization, allowing you to create publication-quality network plots with ggplot2-style syntax.



Multiple Layouts


Choose from force-directed, hierarchical, circular, and many other layout algorithms


Node Aesthetics


Size nodes by centrality, color by community, shape by type



Edge Styling


Control color, width, transparency, and arrow styles for directed edges


ggplot2 Integration


Use familiar ggplot2 syntax for theming, faceting, and layering



Pro Tip: Use dplyr to wrangle your edge list data before creating networks. The tidyverse workflow makes data preparation seamless before network construction.


Case Study: The Enron Email Network


The Enron scandal of 2001 inadvertently created one of the most studied email networks in history when company communications became public during federal

investigation. This dataset has become a gold standard for organizational network research.


### 148

Employees


Nodes in the network


Informal Power Structures


### 644

Email Connections


Directed edges (sender → receiver)


Information Brokers


### 1000+

Research Papers


Published using this dataset



Network analysis revealed who actually communicated with whom versus the

formal organizational chart. Real influence didn't always match titles.


Behavioral Changes


Communication patterns shifted dramatically as the scandal unfolded, visible

in temporal network analysis.



Identified people connecting different groups who weren't in management

positions but held structural power through network position.


Prediction Power


Network position helped predict who would be implicated in wrongdoing

better than formal role alone.



Key Takeaway: The formal org chart shows who reports to whom. The email network shows who actually talks to whom. These are often very different - and

the informal network often matters more for understanding how organizations really function.


**About Enron**


Enron Corporation: former American energy,
commodities, and services company based in
Houston, Texas, ~20,000 employees


2000: one of the world’s major electricity, natural
gas, and communications companies with reported
revenues of $111 billion


Fortune: named Enron #7 in 2001, also named
Enron “America’s Most Innovative Company” for six
consecutive years (1996-2001)


Implicated in the California energy crisis of 20002001 for market manipulation of electricity prices
and the illegal shutdown of gas pipelines from Texas


At the end of 2001, it was revealed that Enron’s
reported financial position was sustained by an
institutionalized, systematic, and creatively planned
accounting fraud


© Copyright National University of Singapore. All Rights Reserved.



36


**Enron email network**




 































 






















































































































































































© Copyright National University of Singapore. All Rights Reserved.



37


**Enron Email Network**


We will analyze the social network formed by emails between 148
former employees of Enron (~1999-2002)

84 energy traders (many at the director or vice president level)
19 top executives
19 lawyers
26 other employees
Emails were released by the FERC (Federal Energy Regulatory
Commission) as part of their investigation into wrongdoing by Enron
Most (98%) of the employees in the dataset were never convicted of
wrongdoing at Enron
The Enron email dataset is the best publicly available email dataset
from a large corporation


© Copyright National University of Singapore. All Rights Reserved.



38


**Enron Email Network, continued**




 






The 148 nodes
represent 148 former
Enron employees


The 644 edges
represent pairs of
employees who
exchanged at least 10
emails in ~1999-2000


© Copyright National University of Singapore. All Rights Reserved.






























 






























































































































































































39


**Enron email network**




 































 






















































































































































































© Copyright National University of Singapore. All Rights Reserved.



40


**We will study four network metrics**


Degree Centrality


Closeness Centrality


Betweenness Centrality


PageRank


© Copyright National University of Singapore. All Rights Reserved.



41


**Degree Centrality**


The **degree** of a node is the number of neighbors of that node

Degree centrality measures the total number of neighbors a node has in
the network, for example:

Number of connections in LinkedIn (or in 15.071)
Number of collaborators in a firm

**Advantage:** simple metric to understand and explain

**Limitation:** does not capture information about value of who you are
connected to

Somebody connected to 10 summer interns has the same degree as somebody
connected to the ten top executives of the firm


© Copyright National University of Singapore. All Rights Reserved.



43


**Degree Centrality in the “Mininet”**





|node|degree|
|---|---|
|A|1|
|B|3|
|C|2|
|D|3|
|E|4|
|F|3|


© Copyright National University of Singapore. All Rights Reserved.











44


**Degree Centrality in Enron Social Network**



Minimum degree of 0 (6
employees are not
connected to any
others)


Maximum degree of 29




                                     

                             
**Michael Grigsby**
**Vice President, ENA**
**West Region Trading**




















 



  
























































































































































**Louise Kitchen**

**Degree: 29**











































© Copyright National University of Singapore. All Rights Reserved.



45


**Closeness Centrality**


© Copyright National University of Singapore. All Rights Reserved.



46


**Closeness Centrality**


The **closeness** of a node is the reciprocal of the sum of the shortest path
lengths from that node to every other node

Closeness centrality measures how central a node is in a network

Needing only a small number of introductions to reach all others in LinkedIn, or in
15.071, or in a firm


**Advantage:** single number to capture how close a node is to the center of
a network
**Limitation:** too “global” in nature, as it is determined by looking at
distances to every other node in the network



© Copyright National University of Singapore. All Rights Reserved.



47


**Closeness Centrality of Node “A” in the Mininet**













|Node|Shortest<br>Path|Distance|
|---|---|---|
|B|A-F-E-B|3|
|C|A-F-E-C|3|
|D|A-F-D|2|
|E|A-F-E|2|
|F|A-F|1|


Closeness(A) =
1/(3+3+2+2+1) = 0.091


© Copyright National University of Singapore. All Rights Reserved.











48


**Closeness Centrality of Node “D” in the Mininet**



|Node|Shortest<br>Path|Distance|
|---|---|---|
|A|D-F-A|2|
|B|D-B|1|
|C|D-E-C|2|
|E|D-E|1|
|F|D-F|1|


Closeness(D) =
1/(2+1+2+1+1) = 0.143


© Copyright National University of Singapore. All Rights Reserved.















49


**Closeness Centrality in Enron Social**
**Network**



Minimum closeness of
0.0017 (average distance of
4.2)


Maximum closeness of
0.0034 (average distance of
2.1)




                                     

                             
**Michael Grigsby**
**Vice President, ENA**
**West Region Trading**
**Closeness: 0.0034**


























 



  














































































































the main _connected_







































































© Copyright National University of Singapore. All Rights Reserved.



50


**Closeness Centrality in Social Networks**


In general we expect all nodes in a social network to have a low average
distance to other nodes and a high closeness centrality


This is due to the concept of “ **six degrees of separation”**

friend-of-a-friend statements can connect anybody in the world in six steps or
less


In practice longer distances can be seen in social networks (such as the
15.071 social network). Why?


© Copyright National University of Singapore. All Rights Reserved.



51


**Betweenness Centrality**


© Copyright National University of Singapore. All Rights Reserved.



52


**Betweenness Centrality**


The betweenness centrality of a node is the
number of shortest paths in the network in which
this node appears


The betweenness of a node _v_ is computed as
follows:

For every pair of nodes _s_ and _t_, compute the shortest
path(s) between _s_ and _t_
Then count the number of times _v_ appears across all
shortest paths between nodes


© Copyright National University of Singapore. All Rights Reserved.



53


**Betweenness Centrality of Node “F” in**
**the Mininet**



|Node Pair|Shortest Path|
|---|---|
|A-B|**A-F-E-B**<br>**A-F-D-B**|
|A-C|**A-F-E-C**|
|A-D|**A-F-D**|
|A-E|**A-F-E**|
|B-C|B-C|
|B-D|B-D|
|B-E|B-E|
|C-D|C-E-D<br>C-B-D|
|C-E|C-E|
|D-E|D-E|


Betweenness(F) = 4


© Copyright National University of Singapore. All Rights Reserved.















54


**Betweenness Centrality of Node “E” in**
**the Mininet**



|Node Pair|Shortest Path|
|---|---|
|A-B|**A-F-E-B**<br>A-F-D-B|
|A-C|**A-F-E-C**|
|A-D|A-F-D|
|A-F|A-F|
|B-C|B-C|
|B-D|B-D|
|B-F|**B-E-F**<br>B-D-F|
|C-D|C-B-D<br>**C-E-D**|
|C-F|**C-E-F**|
|<br>D-F|<br>D-F|


© Copyright National University of Singapore. All Rights Reserved.















55


**Betweenness Centrality, continued**


Betweenness centrality measures the degree to which a node
bridges otherwise disconnected parts of the network

Somebody who collaborates/communicates with both the data science
team and the sales teams in the company
A 15.071 student with friends in both MBA cohorts
Scientist who writes papers in physics and medicine
**Advantage:** single number to capture that a node bridges
different groups
**Limitation:** Over-emphasizes the shortest paths -- it ignores
other nearly-shortest paths between nodes



© Copyright National University of Singapore. All Rights Reserved.



56


**Betweenness Centrality in Enron Social**
**Network**



Minimum betweenness
centrality of 0 (21 nodes
have this value)


Maximum betweenness
centrality of 1200




                                    

                           
**Michael Grigsby**
**Vice President, ENA**
**West Region Trading**
**Betweenness: 1,098**




 



 



 



















  


























































































































































































**Mary Hain**



































© Copyright National University of Singapore. All Rights Reserved.



57


**PageRank in the Enron Social**
**Network**



Minimum PageRank of
0.0011 (the 6 nodes with
no neighbors)


Maximum PageRank of
0.0204




                        
                  
**Michael Grigsby**
**Vice President, ENA**
**West Region Trading**


























 







 
















































































































































**Phillip Allen**













































© Copyright National University of Singapore. All Rights Reserved.



66


**Conclusions**


Social network analysis is emerging as a suite a powerful new
paradigms for analyzing people and work in organizations:

Employee evaluation, retention, churn
Evaluation and solution of wide variety of organizational management
issues
Expect to see entire new consulting opportunities in this space
in the next five years



© Copyright National University of Singapore. All Rights Reserved.



68


