/* Data cleaned and validated using R
*
* Output generated on SAS Studio
*
*/

data births;
	infile '/home/adatta17050/STAT448/births_final.csv' dlm=',' firstobs=2;
	input BMI CIG_0 DBWT MAR MONTH TIME DAY FAGE FEDUC FRACE MAGE MEDUC ICU
		  MRACE M_HT_IN NO_RISKS PRECARE PREVIS PRIORDEAD PRIORLIVE PRIORTERM PREWEIGHT CESAR_PREV SEX WTGAIN CSECTION;
run;

proc contents data=births;
run;

/* Using plots(maxplots=none) caused SAS to crash so influence plots could not be generated
*/
proc logistic data=births plots=influence;
	class CSECTION MAR MONTH DAY FEDUC FRACE MEDUC ICU MRACE NO_RISKS SEX/param=ref ref=first;
	model CSECTION = BMI -- WTGAIN /selection=backward sls=0.05 influence lackfit rsquare;
	ods select NObs ResponseProfile ClassLevelInfo OddsRatios ParameterEstimates 
		GlobalTests ModelBuildingSummary ModelInfo LackFitChiSq FitStatistics InfluencePlots;
		
run;

proc logistic data=births plots=influence;
	class CSECTION MAR MONTH DAY FEDUC FRACE MEDUC ICU MRACE NO_RISKS SEX/param=ref ref=first;
	model CSECTION = BMI -- WTGAIN /selection=forward sle=0.05 influence lackfit;
	ods select NObs ResponseProfile ClassLevelInfo OddsRatios ParameterEstimates 
		GlobalTests ModelBuildingSummary ModelInfo LackFitChiSq FitStatistics InfluencePlots;
		
run;

proc logistic data=births plots=influence;
	class CSECTION MAR MONTH DAY FEDUC FRACE MEDUC ICU MRACE NO_RISKS SEX/param=ref ref=first;
	model CSECTION = BMI -- WTGAIN /selection=stepwise sle=0.05 sls=0.05 influence lackfit;
	ods select NObs ResponseProfile ClassLevelInfo OddsRatios ParameterEstimates 
		GlobalTests ModelBuildingSummary ModelInfo LackFitChiSq FitStatistics InfluencePlots;
		
run;