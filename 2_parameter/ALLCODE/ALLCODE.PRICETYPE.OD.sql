SET DEFINE OFF;DELETE FROM ALLCODE WHERE 1 = 1 AND NVL(CDNAME,'NULL') = NVL('PRICETYPE','NULL') AND NVL(CDTYPE,'NULL') = NVL('OD','NULL');Insert into ALLCODE   (CDTYPE, CDNAME, CDVAL, CDCONTENT, LSTODR, CDUSER, EN_CDCONTENT, CHSTATUS) Values   ('OD', 'PRICETYPE', 'LO', 'LO', 0, 'Y', 'LO', 'C');Insert into ALLCODE   (CDTYPE, CDNAME, CDVAL, CDCONTENT, LSTODR, CDUSER, EN_CDCONTENT, CHSTATUS) Values   ('OD', 'PRICETYPE', 'ATC', 'ATC', 1, 'Y', 'ATC', 'C');Insert into ALLCODE   (CDTYPE, CDNAME, CDVAL, CDCONTENT, LSTODR, CDUSER, EN_CDCONTENT, CHSTATUS) Values   ('OD', 'PRICETYPE', 'ATO', 'ATO', 2, 'Y', 'ATO', 'C');Insert into ALLCODE   (CDTYPE, CDNAME, CDVAL, CDCONTENT, LSTODR, CDUSER, EN_CDCONTENT, CHSTATUS) Values   ('OD', 'PRICETYPE', 'IO', 'IO', 3, 'N', 'IO', 'C');Insert into ALLCODE   (CDTYPE, CDNAME, CDVAL, CDCONTENT, LSTODR, CDUSER, EN_CDCONTENT, CHSTATUS) Values   ('OD', 'PRICETYPE', 'MAK', 'MAK', 4, 'Y', 'MAK', 'C');Insert into ALLCODE   (CDTYPE, CDNAME, CDVAL, CDCONTENT, LSTODR, CDUSER, EN_CDCONTENT, CHSTATUS) Values   ('OD', 'PRICETYPE', 'MOK', 'MOK', 5, 'Y', 'MOK', 'C');Insert into ALLCODE   (CDTYPE, CDNAME, CDVAL, CDCONTENT, LSTODR, CDUSER, EN_CDCONTENT, CHSTATUS) Values   ('OD', 'PRICETYPE', 'MP', 'MP', 6, 'Y', 'MP', 'C');Insert into ALLCODE   (CDTYPE, CDNAME, CDVAL, CDCONTENT, LSTODR, CDUSER, EN_CDCONTENT, CHSTATUS) Values   ('OD', 'PRICETYPE', 'MTL', 'MTL', 7, 'Y', 'MTL', 'C');Insert into ALLCODE   (CDTYPE, CDNAME, CDVAL, CDCONTENT, LSTODR, CDUSER, EN_CDCONTENT, CHSTATUS) Values   ('OD', 'PRICETYPE', 'OBO', 'OBO', 8, 'N', 'OBO', 'C');Insert into ALLCODE   (CDTYPE, CDNAME, CDVAL, CDCONTENT, LSTODR, CDUSER, EN_CDCONTENT, CHSTATUS) Values   ('OD', 'PRICETYPE', 'PLO', 'PLO', 9, 'Y', 'PLO', 'C');Insert into ALLCODE   (CDTYPE, CDNAME, CDVAL, CDCONTENT, LSTODR, CDUSER, EN_CDCONTENT, CHSTATUS) Values   ('OD', 'PRICETYPE', 'SBO', 'SBO', 10, 'N', 'SBO', 'C');Insert into ALLCODE   (CDTYPE, CDNAME, CDVAL, CDCONTENT, LSTODR, CDUSER, EN_CDCONTENT, CHSTATUS) Values   ('OD', 'PRICETYPE', 'SL', 'SL', 11, 'N', 'SL', 'C');Insert into ALLCODE   (CDTYPE, CDNAME, CDVAL, CDCONTENT, LSTODR, CDUSER, EN_CDCONTENT, CHSTATUS) Values   ('OD', 'PRICETYPE', 'SO>', 'SO>', 11, 'N', 'SO>', 'C');Insert into ALLCODE   (CDTYPE, CDNAME, CDVAL, CDCONTENT, LSTODR, CDUSER, EN_CDCONTENT, CHSTATUS) Values   ('OD', 'PRICETYPE', 'SO<', 'SO<', 12, 'N', 'SO<', 'C');COMMIT;