SET DEFINE OFF;DELETE FROM SBBATCHCTL WHERE 1 = 1 AND NVL(BCHMDL,'NULL') = NVL('SABEGINBATCH','NULL');Insert into SBBATCHCTL   (BCHSQN, APPTYPE, BCHMDL, BCHTITLE, RUNAT, ACTION, RPTPRINT, TLBCHNAME, MSG, BKP, BKPSQL, RSTSQL, ROWPERPAGE, RUNMOD, STATUS) Values   ('0200', 'SA', 'SABEGINBATCH', 'Xử lý đầu chạy batch', 'EOD', ' ', 'N', 'SAB', 'Xử lý đầu chạy batch...', ' ', ' ', ' ', 0, 'DB', 'Y');COMMIT;