install.packages("Lahman") 
library(Lahman)
install.packages("shiny") 
library(shiny)
knit2pdf()
runApp()
sdf
shinyapps::setAccountInfo(name='rickwalsh', token='54671BCB33388CF1644BD96EBE94FA23', secret='QhWgiGEjjlfnA7QeoW0hHEHsCcUpRCoG8CuFxTX1')
deployApp()


library(slidify)
library(slidifyLibraries)

author("ddproject")
library(knitr)
install.packages("pdflatex") 
library(pdflatex)
knit2pdf("RM_PROJECT.RMD", "RM_PROJECT.PDF")
?knit2pdf
slidify("index.Rmd")
browseURL("index.html")
publish(  username = "rickwalsh", repo = "ddp")

library(slidify)
author('temp-test')
publish(  repo = "temp-test", username = "rickwalsh")
system('which git')
Sys.which("git")
Sys.getenv('PATH')
Sys.setenv(PATH = paste(Sys.getenv("PATH"), "c:\\Program Files\\Git\\bin", sep=.Platform$path.sep))
git
