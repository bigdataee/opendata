# opendata.ee

Lihtne R-i pakett, mis võimaldab lihtsalt Eesti Open data andmeid R-i keskkonda koguda

## Installeerimiseks

```
library("devtools")
install_github("laurii/opendata.ee")
```

## Näide

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


