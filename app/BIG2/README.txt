Questa cartella è composta dalle seguenti cartelle: 
	-BIGDataset: in questa cartella sono presenti i vari dataset e modelli
	-BIGSpark: è presente lo script BIG^2 e necessita che venga passato il path del file parquet
	-NEWBIGORIGINALE: presente lo script originale di BIG
	-XMLPARSER: presenta lo script per XMLparser e richiede due argomenti: il nome del file 
	-GENERATORE XES: script che crea un file xes con il numero di tracce passato come argomento. 
parquet che si vuole creare e il path del file xes che si vuole caricare. 

---------------BIGSPARK------------------
Per lanciare lo script, è necessario che si utilizzi Anaconda e si installi l'environment env_spark.yaml. 

----------------GENERATORE XES-----------------
Script che permette di creare dei file xes con delle tracce prestabilite. Basta passare il numero di tracce che si vuole generare e il path in cui si vuole salvare il file creato.

--------------------XML PARSER------------
Per lanciare lo script basta deplorare il file pom presente nel progetto. 

-------------NEWBIGORIGINALE----------
Per lanciare lo script è necessario definire i path del file net e xes all'interno del codice. 