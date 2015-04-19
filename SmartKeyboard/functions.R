library(stylo)
library(tm)
library(stringr)
library(stringi)

clean_data<-function(text){
        cleanText <- removePunctuation(text)
        cleanText <- removeNumbers(cleanText)
        cleanText <- str_replace_all(cleanText, "[^[:alnum:]]", " ")
        cleanText <- stripWhitespace(cleanText)
        cleanText <- tolower(cleanText)
        return(cleanText)
}

clean_ipt <- function(text){
        ipt <- clean_data(text)
        ipt <- txt.to.words.ext(ipt,language="English.all",preserve.case = TRUE)
        return(ipt)
}
# 
# IPT <- c("I don't")
# ipt <- clean_ipt(IPT)
# n <- length(ipt)

predict_nex_word <- function(n,ipt){
if (n>=3){
        ipt <- ipt[(n-2):n] 
}else if(n==2){
        ipt <- c(NA,ipt)   
        
}else {
        ipt <- c(NA,NA,ipt)
}

        pt <- as.character(tb4[tb4$n1==ipt[1] & tb4$n2==ipt[2] & tb4$n3==ipt[3],][1,]$pred)
 
        if(is.na(pt)){
                pt <- as.character(tb4[tb4$n2==ipt[2] & tb4$n3==ipt[3],][1,]$pred)
          
                if(is.na(pt)){
                        pt <- as.character(tb4[tb4$n3==ipt[3],][1,]$pred)                       
                }
        } 
        
        print(pt)
        
}

