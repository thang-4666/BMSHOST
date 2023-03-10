SET DEFINE OFF;DELETE FROM SEARCH WHERE 1 = 1 AND NVL(SEARCHCODE,'NULL') = NVL('BRGRP','NULL');Insert into SEARCH   (SEARCHCODE, SEARCHTITLE, EN_SEARCHTITLE, SEARCHCMDSQL, OBJNAME, FRMNAME, ORDERBYCMDSQL, TLTXCD, CNTRECORD, ROWPERPAGE, AUTOSEARCH, INTERVAL, AUTHCODE, ROWLIMIT, CMDTYPE, CONDDEFFLD, BANKINQ, BANKACCT, CHKSCOPECMDSQL) Values   ('BRGRP', 'Quản lý chi nhánh', 'Branch management', 'SELECT BRID, PRBRID, BRNAME, DCNAME,CUSTODYCDFROM,CUSTODYCDTO, A1.CDCONTENT STATUS, A2.CDCONTENT BRAREA, DESCRIPTION, A3.CDCONTENT ISACTIVE,
(CASE WHEN STATUS IN (''P'') THEN ''Y'' ELSE ''N'' END) APRALLOW,
RECUSTID,BRPHONE,BRADDRESS
FROM BRGRP, ALLCODE A1, ALLCODE A2, ALLCODE A3 
WHERE A1.CDTYPE = ''SA'' AND A1.CDNAME = ''BRSTATUS'' 
AND A1.CDVAL=STATUS AND A2.CDTYPE = ''SA'' AND A2.CDNAME = ''BRAREA'' 
AND A2.CDVAL=BRAREA AND A3.CDTYPE = ''SY'' AND A3.CDNAME = ''YESNO'' AND A3.CDVAL=ISACTIVE', 'BRGRP', 'frmBRGRP', '', '', NULL, 50, 'N', 30, 'YYYYYYNNNNY', 'Y', 'T', '', 'N', '', '');COMMIT;