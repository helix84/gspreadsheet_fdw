# gspreadsheet_fdw

Based on [gspreadsheet_fdw](https://github.com/lincolnturner/gspreadsheet_fdw), we did some modifications to adapt to the google surveys usecase.

We added also some PL/R plots to build analytics from within the DB software. 

---

For Multicorn module installation follow the instruction from the original repo.

For PL/R it is needed a PostgreSQL compiled with the PL/R plugin included and the it is possible to activate it through the SQL script [init_plr.sql](https://github.com/tonca/gspreadsheet_fdw/blob/master/sql/init_plr.sql).
