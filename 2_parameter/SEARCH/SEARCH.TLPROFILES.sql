SET DEFINE OFF;DELETE FROM SEARCH WHERE 1 = 1 AND NVL(SEARCHCODE,'NULL') = NVL('TLPROFILES','NULL');Insert into SEARCH   (SEARCHCODE, SEARCHTITLE, EN_SEARCHTITLE, SEARCHCMDSQL, OBJNAME, FRMNAME, ORDERBYCMDSQL, TLTXCD, CNTRECORD, ROWPERPAGE, AUTOSEARCH, INTERVAL, AUTHCODE, ROWLIMIT, CMDTYPE, CONDDEFFLD, BANKINQ, BANKACCT, CHKSCOPECMDSQL) Values   ('TLPROFILES', 'Quản lý người sử dụng', 'User management', 'SELECT M.TLID, M.TLNAME, M.TLFULLNAME,M.IDCODE, N.BRNAME, M.TLTITLE, M.TLPRN, A1.CDCONTENT TLGROUP, A2.cdcontent ACTIVE, M.DESCRIPTION,
A03.CDCONTENT STATUS,
(CASE WHEN M.STATUS IN (''D'') THEN ''N'' ELSE ''Y'' END) EDITALLOW,
(CASE WHEN M.STATUS IN (''P'') THEN ''Y'' ELSE ''N'' END) APRALLOW,
(CASE WHEN M.STATUS IN (''D'') THEN ''N'' ELSE ''Y'' END) AS DELALLOW, A3.CDCONTENT HOMEORDER
FROM TLPROFILES M, ALLCODE A1, BRGRP N,ALLCODE A03, ALLCODE A2,ALLCODE A3 WHERE A1.CDTYPE = ''SA'' AND A1.CDNAME = ''TLGROUP''
AND A2.CDTYPE = ''SA'' AND A2.CDNAME = ''ACTIVE'' AND M.ACTIVE = A2.CDVAL
AND A3.CDTYPE = ''SY'' AND A3.CDNAME = ''YESNO'' AND M.HOMEORDER=A3.CDVAL
AND A03.CDVAL = M.STATUS AND A03.CDTYPE = ''SY'' AND A03.CDNAME = ''APPRV_STS''
AND TRIM(A1.CDVAL)=TRIM(TLGROUP) AND M.BRID = N.BRID AND M.BRID = DECODE(''<$BRID>'',''<$HO_BRID>'', M.BRID, ''<$BRID>'') ', 'TLPROFILES', 'frmTLPROFILES', 'TLNAME', '', NULL, 50, 'N', 30, '', 'Y', 'T', '', 'N', '', '');COMMIT;