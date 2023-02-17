SET DEFINE OFF;
from domain d, allcode a0, allcode a1, allcode a2
where d.secsettletype = a0.cdval and a0.cdname = ''SETTLETYPE'' and a0.cdtype = ''CF''
and d.cashsettletype = a1.cdval and a1.cdname = ''SETTLETYPE'' and a1.cdtype = ''CF''
and d.isdefault = a2.cdval and a2.cdname = ''YESNO'' and a2.cdtype = ''SY''', 'DOMAIN', '', '', 'EXEC', 0, 50, 'N', 30, '', 'Y', 'T', '', 'N', '', '');