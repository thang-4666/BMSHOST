SET DEFINE OFF;
SELECT a.autoid, a.prcode, a.prtype,aft.typename FROM PRTYPEMAP a,
(select typename,actype from aftype union all select ''ALL'' typename,''ALL'' actype from dual)  aft where  a.prcode = ''<$KEYVAL>'' and aft.actype=a.prtype
', 'PR.PRTYPEMAP', 'PRTYPE', '', '', NULL, 50, 'N', 30, '', 'Y', 'T', '', 'N', '', '');