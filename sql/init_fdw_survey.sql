CREATE EXTENSION multicorn;

CREATE SERVER multicorn_gspreadsheet FOREIGN DATA WRAPPER multicorn
options (
  wrapper 'gspreadsheet_fdw.GspreadsheetFdw' 
);

CREATE FOREIGN TABLE gnocchi_survey (
  q0 character varying,
  q1 character varying,
  q2 character varying,
  q3 character varying,
  q4 character varying,
  q5 character varying,
  q6 character varying,
  q7 character varying,
  q8 character varying,
  q9 character varying,
  q10 character varying,
  q11 character varying,
  q12 character varying,
  q13 character varying,
  q14 character varying,
  q15 character varying,
  q16 character varying,
  q17 character varying,
  q18 character varying
) server multicorn_gspreadsheet options(
  -- credential file for Google apis
  keyfile '/home/tonca/Downloads/auth-config.json',
  -- KEY for the spreadsheet
  gskey '1ryrHlyeqNFDsscLC4OLahRj7ipORLoBBtDaEjsSa2zk'
);