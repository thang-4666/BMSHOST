SET DEFINE OFF;DELETE FROM SBBATCHCTL WHERE 1 = 1 AND NVL(BCHMDL,'NULL') = NVL('SFEETRF_EOD','NULL');Insert into SBBATCHCTL   (BCHSQN, APPTYPE, BCHMDL, BCHTITLE, RUNAT, ACTION, RPTPRINT, TLBCHNAME, MSG, BKP, BKPSQL, RSTSQL, ROWPERPAGE, RUNMOD, STATUS) Values   ('0117', 'RM', 'SFEETRF_EOD', 'Xuất bảng kê chuyển phí tiền bán sang NH', 'EOD', 'BF', 'N', 'ODAD', 'Xuất bảng kê chuyển phí tiền bán sang NH', ' ', ' ', ' ', 100, 'DB', 'Y');COMMIT;