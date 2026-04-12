## DBA3702

#### **Simulation II**

**Chaithanya Bandi**
**Department of Analytics and Operations**


© Copyright National University of Singapore. All Rights Reserved.


### **Part 1**
# Recap


##### **User-Defined Functions**




##### **The Apply Family — Overview**


|Function|Input|Output|Groups?|
|---|---|---|---|
|apply()|Matrix / Data Frame|Vector or Matrix|No|
|lapply()|List / Vector|List|No|
|sapply()|List / Vector|Vector|No|
|vapply()|List / Vector|Typed Vector|No|
|rapply()|Nested List|Vector|No|
|mapply()|Multiple Vectors|Vector / Matrix|No|
|tapply()|Vector + Factor|Vector|Yes|


##### **What is Monte Carlo Simulation?**

A mathematical technique to simulate all possible outcomes of decisions subject to given probability distributions,
enabling optimal decision-making under uncertainty.


















##### **R's Built-in Distributions**


|Distribution|R Function|Parameters|Use Case|
|---|---|---|---|
|Normal|rnorm(n, mean, sd)|mean, sd|Natural variation (heights, errors)|
|Uniform|runif(n, min, max)|min, max|Equal probability (random angles)|
|Exponential|rexp(n, rate)|rate (1/mean)|Time between events (arrivals)|
|Poisson|rpois(n, lambda)|lambda (rate)|Count of events (orders/day)|
|Binomial|rbinom(n, size, prob)|trials, prob|Number of successes (defects)|
|Beta|rbeta(n, a, b)|alpha, beta|Proportions, probabilities|






##### **Controlling Simulation Accuracy**


```
}

```



##### **Stock Price Simulation**

Model stock prices using Geometric Brownian Motion (GBM) — the foundation of the Black-Scholes model.






##### **Stock Simulation — Analysis & Visualization**


```
abline(v=-VaR_95, col="red", lwd=2)

```



##### **Insurance Claims — Risk Analysis**

Model total annual claims to determine how much reserve capital an insurer needs.

```
 big.mark=","))
 cat("P(claims > $5M): ",
 mean(total_claims > 5e6))

```



##### **Queueing Simulation**

How many servers (cashiers, call agents, etc.) do you need to keep average wait time under 5 minutes?






##### **Simulation Design Patterns — Summary**














##### **When to Use Simulation vs. Analytics**


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


##### **Key Takeaways: Simulation**


















