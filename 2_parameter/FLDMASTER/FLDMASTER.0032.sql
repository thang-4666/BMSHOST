SET DEFINE OFF;
FROM tlgroups tl, cfmast cf
WHERE cf.careby = tl.grpid
and cf.custodycd=''<$TAGFIELD>''', 'N', '', 'Y', '', 'N', '', '', '', 'N');
FROM tlgroups
where grptype = 2 and active=''Y''', ' ', ' ', 'Y', 'N', 'Y', ' ', ' ', 'N', 'C', '', '', '', 'GRCAREBYACC', '##########', '03CAREBYID', '', '', '', 'C', 'N', 'MAIN', '', '', '', 'N', '', 'Y', '', 'N', '', '', '', 'N');