SET DEFINE OFF;
 MST.NOTES, MST.FRDATE, MST.TODATE, A2.CDCONTENT STATUS,
 (CASE WHEN MST.STATUS=''P'' THEN ''Y'' ELSE ''N'' END) APRALLOW
FROM CFTRDPOLICY MST, ALLCODE A0, ALLCODE A2,
(select ''U'' refcd, tlid refid, tlname rfname from tlprofiles 
union all
select ''G'' refcd, grpid refid, grpname rfname from tlgroups
union all
select ''I'' refcd, codeid refid, symbol rfname from sbsecurities
union all
select ''S'' refcd, ''NULL'' refid, varvalue rfname from sysvar where varname=''COMPANYSHORTNAME'') RF
WHERE RF.REFCD=MST.LEVELCD AND RF.REFID=NVL(MST.REFID,''NULL'')
AND A0.CDTYPE=''SA'' AND A0.CDNAME=''LEVELCD'' AND A0.CDVAL=MST.LEVELCD
AND A2.CDTYPE=''SY'' AND A2.CDNAME=''TYPESTS'' AND A2.CDVAL=MST.STATUS', 'CFTRDPOLICY', 'frmCFTRDPOLICY', '', 'EXEC', NULL, 50, 'N', 30, '', 'Y', 'T', '', 'N', '', '');