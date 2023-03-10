SET DEFINE OFF;DELETE FROM SEARCH WHERE 1 = 1 AND NVL(SEARCHCODE,'NULL') = NVL('RE0001','NULL');Insert into SEARCH   (SEARCHCODE, SEARCHTITLE, EN_SEARCHTITLE, SEARCHCMDSQL, OBJNAME, FRMNAME, ORDERBYCMDSQL, TLTXCD, CNTRECORD, ROWPERPAGE, AUTOSEARCH, INTERVAL, AUTHCODE, ROWLIMIT, CMDTYPE, CONDDEFFLD, BANKINQ, BANKACCT, CHKSCOPECMDSQL) Values   ('RE0001', 'Tra cứu khách hàng của môi giới', 'View customer belong to broker/remiser', 'SELECT CFRE.CUSTID RECUSTID, CFRE.FULLNAME REFULLNAME, A0.CDCONTENT DESC_REROLE,
CFCUST.CUSTODYCD, CFCUST.FULLNAME CUSTNAME, LNK.AFACCTNO ACCTNO, LNK.FRDATE, LNK.TODATE,CFT.TYPENAME,br.brname description,A1.CDCONTENT CUSTTYPE,nvl(tp.tradename, '''') OFFICE
FROM REAFLNK LNK, CFMAST CFCUST, REMAST MST, RETYPE TYP, CFMAST CFRE, ALLCODE A0 , RECFLNK RF, CFTYPE CFT,brgrp br, ALLCODE A1, tradeplace tp, tradecareby tc
WHERE CFCUST.CUSTID=LNK.AFACCTNO AND LNK.STATUS=''A''
AND MST.ACTYPE=TYP.ACTYPE AND MST.CUSTID=CFRE.CUSTID AND MST.ACCTNO=LNK.REACCTNO
AND A0.CDTYPE=''RE'' AND A0.CDNAME=''REROLE'' AND A0.CDVAL=TYP.REROLE AND CFCUST.ACTYPE=CFT.ACTYPE and  br.brid = cfcust.brid
AND LNK.refrecflnkid=RF.autoid AND A1.CDTYPE=''CF'' AND A1.CDNAME=''CUSTTYPE'' AND A1.CDVAL=CFCUST.CUSTTYPE 
AND CFCUST.careby = tc.grpid(+)
AND tc.tradeid = tp.traid(+)', 'REGRP', 'frmREGRP', 'REFULLNAME, CUSTODYCD, ACCTNO', '', 0, 50, 'N', 30, 'NYNNYYYNNN', 'Y', 'T', '', 'N', '', 'CUSTODYCD');COMMIT;