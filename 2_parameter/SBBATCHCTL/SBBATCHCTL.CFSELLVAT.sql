SET DEFINE OFF;DELETE FROM SBBATCHCTL WHERE 1 = 1 AND NVL(BCHMDL,'NULL') = NVL('CFSELLVAT','NULL');Insert into SBBATCHCTL   (BCHSQN, APPTYPE, BCHMDL, BCHTITLE, RUNAT, ACTION, RPTPRINT, TLBCHNAME, MSG, BKP, BKPSQL, RSTSQL, ROWPERPAGE, RUNMOD, STATUS) Values   ('3095', 'CF', 'CFSELLVAT', 'Trả thuế lệnh bán', 'BOD', ' ', 'N', 'CFDT', 'Trả thuế lệnh bán...', ' ', ' ', ' ', 600, 'DB', 'Y');COMMIT;