SET DEFINE OFF;DELETE FROM SBBATCHCTL WHERE 1 = 1 AND NVL(BCHMDL,'NULL') = NVL('DFAUTOPAY','NULL');Insert into SBBATCHCTL   (BCHSQN, APPTYPE, BCHMDL, BCHTITLE, RUNAT, ACTION, RPTPRINT, TLBCHNAME, MSG, BKP, BKPSQL, RSTSQL, ROWPERPAGE, RUNMOD, STATUS) Values   ('0039', 'DF', 'DFAUTOPAY', 'Thanh toán deal vay đến, quá hạn', 'EOD', 'BF', 'N', 'DFPM', 'Thanh toán deal vay đến, quá hạn...', ' ', ' ', ' ', 1000, 'DB', 'N');COMMIT;