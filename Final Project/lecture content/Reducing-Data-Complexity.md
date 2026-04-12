##### DBA3702

### DVANCED ATA NALYSIS
# A D A
## DIMENSIONALITY REDUCTION

**Chaithanya Bandi**
**Department of Analytics and Operations**


© Copyright National University of Singapore. All Rights Reserved.


##### The Real-World Problem

The Scenario


A brand tracker survey collects ratings on 50 perception items from 400

respondents across 5 competing brands. The research team needs to

deliver clear, actionable positioning advice to the marketing director — in

15 minutes.


You cannot visualize, present, or model 50 dimensions at once. No

executive will read 50 bar charts. No regression model will stay stable

with 50 correlated predictors.



The Core Tension


Richness vs. clarity: Surveys capture nuance through many

items, but decision-making requires simplicity.

Dimensionality reduction bridges this gap — preserving

information while making it humanly interpretable.


Goal: Reduce 50 items to 3–5 meaningful dimensions that

drive strategy, communicate clearly, and feed into

downstream models.


MODULE 1
##### The Promise of Dimensionality Reduction


Fifty survey items collapse into a small number of interpretable dimensions that capture the essential structure of the data.



Dimension 1: Premium vs.
Budget


Loads heavily on: expensive, quality,

professional, exclusive


Separates prestige brands from value

offerings in consumer perception



Dimension 2: Modern vs.
Traditional


Loads heavily on: innovative, fresh vs.

reliable, trustworthy


Captures the innovation positioning of a

brand relative to its heritage



Dimension 3: Playful vs. Serious


Loads heavily on: fun, youthful vs.

sophisticated, professional


Reveals the emotional personality of

each brand in the competitive set



Three dimensions replace fifty items — preserving strategic signal while eliminating noise.


MODULE 1
##### Three Techniques at a Glance













All three methods reduce complexity, but they start from different assumptions and answer different questions. Choosing correctly depends

on your research goal — a distinction we will drill throughout this session.


MODULE 1
###### Real-World Applications










MODULE 2 — DATA SETUP & STANDARDIZATION
##### The Dataset: brand_ratings.csv



Structure


~400 observations (80 per brand, 5 brands: a, b, c, d, e)


9 numeric attributes on a 1–10 Likert-type scale:


- sophisticated, fun, latest, trendy

- rebuy, reliable, cheap, expensive, professional


1 categorical column: brand (a, b, c, d, e)



Loading & Inspecting



Use `str()` to confirm column types and `table()` to verify balanced

brand counts (≈80 per brand). The 1–10 scale makes

standardization straightforward but still necessary.




MODULE 2
##### Why Standardize?


The Problem


Even when all items share the same 1–10 scale, variances differ

across attributes . The attribute "fun" may vary widely across

brands (σ² = 4.2), while "reliable" may cluster at 7–8 (σ² = 0.9).

Without standardization, PCA will be dominated by high-variance

variables — not because they are more important, but simply

because they spread more.



The Solution: scale()



`scale()` transforms each column to mean = 0, SD = 1, giving every

attribute an equal opportunity to influence the analysis.


Always standardize survey and rating data before PCA or EFA. Only skip standardization if variables are on the same meaningful

scale and variance differences carry real-world significance (e.g., dollars spent across categories).


MODULE 3 — CORRELATION ANALYSIS
##### Computing & Interpreting the Correlation Matrix



Code


What to Look For


- r > 0.6 : variables share substantial information →

candidates for the same component/factor

- r ≈ 0 : variables contribute unique, independent

information

- r < 0 : variables sit at opposite ends of a dimension



Interpretation Logic


High correlation signals redundancy - two items are measuring the same

underlying concept. Dimensionality reduction exploits this redundancy by

replacing correlated items with a single summary score.


Near-zero correlation signals independence - these items will likely load

on different components or factors.


Negative correlation signals opposition - one item is the conceptual

mirror of another, and they define opposite poles of a dimension (e.g.,

cheap expensive).


MODULE 3
##### Visualizing Correlations with corrplot



Basic & Enhanced Plot



Reading the Output


- Blue circles = positive correlation; Red = negative

- Circle size = magnitude of r

`•` `order = "hclust"` re-orders variables using hierarchical

clustering, visually grouping correlated blocks together


The clustered corrplot is often the first "aha" moment — you can

already see which attributes will likely form factors before running

a single dimension-reduction algorithm.


MODULE 3
##### Brand-Mean Heatmap


Code



Discussion: Reading the Heatmap


Before running PCA or MDS, the brand-mean heatmap gives a

direct visual answer to key strategic questions:


- Which brand shows consistently dark values on "expensive,"

"sophisticated," "professional"? → Premium brand

- Which brand shows dark values on "fun," "latest," "trendy"? →

Exciting/trendy brand

- Which two brands have the most similar color profiles ? →

Closest competitors


This visual foreshadows what PCA and MDS will formalize

mathematically.


MODULE 4 — PRINCIPAL COMPONENT ANALYSIS
What Is PCA?









PCA finds new coordinate axes — called principal components — through the data cloud. PC1 captures the direction of maximum variance in the data; PC2

captures maximum remaining variance orthogonal (perpendicular) to PC1; and so on. Each component is a linear combination of the original variables. The

process continues until all variance is accounted for — producing exactly as many components as original variables, though most variance concentrates in

the first few.


MODULE 4
##### PCA Key Terminology


Component


A new composite variable — a weighted linear combination of

all original variables. PC1 is the most informative; PC9 (with 9

inputs) is the least.


Score


An individual observation's value on a component. Used in

downstream analyses: regression, clustering, classification.


Scree Plot


Eigenvalues plotted in descending order. The "elbow" point

suggests how many components to retain.



Loading


The weight of an original variable on a component. Large

absolute loading → that variable strongly "belongs to" this

component.


Eigenvalue


The variance captured by that component. Equals the sum of

squared loadings for the component across all variables.


Biplot


An overlay of loadings (arrows) and scores (points) in the same

2D space. The most powerful PCA diagnostic.


MODULE 4
##### The Math (Simplified)


The PCA Equation


Each principal component is a weighted sum of the original

variables:


The weights w (loadings) are chosen to maximize the variance of

the resulting component, subject to the constraint that the loading

vector has unit length.


These weights come from the eigendecomposition of the

correlation matrix R = V \Lambda V^T, where \Lambda contains the

eigenvalues and V contains the eigenvectors (loadings).



What This Means Practically


- Each eigenvalue = variance explained by that component

- Sum of all eigenvalues = number of original variables (after

standardization)

- Proportion of variance explained by PCk = eigenvaluek / total

eigenvalues

- Components are orthogonal : they are uncorrelated by

construction (in standard PCA)


MODULE 4
##### Live Code: PCA on Brand Ratings



Step 1 — Individual-Level PCA





Step 2 — Brand-Mean PCA + Biplot



Interpreting the Output


`summary()` shows the proportion and cumulative proportion of

variance explained by each component — your first guide to

retention.


`$rotation` contains the loading matrix. Each column is a

component; each row is an original variable. Read across rows to

see which component an attribute loads on; read down columns to

name the component.


`biplot()` overlays arrows (loadings) and points (brand means) in

the same 2D space.






MODULE 4
##### Reading a Biplot


Arrows Same Direction


Positively correlated variables. They share variance and may

belong to the same component. Example: "expensive" and

"sophisticated" pointing together.


Arrows Opposite Directions


Negatively correlated variables. They define the two poles of a

dimension — e.g., "cheap" pointing opposite "expensive."


Points (Brand Scores)


Brands projected onto the component space. Brands close

together are perceived similarly . A brand near an arrow's tip

scores high on that attribute.



Arrows at 90°


Uncorrelated variables. They provide independent information

and likely belong to different components.


Arrow Length


Longer arrow = greater contribution to the displayed

components. Short arrows indicate variables poorly represented

in 2D.


Quadrant Strategy


Top-right = Premium + Exciting; Top-left = Premium +

Traditional; Bottom-right = Value + Exciting; Bottom-left = Value

+ Traditional.


MODULE 5 — DECIDING HOW MANY COMPONENTS
How many components?


PCA always produces as many components as input variables — 9 components for 9 attributes. We must decide how many to keep . Too few and we lose important
information; too many and we defeat the purpose of dimensionality reduction.



Kaiser Rule



Scree Plot







Retain components with eigenvalue > 1 — meaning the component explains more
variance than a single original variable. Simple but sometimes too permissive.


Cumulative Variance



Plot eigenvalues in order; look for the "elbow" where the curve flattens. Components
before the elbow are worth keeping. Subjective but widely used and intuitive.


Parallel Analysis





Retain enough components to reach a cumulative variance threshold (80%, 85%, or
90%). Directly interpretable and domain-appropriate.



Generates random data with the same dimensions; retains only components with
eigenvalues exceeding the random baseline. The most statistically rigorous criterion.


MODULE 6
##### When to Use EFA





Theory Testing


You have a conceptual model predicting that attributes should

cluster in a specific pattern. EFA tests whether the observed

data supports your theoretical groupings .



Separating Shared vs. Unique Variance


EFA explicitly partitions variance into communality (shared with

other items via factors) and unique variance (item-specific +

measurement error). PCA conflates these.


MODULE 6
Running EFA: Steps 1–3


Step 1: Determine Number of Factors



Interpreting the Fit Test


The `factanal()` output includes a chi-square goodness-of-fit test at the bottom.

This tests the null hypothesis: "The factor model fits the correlation matrix

adequately."


- p < 0.05 : Reject null → the model does NOT fit. Add more factors.

- p > 0.05 : Fail to reject → the factor count is adequate.


With our brand data, 2 factors fail the fit test; 3 factors pass. Combined with

parallel analysis, this confirms 3 factors as the appropriate solution.





Step 2: Try 2 Factors







Step 3: Try 3 Factors






MODULE 8 — MULTIDIMENSIONAL SCALING
##### What Is MDS?





MDS takes a matrix of pairwise distances or dissimilarities as input and finds low-dimensional coordinates that preserve those distances as

faithfully as possible. Think of it as "unfolding" a distance table — like a travel-time matrix between cities — into a spatial map where

proximity reflects similarity. Unlike PCA, MDS does not need raw variable scores; it only needs the distances between objects.


MODULE 8
##### MDS vs. PCA: Key Differences






|Input Data<br>PCA: Works on raw variable scores (observations × variables<br>matrix)<br>MDS: Works on pairwise distances or dissimilarities — no raw<br>variables needed|Data Type<br>PCA: Requires interval or ratio-scale data<br>MDS: Can handle ordinal data (non-metric MDS uses only rank<br>order)|
|---|---|
|Output<br>PCA: Loadings explain what drives each dimension<br>MDS: Coordinates only — axes have no inherent meaning; you<br>must label them post-hoc|When to Choose<br>PCA: You have rich attribute data and want to understand what<br>drives positioning<br>MDS: You have similarity judgments, preference rankings, or<br>want to validate a PCA map|


MODULE 9 — PUTTING IT ALL TOGETHER
Complete Brand Analysis Workflow


Steps 1–2: Load & Standardize


`read.csv()`, `str()`, `summary()`, then `scale()`    - foundation for all subsequent steps


Steps 3: Correlation Analysis


`cor()` + `corrplot()`      - identify correlated clusters and choose method


Steps 4–5: PCA


`prcomp()`, scree plot, Kaiser + parallel analysis → retain 3 components; `biplot()` for positioning map


Steps 6–7: EFA


`factanal()` with oblimin rotation, chi-square fit test → Bartlett factor scores for downstream modeling


Steps 8–10: MDS + Strategy


`cmdscale()` or `isoMDS()` → perceptual map → cluster preview → strategic positioning recommendations


MODULE 9
##### Key Insight: Methods Converge



Brand A: Premium & Loyal


Consistently positioned in the premium quadrant across PCA,

EFA, and MDS. High loadings on sophisticated, expensive,

professional. Low excitement scores.


Brand C: Undifferentiated


Near origin in all three maps. Middle-of-the-road on every

dimension. Strategic risk: no clear reason for consumers to

choose over A or B.



Brand B: Exciting & Value


High scores on fun, latest, trendy across all methods. Moderate

loyalty. The "exciting challenger" — differentiated but not

premium.


Brand E: Traditional Value


Low excitement, moderate premium scores, reliable positioning.

Trusted but lacks innovation appeal. Repositioning toward

tech/modern attributes could unlock growth.



Convergence across methods = confidence in interpretation. When three independent analytical approaches tell the same story, you can

present it to a board with conviction.


MODULE 10
###### Common Pitfalls & How to Avoid Them


















MODULE 10
R Functions Cheat Sheet




