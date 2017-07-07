CREATE OR REPLACE FUNCTION rplot_q5() RETURNS text AS '
sql1 <- paste("SELECT count(*) FROM gnocchi_survey WHERE q5 = ''0-5 €''",sep="");
sql2 <- paste("SELECT count(*) FROM gnocchi_survey WHERE q5 = ''5-10 €''",sep="");
sql3 <- paste("SELECT count(*) FROM gnocchi_survey WHERE q5 = ''10-20 €''",sep="");
sql4 <- paste("SELECT count(*) FROM gnocchi_survey WHERE q5 = ''oltre 20 €''",sep="");

str1 <- pg.spi.exec (sql1);
str1 <- as.numeric(str1);
str2 <- pg.spi.exec (sql2);
str2 <- as.numeric(str2);
str3 <- pg.spi.exec (sql3);
str3 <- as.numeric(str3);
str4 <- pg.spi.exec (sql4);
str4 <- as.numeric(str4);


str <- c(str1,str2,str3,str4);

pdf(''/tmp/rplot_q5.pdf'');
protocolNames <- c("0-5 €","5-10 €","10-20 €","oltre 20€"); 
barplot(str,names.arg=protocolNames);
mtext("Quanto sei abituato a spendere a PRANZO in Centro a Padova?",side=3);
title(main="Graph Q5",xlab="Spesa");

dev.off();
' LANGUAGE plr;

SELECT rplot_q5();