SET DEFINE OFF;
WHERE A0.CDTYPE = ''SY'' AND A0.CDNAME = ''YESNO'' AND A0.CDVAL=BKDATE and visible =''Y'' and a1.CDTYPE = ''SA'' AND a1.CDNAME = ''STATUS'' and nvl(tltx.status,''A'') = a1.cdval
', 'TLTX', 'frmTLTX', '', '', NULL, 50, 'N', 30, '', 'Y', 'T', '', 'N', '', '');