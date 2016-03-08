#' Riigi kinnisvaraobjektid
#' @title Riigi kinnisvaraobjektid
#' @name data_fin_riigikinnisvara_objektid
#' @description Opendata.ee riigi kinnisvaraobjektide nimekiri
data_fin_riigikinnisvara_objektid <- function() {
    require(RCurl)
    cat("Downloading data... ")
    csv <- getURL("https://opendata.riik.ee/dataset/df7cd482-0391-4231-b67f-1efd7c4e8a43/resource/8121cbff-f1ff-4d09-954a-aac829a55d32/download/varadeloend.csv")
    df <- read.csv(textConnection(csv),sep = ";")
    cat("done.\n")
    return(df)
  }

#' Stuktuuritoetused
#' @title Struktuuritoetuste info
#' @name data_fin_struktuuritoetus
#' @description Opendata.ee riigi struktuuritoetuste nimekiri
data_fin_struktuuritoetus <- function() {
    require(RCurl)
    cat("Downloading data... ")
    csv <- getURL("https://opendata.riik.ee/dataset/0b8b73d3-ba64-482c-a873-a0b89e745863/resource/61b188b8-eacc-4ce2-9a53-72b7320be4eb/download/toetusesaajad80715.csv")
    df <- read.csv(textConnection(csv),sep = ";")
    cat("done.\n")
    return(df)
}

#' Riigihangete registri info
#' @title Riigihangete registri info
#' @name data_fin_riigihangete_register
#' @description Opendata.ee riigi riigihangete registri info
#' @param none
data_fin_riigihangete_register <- function() {
    require(RCurl)
    cat("Downloading data... ")
    csv <- getURL("https://opendata.riik.ee/dataset/2681ade3-5250-4283-8f9c-16633a4b081f/resource/f104acb4-736a-499f-8bda-609c5439479d/download/rhravaandmed.csv")
    df <- read.csv(textConnection(csv),sep = ";")
    cat("done.\n")
    return(df)
}

#' Riigiteenuste registri info
#' @title Riigiteenuste registri info
#' @name data_riigiteenused
#' @description Riigiteenuste andmebaas
#' @param none
data_riigiteenused <- function(){
    require(rjson)
    df <- jsonlite::fromJSON("https://www.riigiteenused.ee/api/et/all")
    return(df)
}

#' Eesti Vabariigi piiripunktid
#' @title Eesti Vabariigi piiripunktid
#' @name data_ppa_piiripunktid
#' @description Riigi piiripunktide kontaktid koos piiriületamise võimaluse ja piirangutega.
#' @param none
data_ppa_piiripunktid <- function() {
  require(RCurl)
  cat("Downloading data... ")
  csv_text <- getURL("https://www.politsei.ee/dotAsset/528868.csv")
  csv_text <- gsub("\u0096", "-", csv_text) # Replace Unicode dashes
  df <- read.csv(textConnection(csv_text),sep = ";")
  cat("done.\n")
  return(df)
}

#' Riiklik alkoholiregister
#' @title Riiklik alkoholiregister
#' @name data_agri_alkoholiregister
#' @description Riigis käideldavate alkoholitoodete register
#' @param convert_to_df Convert the downloaded XML to a data frame?
data_agri_alkoholiregister <- function(convert_to_df=True) {
    require(rvest)
    cat("Downloading data... ")
    x <- read_xml("https://alkoreg.agri.ee/avaandmed")
    cat("done.\n")

    if(convert_to_df) {
        # Extract features from all products into vectors
        cat("Converting XML into data frame...")
        products <- xml_children(x)
        regEntryDate <- as.Date(xml_text(xml_find_all(products, ".//regEntryDate")))
        productClass <- as.factor(xml_text(xml_find_all(products, ".//productClass")))
        productName <- xml_text(xml_find_all(products, ".//productName"))
        producerName <- xml_text(xml_find_all(products, ".//producerName"))
        producerCountry <- as.factor(xml_text(xml_find_all(products, ".//producerCountry")))
        applicantName <- as.factor(xml_text(xml_find_all(products, ".//applicantName")))
        capacity <- xml_text(xml_find_all(products, ".//capacity"))
        ethanolRate <- as.numeric(xml_text(xml_find_all(products, ".//ethanolRate")))

        # Combine vectors into data frame
        df <- data.frame(regEntryDate, productClass, productName, producerName,
                         producerCountry, applicantName, capacity, ethanolRate)
        cat("done.\n")
        return(df)
    } else {
        return(x)
    }
}

#' Rahvastikuregistri nimed
#' @title Rahvastikuregistri nimed
#' @name data_sisemin_rahvastikuregistri_nimed
#' @description Andmestik kõigi rahvastikuregistri nimedega
#' @param none
data_sisemin_rahvastikuregistri_nimed <- function() {
    library(readxl)
    # Download the file into a temporary file locally
    filename <- paste0(tempfile(), ".xlsx")
    file_url <- "https://opendata.riik.ee/dataset/7b363ff9-fbff-4473-a057-7c95c7f0fe0d/resource/c604ac34-c135-48ce-a514-d81ab41d242b/download/andmestikrahvastikuregistrinimedega.xlsx"
    cat("Downloading data... ")
    download.file(file_url, filename, method="libcurl")
    cat("done.\n")

    # Read data from the temporary file into a data.frame()
    df <- read_excel(filename, col_names=c("Eesnimi"))

    return(df)
}