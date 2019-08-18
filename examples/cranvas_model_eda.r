library(ggplot2)
library(reshape2)
library(plyr)
#library(dplyr)
#library(tidyr)
library(meifly)
library(cranvas)
library(magrittr)

#View dataset
View(swiss)

#Fit models
y <- swiss$Fertility
x <- swiss[, -1]
mods <- fitall(y, x, "lm")
summary(mods)

ensamble_summary    <- summary(mods)
ensamble_summary_m  <- melt(ensamble_summary[,1:6], id = 'df')

es_m_norm <-
  ddply(ensamble_summary_m, 'variable', mutate,
  norm_value = (value - min(value))/(max(value)-min(value)))

qplot(df, norm_value, data = es_m_norm) + facet_grid(.~variable)

#Coefficients
e_coeff <- coef(mods)
qplot(variable, raw, data = e_coeff)
qplot(variable, std, data = e_coeff) 
qplot(variable, t, data = e_coeff)

#Residuals
e_resid <- resid(mods)
summary(resid(mods))

#-------------------
#Cranvas exploration
#-------------------
qm_summary  <- qdata(summary(mods))

qe_coef_raw <- 
  coef(mods) %>%
  dcast(model ~ variable, value.var = 'raw') %>%
  qdata()

qe_coef_std <- 
  coef(mods) %>%
  dcast(model ~ variable, value.var = 'std') %>%
  qdata()

qe_coef_t <- 
  coef(mods) %>%
  dcast(model ~ variable, value.var = 't') %>%
  qdata()

link_cat(mf1 = qe_coef_t, var1 = 'model', mf2 = qm_summary, var2 = 'model')
link_cat(mf1 = qe_coef_raw, var1 = 'model', mf2 = qe_coef_std, var2 = 'model')
link_cat(mf1 = qe_coef_raw, var1 = 'model', mf2 = qm_summary, var2 = 'model')

#qparallel(~ Agriculture + Examination + Education +	Catholic + Infant.Mortality, glyph = "tick",  data = qe_coef_raw, scale = 'I')
qparallel(~ Agriculture + Examination + Education +  Catholic + Infant.Mortality, glyph = "tick",  data = qe_coef_std, scale = 'I')
#qparallel(~ Agriculture + Examination + Education +  Catholic + Infant.Mortality, glyph = "tick",  data = qe_coef_t, scale = 'I')

qscatter(df, logL, data = qm_summary)

record_selector(model, qm_summary)

#Residual level
e_resid <- residuals(mods)
summary(e_resid)

qe_resid  <- e_resid %>% qdata()
qswiss    <- swiss %>% mutate(obs = row.names(swiss)) %>% select(-Fertility) %>% qdata()



#qe_coef_raw <- coef(mods) %>% dcast(model ~ variable, value.var = 'raw') %>% qdata()

link_cat(mf1 = qe_resid, var1 = 'obs', mf2 = qswiss, var2 = 'obs')


qscatter(resid, obs, qe_resid)
qscatter(dffit, cov.r, qe_resid)
qparallel(~ Agriculture + Examination + Education +  Catholic + Infant.Mortality, glyph = "tick",  data = qswiss, boxplot = T, scale = 'I')
