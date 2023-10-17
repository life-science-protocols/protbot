# Protein quantification (scenario02)

In this markdown file we are quantifying protein from unknown samples from the EXPERIMENT_LABEL using the METHOD_NAME. First we need to determine the calibration curve ($y=mx+b$).

The absorvance of the calibration and unknown samples were measured with spectrophotometer (BRAND,MODEL) and are store in the file NAME_OF_THE_FILE. The protein used for calibration was PROTEIN_FOR_CALIBRATION (e.g. BSA (BRAND,CatNo, Batch)) prepared in BUFFER.

Now, the first step is to calculate the calibration curve. For that we need to load the `csv` with the absorvance values for the known protein calibration.

```r
my_calibration = input_table1 
```

Now we can run a function to calculate the parameters of the curve, the correlation coefficient and make a plot to visualize the curve.

```r
function(my_calibration)
print(plot_calibration)
# maybe out put quality control check for R2< 0.9 
```

The second step is to quantify the protein for our unknown samples. To do that we need the parameters (slope `m` and intercept `b`) of the calibration curve and the table of the unknown samples. 

%%% this is now similar to the [scenario01](scenario01.md) %%%

```r
my_csv = input_table  #`NAME_OF_THE_FILE` 
```

We want to prepare samples for Western Blot, thus we can quantify the protein in the samples and from that the volume need to load into the gel.

```r
prot_quantification <- function(m,b,my_csv)
```

Now we make a plot with the calibration plot and the points of the unknown samples, to check if the quantification is within recommended limits for the quantification (middle of the curve).

```
print(plot_calibration_with_unknown_samples)
```

Last step is the  results of the quantification and the volumes needed to load the samples into the gel:

```r
print(output_table)
```

---

# Researcher notes

%% Take notes about this experiment here %%

---

# Session info

```
session_info()
```