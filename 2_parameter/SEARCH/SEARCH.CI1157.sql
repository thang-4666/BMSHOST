SET DEFINE OFF;DELETE FROM SEARCH WHERE 1 = 1 AND NVL(SEARCHCODE,'NULL') = NVL('CI1157','NULL');Insert into SEARCH   (SEARCHCODE, SEARCHTITLE, EN_SEARCHTITLE, SEARCHCMDSQL, OBJNAME, FRMNAME, ORDERBYCMDSQL, TLTXCD, CNTRECORD, ROWPERPAGE, AUTOSEARCH, INTERVAL, AUTHCODE, ROWLIMIT, CMDTYPE, CONDDEFFLD, BANKINQ, BANKACCT, CHKSCOPECMDSQL) Values   ('CI1157', 'Hủy yêu cầu ứng trước lệnh bán theo ngày (1157)', 'Reject request advance payment (wait for 1157)', 'SELECT AD.AUTOID, AD.TXNUM, AD.TXDATE, AD.ACCTNO, AD.AMT, AD.FEEAMT, AD.DELTD,
AD.BRID, BR.BRNAME,  AD.TLID, TL.TLNAME,
''Huy bang ke UTTB Ngay: '' || AD.TXDATE || '' So: '' || AD.TXNUM || '''' DESCRIPTION, A1.CDCONTENT STATUS, CF.FULLNAME
FROM ADMAST AD, CFMAST CF, ALLCODE A1, BRGRP BR, TLPROFILES TL
WHERE AD.ACCTNO = CF.CUSTID AND AD.STATUS=''P'' AND AD.STATUS =A1.CDVAL AND A1.CDTYPE =''AD'' AND A1.CDNAME =''STATUS''
AND BR.BRID = AD.BRID AND TL.TLID=AD.TLID
AND AD.TXDATE=TO_DATE(''<$BUSDATE>'',''DD/MM/RRRR'') ', 'CIMAST', '', '', '1157', NULL, 50, 'N', 30, 'NYNNYYYNNN', 'Y', 'T', '', 'N', '', '');COMMIT;