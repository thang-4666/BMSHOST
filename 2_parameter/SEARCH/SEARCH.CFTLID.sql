SET DEFINE OFF;
from tlgrpusers tlg ,tlprofiles tlp,tlgroups tg
where tlg.tlid = tlp.tlid and  tlg.grpid=tg.grpid AND tlg.grpid like nvl(''<$AFACCTNO>'',''%'')', 'LISTUSER', 'frmTLID', '', '', 0, 50, 'N', 30, '', 'Y', 'T', '', 'N', '', '');