# Protein quantification (scenario01)

In this markdown file we are quantifying protein from unknown samples from the EXPERIMENT_LABEL using the METHOD_NAME. We already know that the calibration curve ($y=mx+b$) has the parameters:

```r
#calibration curve slope
m = m
# calibration curve intercept
b = b
# correlation coefficient
R2 = r2
```
The absorvance of samples were measured with spectrophotometer (BRAND,MODEL) and are store in the file NAME_OF_THE_FILE.

```r
my_csv = input_table  #`NAME_OF_THE_FILE` 
```

We want to prepare samples for Western Blot, thus we can quantify the protein in the samples and from that the volume need to load into the gel.

```r
prot_quantification <- function(m,b,my_csv)
```

These are the results of the quantification and the volumes needed to load the samples into the gel:

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