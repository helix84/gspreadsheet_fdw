CREATE OR REPLACE FUNCTION f_graph1() RETURNS text AS '
sqlPD <- paste("SELECT count(*) FROM gnocchi_survey WHERE q1 = ''Padova''",sep="");
sqlPROV <- paste("SELECT count(*) FROM gnocchi_survey WHERE q1 = ''Provincia di Padova''",sep="");
sqlOTHER <- paste("SELECT count(*) FROM gnocchi_survey WHERE q1 = ''Altro''",sep="");

strPD <- pg.spi.exec (sqlPD);
strPROV <- pg.spi.exec (sqlPROV);
strOTHER <- pg.spi.exec (sqlOTHER);
str <- c(range(strPD,strPROV),range(strOTHER)[1]);

pdf(''/tmp/rplot_q1.pdf'');
protocolNames <- c("Padova","Provincia","Altro");
barplot(str,names.arg=protocolNames);
mtext("Dove abiti?",side=3);
title(main="Graph Q1",xlab="Zone");
dev.off();
print (''DONE'');
' LANGUAGE plr;