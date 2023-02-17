SET DEFINE OFF;
select * from (
SELECT RESID, RESNAME
FROM (
SELECT ''ALL'' RESID, ''All'' RESNAME, -1 LSTODR FROM DUAL
union all
SELECT ''BSC'' RESID,''BSC'' RESNAME, 0 LSTODR FROM dual
union all
SELECT shortname RESID,fullname RESNAME, to_number(custid) LSTODR FROM cfmast where isbanking = ''Y''
) ORDER BY LSTODR
) where 0=0
', 'RSCTYPE', 'frmRSCTYPE', '', '', NULL, 50, 'N', 30, '', 'Y', 'T', '', 'N', '', '');