### DBA3702

##### **Programming Functions in R** **Simulation**

**Chaithanya Bandi**
**Department of Analytics and Operations**


© Copyright National University of Singapore. All Rights Reserved.


###### **Outline**


#### **Part 1**
## Programming Structure & Functions in R


###### **Setup — Loading Our Dataset**





**Columns**


 - student_id — unique identifier

 - name — student name

 - department — faculty/major

 - gender — factor variable

 - score — numeric, 0–100

 - hours_studied — numeric

 - attendance_pct — numeric, 0–100


###### **Conditionals — if/else and ifelse()**






###### **ifelse() in Practice — Cleaning & Recoding**






###### **User-Defined Functions**




###### **For Loops — When and How**




|Approach|Speed|Lines|Readability|
|---|---|---|---|
|For loop|Slow|4–6|Moderate|
|apply family|Fast|1|High|
|Vectorized ops|Fastest|1|High|


###### **The Apply Family — Overview**


|Function|Input|Output|Groups?|
|---|---|---|---|
|apply()|Matrix / Data Frame|Vector or Matrix|No|
|lapply()|List / Vector|List|No|
|sapply()|List / Vector|Vector|No|
|vapply()|List / Vector|Typed Vector|No|
|rapply()|Nested List|Vector|No|
|mapply()|Multiple Vectors|Vector / Matrix|No|
|tapply()|Vector + Factor|Vector|Yes|


###### **apply() and sapply() — Core Workhorses**






###### **tapply() — R's Pivot Table**




###### **split() + sapply() — Multi-Column Grouped** **Analysis**






###### **Programming Cheat Sheet**


|I want to...|Use|
|---|---|
|Decide on a single value|if / else|
|Decide on a whole vector|ifelse()|
|Check if any/all meet condition|any() / all()|
|Reuse a block of code|function()|
|Repeat code n times|for loop (prefer apply)|
|Apply across rows/columns|apply()|
|Apply to list elements|lapply() / sapply()|
|Apply by group|tapply()|
|Split, process each piece|split() + lapply()|
|Apply to multiple vectors|mapply()|


###### **Real-World Applications — Quick Patterns**






###### **Key Takeaways**














# Framework Monte
#### **Part 2**
# Carlo Simulation & Distributions


###### **What is Monte Carlo Simulation?**

A mathematical technique to simulate all possible outcomes of decisions subject to given probability distributions,
enabling optimal decision-making under uncertainty.


















###### **Why Simulate Instead of Solve Analytically?**






###### **Discrete Probability Distribution**

A variable with a finite set of outcomes, each with a given probability.






###### **Triangular Distribution**

Defined by minimum (a), maximum (b), and mode (c). Used when only these three parameters are known.






###### **PERT Distribution**

A smoothed version of the triangular distribution using the Beta distribution. More realistic — less weight on
extremes.






###### **R's Built-in Distributions**


|Distribution|R Function|Parameters|Use Case|
|---|---|---|---|
|Normal|rnorm(n, mean, sd)|mean, sd|Natural variation (heights, errors)|
|Uniform|runif(n, min, max)|min, max|Equal probability (random angles)|
|Exponential|rexp(n, rate)|rate (1/mean)|Time between events (arrivals)|
|Poisson|rpois(n, lambda)|lambda (rate)|Count of events (orders/day)|
|Binomial|rbinom(n, size, prob)|trials, prob|Number of successes (defects)|
|Beta|rbeta(n, a, b)|alpha, beta|Proportions, probabilities|






###### **Controlling Simulation Accuracy**


```
}

```



###### **Case 1: Birthday Problem — Version 1**

30 people in a room. Ignoring leap years, what is the probability that at least two share a birthday?






###### **Birthday Problem — Version 2: Finding 50%**

How does the probability change with group size? What's the minimum number of people for P > 50%?






###### **Case 2: Walton Bookstore — Problem Setup**

A classic inventory decision under uncertainty (the Newsvendor Problem).






###### **Walton Bookstore — Building the Simulation**






###### **Walton Bookstore — Finding the Optimal Order**





The optimal order changes — try it!


###### **Case 3: The Dinner Party Gift Problem**

A box is passed around a circular table. Each person flips a coin: heads = right, tails = left. The last person to receive the box
wins. Where should you sit?





guests?


###### **Case 4: Simulating Realistic Data**

Generate synthetic restaurant review data across multiple platforms with platform-specific rating distributions.






###### **Data Simulation — Design Patterns**








###### **Case 5: Estimating Pi with Monte Carlo**

Drop random points in a unit square. Count how many fall inside a quarter-circle. The ratio approximates pi/4.






###### **Estimating Pi — Visualization**




###### **Case 6: The Monty Hall Problem**

Three doors: one has a car, two have goats. You pick a door. The host opens another door (always a goat). Should you switch?


```
monty_hall(1, TRUE)))
cat("Stay:", stay_wins, " Switch:", switch_wins)

```



###### **Case 7: Central Limit Theorem — Visual Proof**

No matter the population shape, the distribution of sample means becomes normal as sample size grows.


```
}

```



###### **CLT — Works for ANY Population Shape**






###### **Case 8: Stock Price Simulation**

Model stock prices using Geometric Brownian Motion (GBM) — the foundation of the Black-Scholes model.






###### **Stock Simulation — Analysis & Visualization**


```
abline(v=-VaR_95, col="red", lwd=2)

```



###### **Case 9: Bootstrap Confidence Intervals**

Estimate confidence intervals for ANY statistic — no distributional assumptions needed.


```
cat("95% CI:", result$ci)

```



###### **Bootstrap — Advanced Applications**






###### **Case 10: Insurance Claims — Risk Analysis**

Model total annual claims to determine how much reserve capital an insurer needs.


```
big.mark=","))
cat("P(claims > $5M): ",
mean(total_claims > 5e6))

```



###### **Case 11: Queueing Simulation**

How many servers (cashiers, call agents, etc.) do you need to keep average wait time under 5 minutes?






###### **Simulation Design Patterns — Summary**














###### **When to Use Simulation vs. Analytics**


|Situation|Analytical|Simulation|
|---|---|---|
|Simple probability (coin, dice)|Preferred|Verification|
|Birthday problem (basic)|Possible|Easier|
|Birthday with leap years|Very hard|Easy change|
|Inventory optimization|Critical ratio|Try all options|
|Stock price distribution|Assumes GBM|Any model|
|Bootstrap CI|Not possible|Only option|
|Queueing with variability|Approximation|Exact model|
|Custom business logic|Usually impossible|Natural fit|


###### **Key Takeaways: Simulation**


















