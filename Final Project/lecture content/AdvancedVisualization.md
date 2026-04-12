# DBA3702 Advanced Data Visualization

Chaithanya Bandi
NUS Department of Analytics & Operations


© Copyright National University of Singapore. All Rights Reserved.


## Agenda

01


Module 1 — Interactive ggplot2 Extensions


plotly, ggiraph, and leaflet for linked, hover-enabled, and map-based

graphics; typical use cases include dashboards and spatial

reporting.


03


Module 3 — Animation


gganimate transitions, state changes, and trajectories; includes bar

chart races and longitudinal data structures indexed by time.



02


Module 2 — Specialized Chart Types


ggridges, ggstream, ggalluvial, waffle, and gt for distributional plots,

flow diagrams, compositional displays, and tabular presentation.


04


Module 4 — 3D Visualization


rayshader for converting ggplot2 output into extruded terrain and

perspective renders for elevation, surface, and geospatial data.


MODULE 1
## Making ggplot2 Interactive


Static graphics remain appropriate for publication and archival reporting. For exploratory analysis, dashboards, and web delivery,

interactive layers support zooming, panning, hover metadata, and linked selection . In the R ecosystem, `plotly`, `ggiraph`, and `leaflet`

address different use cases and data structures.











ggiraph


Adds interactivity at the geom level

through HTML widgets. Use when

specific marks need tooltips, hyperlinks,

or selection states. Common in

reporting workflows that require fine
grained control over which observations

respond to hover or click events.


1.1 PLOTLY
## One Line to Interactive


`ggplotly(p)` converts a ggplot object into a Plotly widget by translating the layered grammar into a browser-based JSON/HTML

representation. The original ggplot code remains unchanged; interaction is added at render time.



Start static

```
ggplot(mpg, aes(displ, hwy, color=class)) +
```

`geom_point()` produces a standard scatter plot object with

mapped aesthetics and a point geometry.


Custom tooltips


Use `aes(text = paste("Model:", model, "\nHwy:", hwy))`

or a similar text aesthetic to define hover content explicitly;

this is common in exploratory dashboards and analyst-facing

reports.



Render in Plotly


`ggplotly(p)` converts the ggplot object to an interactive

widget with hover events, zoom/pan controls, and legend
based trace filtering.


3D & animated traces


The lower-level `plot_ly()` API supports multidimensional

encodings and a `frame` aesthetic for animated sequences,

such as longitudinal cohort views or Gapminder-style

country-year panels.


## plotly: Key Design Decisions



plot_ly() — Native plotly interface


Builds the figure directly with plotly traces rather than translating

from ggplot2. It is more verbose, but exposes plotly-native

capabilities such as 3D scenes, animation frames, linked subplots,

and lower-level layout control through `layout()` . This is the more

appropriate API when the structure of the visualization is not a

straightforward 2D statistical chart.


In both cases, the result is an HTML widget that can be embedded

in R Markdown, Quarto, Shiny, and other HTML-based

deliverables. The same conceptual API is also available in Python

for cross-language workflows.


1.2 GGIRAPH
## Surgical Interactivity with ggiraph


ggiraph extends `ggplot2` by making interactivity opt-in at the layer level. Instead of converting an entire plot, you mark specific geoms as

interactive by using the corresponding `geom_*_interactive()` layer.















Typical usage replaces a standard geom with its interactive counterpart, for example `geom_bar_interactive`, `geom_line_interactive`, or

`geom_sf_interactive` . In practice, this is most relevant when the plot contains a moderate number of discrete observations and the analyst

needs hover text or linked emphasis without full plot conversion.


1.3 LEAFLET
###### Interactive Maps with leaflet


`leaflet` is an R interface to the Leaflet.js mapping library. It produces interactive web maps from spatial data, typically `sf` objects, `sp` objects, or data frames with

longitude/latitude columns.











Typical applications include public health surveillance, retail site analysis, logistics routing, real estate pricing, and election mapping. For choropleths, the required

workflow is: read spatial boundaries, join an attribute table by key, classify or scale the numeric variable, and map fill color with an explicit legend.


MODULE 2
### Specialized Chart Types


Standard `ggplot2` geoms cover common distributions, trends, and comparisons. These extensions address visualization problems where the

data structure is non-standard: many-group density comparisons, compositional time series, categorical flows, proportional grids, and encoded

tables.



ggridges


Ridgeline plots for comparing many density

estimates across groups, typically with

ordered categories such as regions, cohorts,

or product segments.


waffle



ggstream


Streamgraphs for stacked area displays

centered on a baseline; used for category

composition over time in settings such as

media traffic, service usage, or market share.


gt + gtExtras



ggalluvial


Alluvial diagrams for categorical flows across

stages or dimensions, such as student

pathways, patient transitions, or customer

funnel movement.



Square-unit grids for part-to-whole composition; useful when

proportions must be read discretely rather than inferred from angles or

curved areas.



Tabular outputs with embedded graphics, including sparklines, bar

indicators, and conditional formatting for reporting, dashboards, and

model comparison tables.


2.1 GGRIDGES
### Ridgeline Plots


Ridgeline plots are most useful when a continuous variable is measured across many groups and the goal is to compare distribution shape,

location, and spread. They are commonly used for monthly climate data, longitudinal biomedical measurements, income distributions by region,

and other settings with 8+ groups.





scale =


Controls vertical overlap. Larger values

compress the ridges more tightly and

make inter-group comparisons easier

when distributions are similar.



rel_min_height =


Suppresses low-density tails relative to

the maximum density in each group.

Useful for removing noise and reducing

visual clutter.






2.2 GGSTREAM
## Streamgraphs — Composition Over Time


Streamgraphs are stacked area charts with a centered, flowing baseline rather than a zero baseline. They are used to examine how the

relative composition of a total changes across time in long-form data, for example genre share in film revenue, pathogen lineage

prevalence, or product mix within a category.



Stream Type Variants


mirror : symmetric about a central baseline.

ridge : stacked from the x-axis.

proportional : normalized so values sum to 1 at each time point.



Streamgraph vs. Stacked Area


Use streamgraphs when the analytic target is relative change in

composition and trajectory. Use stacked area charts when absolute

magnitude is the primary quantity of interest. The `bw` parameter

controls smoothing bandwidth: smaller values preserve local

variation; larger values emphasize long-run trends.


2.3 GGALLUVIAL
#### Alluvial Diagrams — Tracking Category Transitions


Alluvial plots represent the movement of discrete units across multiple categorical axes. They are used to inspect how counts or weights redistribute

through a sequence of variables — for example, passenger outcomes by Class, Sex, and Age in the Titanic data, or customer migration across

segments, channels, and retention states.



Typical applications


Clinical trial disposition, transport mode

shifts, educational progression, market

segment transitions, and any cross-classified

table where path structure matters.


```
geom_alluvium()

```

Renders the ribbons connecting strata

across axes. The `fill` aesthetic typically

encodes the terminal or grouping variable;

ribbon width is proportional to `y` .



Data structure


Supports both wide and long input, but the

plotting data must define ordered categorical

axes and a frequency or weight variable.

Wide form is convenient for fixed multi-axis

tabulations; long form is often easier after

joins or reshaping.


2.4 WAFFLE
## Waffle Charts — Discrete Area Encodings


Waffle charts encode a part-to-whole relationship with a fixed grid of unit squares. Because each tile has identical area, the viewer reads

proportions by counting filled units rather than estimating angles, as in a pie chart.



Encoding Logic


Each square corresponds to a fixed quantity: a percentage point, a

population count, a dollar amount, or another unit defined by the

analyst. The grid introduces an explicit counting structure that is

easier to compare across categories than radial or angular

encodings.


In `waffle`, `iron()` assembles multiple waffle charts into a common

layout for grouped comparison. This is useful when the same

proportional breakdown must be compared across panels, such as

departments, regions, or survey waves.



Typical Applications


Election returns, survey response distributions, budget

composition, demographic composition, and other low-cardinality

part-to-whole summaries. Requires categorical totals that can be

mapped to a finite number of equal-sized tiles.


2.5 GT + GTEXTRAS
### Tables as Visualizations


The `gt` package provides a grammar for constructing publication-quality tables in R. It is used when tabular presentation needs controlled

typography, layout, and cell-level formatting. `gtExtras` extends `gt` with inline graphics embedded directly in table cells, including sparklines, bar

glyphs, and row-level color encoding.

```
 mtcars_summary %>%

 gt() %>%

 gt_plt_sparkline(mpg_data) %>%

 gt_plt_bar(hp, scaled = TRUE) %>%

 gt_color_rows(mpg, palette = "viridis")

```


gt_plt_sparkline()


Embeds a compact line plot in each row.

Appropriate for longitudinal measures,

grouped time series, or repeated

observations stored in list-columns or

nested data.



gt_plt_bar()


Draws a horizontal bar glyph inside a cell.

Useful for within-row magnitude

comparisons when the underlying column

is numeric and a common scale is

required.



gt_color_rows()


Applies conditional row or cell

background fills from a palette, similar to

a table heatmap. Common in reporting

workflows for clinical, financial, or

operational summaries.


MODULE 3
## Animation with gganimate


`gganimate` extends `ggplot2` by adding a temporal or state-based mapping layer. The animation is defined by a `transition_*()`

specification that operates on an existing plot object; no separate animation grammar is introduced. Typical use cases include longitudinal

public-health data, market dynamics, simulation output, and state changes in modeled systems.



Construct the static plot


Specify the baseline `ggplot2` object,

including geoms, scales, facets, and any

grouping required for frame interpolation.



Define the transition


Apply `transition_*()` to a variable that

orders frames, such as time, event

sequence, categorical state, or trajectory.



Render the animation


Export to `GIF`, `MP4` with `av_renderer()`, or

`APNG` ; control frame count with `nframes`

and playback rate with `fps` .


3.1 GGANIMATE
##### The Classic: Gapminder Bubble Chart


The Gapminder example encodes GDP per capita, life expectancy, population, and continent across time. It is a standard longitudinal panel structure: one row

per country-year, with year as the animation variable. In gganimate, the static ggplot specification is preserved and a transition is added as an additional layer.














## Three Transition Functions

In `gganimate`, the transition function defines how observations are mapped across frames. The choice depends on the underlying data

structure: continuous time, discrete states, or a trajectory that should be revealed sequentially.














MODULE 4
## 3D Visualization with rayshader


`rayshader` converts a completed `ggplot2` object into a 3D surface by mapping the fill aesthetic to elevation. The package is most often

used for terrain visualization, raster-based surfaces, and presentation graphics where spatial relief needs to be encoded explicitly.



Core Function


`plot_gg(p)` renders a `ggplot2` object as a

3D mesh. The plot must define a fill or

color mapping; the mapped values

become vertical relief in the output

surface.



Terrain Mapping


For geospatial work, `rayshader` accepts

elevation rasters and other gridded

surfaces. Common applications include

county topography, mountain

morphology, bathymetry, and other

continuous spatial fields.



Implementation Constraints


Rendering depends on system-level

graphics support, including OpenGL. In

reproducible workflows, pre-rendered

outputs are often preferable for

distribution; use `render_snapshot()` for

stills and `render_movie()` for animation

output.


##### Choosing the Appropriate Tool

Select the plotting or reporting system based on the required output, interaction model, and data structure. For most workflo ws, the deciding factor is

whether the artifact is static, interactive, geospatial, temporal, tabular, or rendered for presentation.










## More Advanced Topics

01


Module 5 — Network Visualization


igraph, tidygraph, ggraph, and networkD3 for node-edge data,

layouts, and interactive network displays (30 min)


03


Module 7 — Case Studies


COVID-19 transmission pipeline and artist collaboration network as

examples of temporal and relational data structures (25 min)



02


Module 6 — Beyond R


Python libraries, JavaScript workflows (D3.js, Observable), and no
code visualization tools for cross-platform deployment (20 min)


04


Module 8 — Decision Framework


Criteria for selecting an appropriate visualization method based on

data structure, task, and output constraints (5 min)


MODULE 5
## Network Visualization in R


Network data are represented as vertices and edges. In practice, this includes social graphs, supply-chain relations, citation networks, co
occurrence matrices, and trade flows. The R ecosystem separates graph computation from rendering, with packages for graph objects, tidy

manipulation, and interactive or static visualization.



igraph


Core graph representation and algorithms. Supports centrality,

shortest paths, community detection, and graph simulation.

Common input formats include edge lists, adjacency matrices,

and graph objects.









networkD3


Interactive D3-based network widgets. Used when node

dragging, zooming, and hover inspection are required in HTML

output. Suitable for exploratory reporting and lightweight web

dashboards.




5.1 IGRAPH
## igraph Foundations


Network data are represented as vertices and edges . In `igraph`, these objects are stored as graph structures that support traversal,

centrality, clustering, and other graph algorithms before any visualization step.



Graph Representations


Edge list : Two-column source–target representation. Common in

transaction logs, citation data, and interaction data.

Adjacency matrix : Square matrix with entries indicating whether a

tie exists; appropriate for dense graphs and matrix-based

algorithms.

Adjacency list : Neighbor set stored for each node; more memory
efficient for sparse networks and large-scale relational data.






5.2 TIDYGRAPH
##### Tidy Network Analysis


`tidygraph` represents a network as a `tbl_graph` : two linked tidy tables, one for node attributes and one for edge attributes. The object supports context

switching with `activate()`, so standard `dplyr` verbs can be applied to nodes or edges without converting between graph and data-frame formats.












5.2 GGRAPH
#### ggraph — Network Visualisation with ggplot2 Syntax


`ggraph()` extends the `ggplot2` grammar to graph objects. A layout algorithm maps nodes to 2D coordinates, and subsequent geoms draw edges,

nodes, and labels on that coordinate system.



Layout algorithms


`"stress"` is a common default for general-purpose graphs. Other

options include `"fr"` (force-directed Fruchterman-Reingold), `"kk"`

(Kamada-Kawai), `"circle"`, `"tree"`, and `"drl"` for large graphs,

typically above 10,000 nodes.



Edge geoms


`geom_edge_link()` draws straight segments, `geom_edge_arc()` draws

curved edges, and `geom_edge_fan()` separates parallel edges

between the same node pair. These are commonly used for social

networks, citation graphs, and flow networks where edge multiplicity

matters.


5.3 NETWORKD3
##### Interactive Networks with networkD3


`networkD3` builds browser-based force-directed network visualizations on top of D3.js. The widget is interactive: nodes can be dragged, clusters can be

inspected by zooming, and labels can be exposed on hover. It is commonly used for social networks, citation graphs, communication networks, and other

edge-list data with node attributes.

```
 forceNetwork(

 Links  = MisLinks,

 Nodes  = MisNodes,

 Source = "source",

 Target = "target",

 NodeID = "name",

 Group  = "group",

 opacity = 0.8,

 zoom  = TRUE

 )

```

`sankeyNetwork()` is also available for directed flow diagrams. The output is an HTML widget and can be embedded in R Markdown or Quarto documents

without additional JavaScript setup.


## ggraph vs. networkD3

Both packages represent graphs, but they target different output modalities and interaction models. The choice is determined by analysis

workflow, audience, and delivery format.









In practice, `ggraph` is used when the graph is part of a static analytical narrative; `networkD3` is used when the primary task is inspection of

connectivity, hubs, and local neighborhoods. For large networks, interactive rendering may become slow or visually unstable, so graph size

and edge density should be considered before selecting the output format.


MODULE 6
Beyond R — The Visualization Ecosystem


R is one component of a broader visualization stack. In applied work, tool choice is constrained by the data structure, interactivity requirements, reproducibility needs, and
publication or deployment target.







In practice, these tiers map to different use cases: R / Python for scripted, version-controlled analysis; JavaScript for interactive web delivery; and no-code platforms for
rapid reporting, operational dashboards, and analyst workflows. The main technical distinctions are control over rendering, i nteractivity model, and integration with data
pipelines.


6.1 PYTHON TOOLS
Python Visualization Stack


Python's visualization ecosystem is structurally similar to R's. For students already fluent in ggplot2, the main transition is from R objects and tidyverse conventions to Python
data frames, function signatures, and notebook-based workflows.


6.2 JAVASCRIPT TOOLS
## The JavaScript Tier: D3.js and Observable


This tier covers the low-level JavaScript tools used for bespoke web visualizations and interactive analytic products. D3.js provides direct

control over the DOM, SVG, and event handling; Observable adds a reactive notebook environment and a higher-level plotting layer.












6.3 NO-CODE PLATFORMS
#### Low-Code & No-Code Visualization Tools


These platforms trade off reproducibility, programmatic control, and versionable code for rapid iteration and a lower barrier to entry. In practice, they

are used for stakeholder-facing dashboards, exploratory communication, and operational reporting, especially when the primary task is packaging

existing data rather than building a fully scripted workflow.



Tableau Public


Drag-and-drop dashboard authoring for public datasets. Common in

BI and reporting workflows. Connects to SQL databases,

spreadsheets, and published extracts; output is typically a workbook

with interactive filters, marks, and dashboard-level actions.



Flourish


Template-based visualization platform for animated charts, scrolling

narratives, and map-based stories. Frequently used in editorial and

communications settings. Inputs are usually tabular data or geo data;

output is embeddable HTML with limited control over custom

computation.


Power BI


Microsoft BI platform for enterprise reporting. Strong integration with

Excel, SQL Server, Azure, and Power Query. Common in corporate

analytics environments where dashboard refresh, row-level security,

and semantic models are maintained by non-R workflows.




## The Real-World Tradeoff

R


Analytic control - custom geoms, scales, annotations, and

statistical transformations.

Reproducibility - figures are regenerated from code, data, and

session state.

Workflow integration - joins, reshaping, modeling, and

visualization remain in one pipeline.

Version control - the full analysis is represented in text-based

source files.



No-Code Tools


Rapid assembly - dashboards and scrollytelling outputs can be

produced without authoring code.

Collaborative editing - analysts, managers, and domain specialists

can modify content directly.

Template-constrained design - visual structure is determined by

the tool's predefined components.

Distribution - outputs are often optimized for web publishing and

stakeholder review.


In applied settings, R is typically used for data preparation,

exploratory analysis, and reproducible figure generation. Tools

such as Flourish and Tableau are then used when the deliverable

must be edited or consumed by non-technical stakeholders,

particularly in reporting workflows with CSV, SQL, or spreadsheet

inputs.


MODULE 7
## Case Studies: Integrating Multiple Visual Analyses


The preceding sections covered individual grammar and chart types. These case studies focus on analytical judgment : selecting

appropriate encodings, sequencing multiple views, and using the same underlying dataset to support distinct technical questions.








CASE STUDY A
#### COVID-19: One Dataset, Five Analyses


Dataset: the Our World in Data COVID-19 subset, pre-downloaded for reproducibility. The same longitudinal panel supports multiple analytic views,

each emphasizing a different structure in the data: distribution over time, compositional change, spatial variation, and temporal progression.



01


Data Wrangling


Import with `read_csv()` ; restrict to selected

countries with `filter()` ; parse dates with

`mutate()` ; aggregate by continent with

`group_by(continent)` and `summarize()` . This is

a standard tidy panel-data preprocessing step

for epidemiological time series.


04


leaflet — Geography



02


ggridges — Distribution


Daily case-density profiles by continent across

time. Used to compare variability, skew, and

surge structure across regions with a common

temporal index.


05



03


ggstream — Composition


Monthly share of global cases by continent.

Appropriate for stacked proportional time series

when the question is how contribution to the

total shifts across groups.



Country-level choropleth of vaccination coverage. Requires a spatial join

against ISO country identifiers or a matching geospatial boundary file.



gganimate — Progression


Animated cumulative case trajectories using `transition_reveal(date)` .

Used when the sequence of wave formation and accumulation is the

primary object of analysis.


CASE STUDY B
Artist Collaboration Network


Data: Synthetic Spotify-style collaboration graph generated in code. An undirected edge exists when two artists co-appear on at least one track; edge weights encode
repeated collaborations. The example is small enough for inspection but preserves the data structures used in music recommendation, label analytics, and network
science workflows.


1 Construct Edge List


Derive an artist-pair table from track-level credits. Aggregate duplicate pairs and assign weights by collaboration count.


2 tidygraph — Compute Network Metrics


Use `mutate()` to add degree centrality, betweenness, and community labels via `group_louvain()` . This is the standard preprocessing step before visualization
or downstream modeling.


3 ggraph — Static Visualization


Render a force-directed layout with nodes scaled by follower count and colored by community assignment. This supports structural inspection of hubs, bridges,
and densely connected groups.


4 networkD3 — Interactive Exploration


Use a draggable network view to inspect local neighborhoods, isolate bridge nodes, and compare cluster structure interactively.


5 MDS — Similarity Projection


Convert the collaboration adjacency structure to a distance matrix and project artists into 2D space. Euclidean proximity approximates similarity in sharedcollaboration patterns.


## Networks Extend Beyond Social Media

The artist collaboration example uses music data because the graph structure is easy to inspect, but the same methods generalize to any

relational dataset. In practice, network analysis is used wherever entities are connected by co-occurrence, flow, exchange, or shared

membership.



Supply Chains


Nodes are suppliers, plants, or distribution centers. Edges represent

material flow, and centrality measures can identify bottlenecks and

single points of failure.


Ingredient Co-occurrence


Nodes are ingredients. Edges connect ingredients that appear in the

same recipe or product formulation, supporting analysis of

substitution and flavor-pairing structure.



Co-authorship and Citations


Nodes are researchers or papers. Edges encode co-authorship or

citation links, and community structure often aligns with subfields or

research programs.


Trade Flows


Nodes are countries, firms, or ports. Weighted edges represent

trade volume or shipment intensity, and betweenness can highlight

intermediary hubs in the network.


MODULE 8
## Choosing the Right Visualization


Visualization choice is a specification problem: the encodings must match the data structure, the analytical question, and the

communication context. This framework organizes that decision across three dimensions: data type, audience, and message.









What is the data structure?


Numeric → scatter, line, histogram,

density. Categorical → bar, dot, waffle.

Temporal → line, area, stream graph,

animation. Geospatial → choropleth,

proportional symbols. Relational →

network, Sankey.



What is the delivery context?


Technical report → static `ggplot2`

output with explicit scales and

annotations. Live presentation →

simplified static graphics or controlled

animation. Exploratory analysis →

`plotly`, `Shiny`, or linked brushing.

External communication → Flourish, D3,

or other interactive web output when

interactivity is required.



What is the inferential target?


Comparison → bar, dot, Cleveland plot.

Trend → line, area, stream graph.

Distribution → histogram, density, ridge,

violin. Composition → stacked bar,

waffle, alluvial. Association → scatter,

heatmap. Connection → network,

Sankey.


###### Package → Chart Type Matrix

Reference matrix for selecting an R visualization package from the target chart form. The mapping below reflects typical usage in analysis notebooks, reporting

pipelines, and production dashboards.


## The Golden Rule of Visualization

The best visualization is the one that supports correct interpretation within seconds. Select the tool that matches the data structure, the

analytic task, and the delivery context — not the one you know best or the one with the most visual novelty.



Prioritize Interpretability


A straightforward, well-labeled bar chart

is often preferable to a more elaborate

alluvial diagram if the latter imposes

unnecessary cognitive load. The objective

is rapid decoding of the encodings and

labels.



Choose Tools by Data and
Workflow


For applied work, package choice

depends on the task: ggplot2 for static

grammar-based graphics, plotly or

ggiraph for interactivity, Tableau or

Flourish for delivery-driven dashboards.

Selection should reflect the target output

and the downstream maintenance burden.



Reproducibility Is a Requirement


Visualization pipelines should be scripted,

version-controlled, and parameterized.

Figures that cannot be regenerated from

the source data and code are not suitable

for iterative analysis, review, or

publication workflows.


