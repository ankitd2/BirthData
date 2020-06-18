library(readr)
US_births_2018_ <- read_csv("~/Downloads/US_births(2018).csv")

class(US_births_2018_)
us_births = as.data.frame(US_births_2018_)
class(us_births)
summary(us_births)
(sum(us_births$RDMETH_REC == 4) + sum(us_births$RDMETH_REC == 3) + sum(us_births$RDMETH_REC == 6))/length(us_births$RDMETH_REC)
us_births$csection = (us_births$RDMETH_REC == 4) | (us_births$RDMETH_REC == 3) | (us_births$RDMETH_REC == 6)
sum(us_births$csection)

us_births$csection = as.integer(us_births$csection)
sum(us_births$csection)
us_births$csection == TRUE

hist(us_births$RDMETH_REC)
sum(us_births$csection == TRUE & us_births$BFACIL != 1)
sum(us_births$csection == TRUE & (us_births$BFACIL != 1 | us_births$BFACIL != 6))
sum(us_births$csection == TRUE & (us_births$BFACIL != 1 & us_births$BFACIL != 6))
sum(us_births$csection == TRUE & (us_births$BFACIL != 1 & us_births$BFACIL != 6 & us_births$BFACIL != 2))
sum(us_births$csection == TRUE & (us_births$BFACIL != 1 & us_births$BFACIL != 6 & us_births$BFACIL != 2 & us_births$BFACIL != 9))
sum(us_births$csection == TRUE & (us_births$BFACIL != 1 & us_births$BFACIL != 6 & us_births$BFACIL != 2 & us_births$BFACIL != 7))
sum(us_births$csection == TRUE & (us_births$BFACIL != 1 & us_births$BFACIL != 6 & us_births$BFACIL != 2 & us_births$BFACIL != 7 & us_births$BFACIL != 9))
us_births[0]
us_births[c(-1)]
us_births[c(3)]
cols(us_births)
columns(us_births)
colnames(us_births)
as.data.frame(colnames(us_births))
us_births[c(3,4,5,8,9,10,11,14,15,19,24,25,26,30,32,36, 38,39,40,41,44,45,46,47,48,49,53,54,55,56)]
births_subset = us_births[c(3,4,5,8,9,10,11,14,15,19,24,25,26,30,32,36, 38,39,40,41,44,45,46,47,48,49,53,54,55,56)]

births_subset$PREV_BIRTHS = births_subset$PRIORDEAD + births_subset$PRIORLIVE
df_birth = births_subset[!(births_subset$BMI == 99.9 | births_subset$CIG_0 == 99 | births_subset$DBWT == 9999 | births_subset$DMAR == 9 | births_subset$DOB_TT == 9999 | births_subset$FAGECOMB == 99 | births_subset$FEDUC == 9 | births_subset$FRACE6 == 9 | births_subset$LD_INDL == 'U' | births_subset$MEDUC == 9 | births_subset$MM_AICU == 'U' | births_subset$M_Ht_In == 99 | births_subset$NO_INFEC == 9 | births_subset$NO_MMORB == 9 | births_subset$NO_RISKS == 9 | births_subset$PRECARE == 99 | births_subset$PREVIS == 99 | births_subset$PRIORLIVE == 99 | births_subset$PRIORDEAD == 99 | births_subset$PRIORTERM == 99 | births_subset$PWgt_R == 999 | births_subset$RF_CESARN == 99 | births_subset$WTGAIN == 99),]
as.data.frame(colnames(df_birth))
df_birth = df_birth[c(-18,-19,-31)]
births_subset$PREV_BIRTHS = births_subset$PRIORDEAD + births_subset$PRIORLIVE
as.data.frame(colnames(df_birth))
df_birth$PREV_BIRTHS = df_birth$PRIORDEAD + df_birth$PRIORLIVE
as.data.frame(colnames(df_birth))
df_birth = df_birth[c(-29)]
summary(df_birth)
nrow(na.omit(df_birth))
births_final = na.omit(df_birth)
summary(births_final)
as.data.frame(colnames(df_birth))
df_birth = df_birth[c(-11, -12)]
as.data.frame(colnames(births_final))
births_final = births_final[c(-11, -12)]

which(births_final$MM_AICU == 'Y')
as.numeric(as.factor(births_final$MM_AICU))[743]
summary(births_final$MM_AICU)
births_final$MM_AICU = as.numeric(as.factor(births_final$MM_AICU))
births_final$SEX = as.numeric(as.factor(births_final$SEX))
summary(births_final)
as.numeric(births_final$RF_CESARN)
max(births_final$RF_CESARN)
which.max(births_final$RF_CESARN)
as.numeric(births_final$RF_CESARN)[728418]
births_final$RF_CESARN = as.numeric(births_final$RF_CESARN)
summary(births_final)
pwd
pwd()
setwd("~/")
write.csv(births_final, "births_final.csv", row.names = F)
colnames(births_final)

nrow(us_births)
births_final$DOB_MM[births_final$csection==1]
hist(births_final$DOB_MM[births_final$csection==1])
