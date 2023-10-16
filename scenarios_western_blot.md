To perform Western Blot we need to quantify the protein in our samples to load into the gel.
The goal of this package is to streamline the quantificaiton of protein quantification. 

The main variables that we need to know are number of samples (e.g. control and treated) and the number of biological and technical replicates. 

`biological_group`: `control` `treated` `...`
`biological_replicate`: `1` `2` `3` `...`
`technical_replicate`: `1` `2` `3` `...`

This is important to determinine the number of wells or cuvettes required, and naturally the volume of reagents needed.

Next we need to know the amount of sample to pipette for quantification and/or if it needs to be diluted or not before adding the reaction. 

List of scanarios associated with protein quantification:
    1. state Calibration Curve and quantify samples
    2. perform Calibration Curve and quantification of samples
    3. prepare solutions and/or buffers for a given number of samples, and then step 1 or 2.

Different experimental assays to perform calibration curves:
    1. Bradford assay
    2. BCA assay
    3. Other assay

Although each method has different approaches (chemically speaking) the calibration curve should be performed the same way for all of them using a linear regression.Then, from this curve the unknown samples can be quatified and the output table will give different volumes from different amounts (µg) of protein. 

# Simplest scenario possible

The inputs are:
- the parameters of the equation y=mx+b (`m` is slope and `b` the intercept)
- `input_table` contains:
  - the absorvance values for the samples with unknown protein concentration
  - the amount of protein to load into the gel
  - the max volume allowed to pipette
- `experiment_label` to create a folder with organized data and plots
- `send_results_to_here` path to where the files should be export (optional argument)

The output are:
- a calibration curve (forced)
- a bar plot with protein concentration (y) and samples (x)
- the output_table with correspondent volume for the desired protein amount and buffer to make the max volume

The function would look something like this:

```r
function_scenario01(experiment_label,m,b,r2,input_table, send_results_to_here)
```

And the of input table (fake values):

In this example, this table is ignoring annotation data (biological group, biological_replicate, technical replicate).

| sample |  abs  | amount_prot | max_volume |
| :----: | :---: | :---------: | :--------: |
|   1    | 0.23  |     50      |     20     |
|   2    |  0.1  |     50      |     20     |
|   2    |  0.9  |     50      |     20     |

Example of output table (fake values):

| sample | amount_prot | sample_volume | buffer_volume | max_volume | concentration_prot |
| :----: | :---------: | :-----------: | :-----------: | :--------: | :----------------: |
|   1    |     50      |      10       |      10       |     20     |        0.5         |
|   2    |     50      |      18       |       2       |     20     |        0.1         |
|   3    |     50      |       1       |      19       |     20     |        0.9         |

This function will (option?) also create a directory (name as in `experiment_label`) with:
- 00_R_objects
  - save R objects for (possible) future use
- 01_input_data 
  - a copy of `input_table.csv`
- 02_data_analysis
  - copy `rmd` of `scenario01` from package and runs it
- 03_output_data
  - the `output_table.csv`
- 04_output_plots
  - calibration curve
  - bar plot with quantification
- 05_output_pdf
  - export rmd as pdf/html

Stepwise the function would do this:
1. create the new directory in specified destination (or not)
2. copy the `input_table.csv`
3. copy `rmd` of `scenario01` from package and run it 
   1. this runs another function that reads the absorvance values `df$abs` and performs the protein quantification and appends it to the `input_table` to create the `output_table`
   2. then this is used to calculte the `sample_volume` and `buffer_volume` wich will be appended to the table from the previous step
      1. this could be a function, because it is a transversal step for many methods
4. make the plots
5. export rmd to pdf/or html
6. export R objects
