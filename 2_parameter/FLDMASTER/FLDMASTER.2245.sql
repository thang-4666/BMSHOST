SET DEFINE OFF;
     FROM SBSECURITIES SEC, SECURITIES_INFO SEINFO
      WHERE SEC.CODEID=SEINFO.CODEID
        AND SEC.SECTYPE <> ''004''
      ORDER BY SEC.SYMBOL', ' ', ' ', 'Y', 'N', 'Y', ' ', ' ', 'Y', 'C', '', '', '', 'CODEID', '##########', '', '', '', '', 'C', 'N', 'MAIN', '', '', '', 'N', '', 'Y', '', 'N', '', '', '', 'N');
FROM FEEMASTER FE, FEEMAP FM WHERE FE.FEECD = FM.FEECD AND fm.tltxcd=''2245''', ' ', '', 'Y', 'Y', 'Y', ' ', ' ', 'Y', 'C', '', '', '', 'CDVAL', '##########', '', '', '', '', 'M', 'N', 'MAIN', '34', '[01]', '', 'N', '', 'Y', '', 'N', '', '', '', 'N');
UNION ALL
SELECT ''02'' VALUECD, ''02'' VALUE,''Nhập tay''  DISPLAY,''Nhập tay ''  EN_DISPLAY,''Nhập tay''  DESCRIPTION FROM dual ', ' ', '', 'Y', 'N', 'Y', ' ', ' ', 'N', 'C', '', '', '', 'CDVAL', '##########', '', '', '', '', 'M', 'N', 'MAIN', '', '', '', 'N', '', 'Y', '', 'N', '', '', '', 'N');
select ''002'' VALUECD,''002'' VALUE,''Chuyển nhượng chứng khoán không qua sàn'' DISPLAY,''Chuyển nhượng chứng khoán không qua sàn'' EN_DISPLAY,''Chuyển nhượng chứng khoán không qua sàn''  DESCRIPTION from dual
', ' ', '001', 'Y', 'N', 'Y', ' ', ' ', 'Y', 'C', '', '', '', 'Type', '##########', '', '', '', '', 'C', 'N', 'MAIN', '', '', '', 'N', 'P_TYPE', 'Y', '', 'N', '', '', '', 'N');