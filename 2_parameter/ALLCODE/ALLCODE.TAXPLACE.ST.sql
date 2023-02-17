SET DEFINE OFF;DELETE FROM ALLCODE WHERE 1 = 1 AND NVL(CDNAME,'NULL') = NVL('TAXPLACE','NULL') AND NVL(CDTYPE,'NULL') = NVL('ST','NULL');Insert into ALLCODE   (CDTYPE, CDNAME, CDVAL, CDCONTENT, LSTODR, CDUSER, EN_CDCONTENT, CHSTATUS) Values   ('ST', 'TAXPLACE', 'GRSS', 'Cổ tức không khấu trừ thuế tại TCPH', 1, '', 'Tax deduction at issuers', 'C');Insert into ALLCODE   (CDTYPE, CDNAME, CDVAL, CDCONTENT, LSTODR, CDUSER, EN_CDCONTENT, CHSTATUS) Values   ('ST', 'TAXPLACE', 'NETT', 'Cổ tức khấu trừ thuế tại TCPH', 2, '', 'Tax deduction at securities company', 'C');COMMIT;