SET DEFINE OFF;
FROM CFLIMITUSER CFL, tlprofiles tlp,(SELECT sum(balance) balance, tlid FROM TDMAST WHERE DELTD <> ''Y'' and tdsrc =''B'' group by  tlid ) td
where cfl.tlid= tlp.tlid and tlp.tlid = td.tlid(+) ', 'CFLIMITUSER', 'frmCFLIMITUSER', '', '', NULL, 50, 'N', 30, '', 'Y', 'T', '', 'N', '', '');