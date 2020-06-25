library(glmnet)
library(xgboost)
library(rsample)
library(recipes)
library(coefplot)
library(DiagrammeR)
library(ranger)
library(randomForest)
library(partykit)
library(tune)
library(parsnip)

renv::install(c('glmnet'
                , 'xgboost'
                , 'rsample'
                , 'recipes'
                , 'coefplot'
                , 'DiagrammeR'
                , 'ranger'
                , 'randomForest'
                , 'partykit'
                , 'tune'
                , 'parsnip'))