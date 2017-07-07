CREATE OR REPLACE FUNCTION rplot_q8() RETURNS text AS '
sql1 <- paste("SELECT count(*) FROM gnocchi_survey WHERE q8 = ''Mai''",sep="");
sql2 <- paste("SELECT count(*) FROM gnocchi_survey WHERE q8 = ''1-2 volte al mese''",sep="");
sql3 <- paste("SELECT count(*) FROM gnocchi_survey WHERE q8 = ''Una volta ogni 15 giorni''",sep="");
sql4 <- paste("SELECT count(*) FROM gnocchi_survey WHERE q8 = ''1-2 volte a settimana''",sep="");
sql5 <- paste("SELECT count(*) FROM gnocchi_survey WHERE q8 = ''Almeno 3-4 volte a settimana''",sep="");
sql6 <- paste("SELECT count(*) FROM gnocchi_survey WHERE q8 = ''Tutti i giorni''",sep="");


str1 <- pg.spi.exec (sql1);
str1 <- as.numeric(str1);
str2 <- pg.spi.exec (sql2);
str2 <- as.numeric(str2);
str3 <- pg.spi.exec (sql3);
str3 <- as.numeric(str3);
str4 <- pg.spi.exec (sql4);
str4 <- as.numeric(str4);
str5 <- pg.spi.exec (sql5);
str5 <- as.numeric(str5);
str6 <- pg.spi.exec (sql6);
str6 <- as.numeric(str6);

str <- c(str1,str2,str3,str4,str5,str6);

pdf(''/tmp/rplot_q8.pdf'');
protocolNames <- c("Mai","1-2 /mese","1 /15gg","1-2 /sett","3-4 /sett","Tutti i giorni"); 
barplot(str,names.arg=protocolNames);
mtext("Quanto spesso verresti a CENA?",side=3);
title(main="Graph Q7",xlab="Frequenza");

dev.off();
' LANGUAGE plr;

SELECT rplot_q8();