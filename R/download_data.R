#' @author Lauri Ilison
#' @description Opendata.ee datasets for easy of use

data_fin_riigikinnisvara_objektid <- function() {
    require(RCurl)
    csv <- getURL("https://opendata.riik.ee/dataset/df7cd482-0391-4231-b67f-1efd7c4e8a43/resource/8121cbff-f1ff-4d09-954a-aac829a55d32/download/varadeloend.csv")
    df <- read.csv(textConnection(csv),sep = ";")
  return(df)
  }

data_fin_struktuuritoetus <- function() {
    require(RCurl)
    csv <- getURL("https://opendata.riik.ee/dataset/0b8b73d3-ba64-482c-a873-a0b89e745863/resource/61b188b8-eacc-4ce2-9a53-72b7320be4eb/download/toetusesaajad80715.csv")
    df <- read.csv(textConnection(csv),sep = ";")
    return(df)
}

data_fin_riigihangete_register <- function() {
    require(RCurl)
    csv <- getURL("https://opendata.riik.ee/dataset/2681ade3-5250-4283-8f9c-16633a4b081f/resource/f104acb4-736a-499f-8bda-609c5439479d/download/rhravaandmed.csv")
    df <- read.csv(textConnection(csv),sep = ";")
    return(df)
}


data_fin_riigihangete_register <- function() {
    require(RCurl)
    csv <- getURL("https://opendata.riik.ee/dataset/2681ade3-5250-4283-8f9c-16633a4b081f/resource/f104acb4-736a-499f-8bda-609c5439479d/download/rhravaandmed.csv")
    df <- read.csv(textConnection(csv),sep = ";")
    return(df)
}


