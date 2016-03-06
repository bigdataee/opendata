# Estonian Open Data

A simple R library that allows to effortlessly load data from [opendata.riik.ee](http://opendata.riik.ee).

## Installation

```
library("devtools")
install_github("bigdataee/opendata")
```

## Example

```
library(opendata.ee)
library(ggplot2)

df <- data_fin_struktuuritoetus()

View(df)

# Struktuuritoetuste saajate arv jur. staatuse kaupa
p <- ggplot(df, aes(factor(toetuse_saaja_juriidiline_vorm)))
p + geom_bar() + coord_flip() +
    xlab("Juriidiline vorm") +
    ylab("Arv") +
    ggtitle("Struktuuritoetuste saajate arv juriidilise staatuse kaupa")
```
