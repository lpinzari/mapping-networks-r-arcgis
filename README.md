# Mapping Networks Flow in R and ArcGIS

The objective of this work is to provide basic tools and resources to map Networks flow in R and ArcGIS. To demonstrate how to do it, we created two maps representing spatial interactions between patients and GPs (General Practitioners). For more information about the datasets, the interested reader can refer to the publication  : [A new generation of Primary Care Service Areas or general practice catchment areas](https://onlinelibrary.wiley.com/doi/abs/10.1111/tgis.12287).

## Table of Contents

* [Description](#description)
* [Figures](#figures)
* [Datasets](datasets)
* [Dependencies](#dependencies)
* [Usage](#usage)

### Description

Network flow maps are used to show interconnectivity between places and are usually based on transportation and communication linkages. These flows between places can also represent spatial interactions between *patients* (*demand*) and *health providers* (*supply*), which can be relevant to detect patterns of health service utilization.

### Figures

**Figure 1.** *Network flow map in R*

![Imgur](https://i.imgur.com/eHHkNWw.jpg)

**Figure 2.** *Network flow map in ArcGIS*

![Imgur](https://i.imgur.com/lDj7IVN.jpg)

The map in **Figure 1** and **Figure 2** shows how the population moves from home to the providers (General Practioners - GPs) location and how far they travel. Lines are used to symbolize the flow, typically varied in width to represent differences in the quantity of the flow.

Therefore, the flows of patiens from a geographic area (Postal Area - POA) to GPs in a different geographic area (POA) is represented by a graph whose nodes are the POAs and whose edges represent the strength of the patient flow.

The map in **Figure 1** has been created using the ***flow_plot.R*** script and the files ***centroids.csv***, ***FlowMatrix.csv***. On the other hand, the map in **Figure 2** has been created using the *XY  to line* tool in ArcGIS 10. A good tutorial on how to create a Network Flow in ArcGIS is available on the official website: [Esri](https://www.esri.com/arcgis-blog/products/arcgis-desktop/mapping/creating-radial-flow-maps-with-arcgis/?rmedium=blogs_esri_com&rsource=/esri/arcgis/2011/09/06/creating-radial-flow-maps-with-arcgis/).

Lastly, if you intend to reproduce the map in **Figure 2** and plot the POAs' boundaries, the POA's shape file is needed. The ESRI POA 2016 shape file is available on the ABS (Australian Bureau of Statistics) website, following this link: [Postal Areas ASG Ed 2016 Digital Boundaries in ESRI shapefile Format](https://www.abs.gov.au/AUSSTATS/abs@.nsf/DetailsPage/1270.0.55.003July%202016?OpenDocument).

### Datasets

The ***flow_plot.R*** script reads and join the datasets ***centroids.csv*** and ***FlowMatrix.csv***.

***centroids.csv*** consists of four columns:
- code: Identifier of the POAs
- Name: name of the POA
- East: X coordinate
- North: Y coordinate

***FlowMatrix.csv*** consists of the following three columns:
- origin: patient's POA
- destination: GP's POA
- total: patient's preferences to different location

For more information about the construction of the FlowMatrix, the interested reader can refer to the publication: [A new generation of Primary Care Service Areas or general practice catchment areas](https://onlinelibrary.wiley.com/doi/abs/10.1111/tgis.12287).

### Dependencies
To run the ***flow_plot.R*** script, the following software requirements apply:

- R version 3.3.2 or later version.
- libraries
    - data.table: to read and join the datasets.
    - lattice, spData and classInt: to display the results.

### Usage
Place the script and the csv files in the same directory and run in the R console the ***flow_plot.R***. The output is a pdf file that shows the map displayed in **Fig 1**. If you simply desire to plot the figure in the plot panel just comment lines 39 and 54. Feel free to experiment different colors and background. Enjoy :blush: !
### Author
Ludovico Pinzari

### License
MIT
