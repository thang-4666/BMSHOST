SET DEFINE OFF;
    lnk.clstxdate, a1.cdcontent status
from afuserlnk lnk, cfmast cf, tlprofiles tl, allcode a1
where lnk.tlid = tl.tlid and lnk.custodycd = cf.custodycd
    and lnk.deltd <> ''Y'' and lnk.status = a1.cdval
    and a1.cdtype = ''SA'' and a1.cdname = ''STATUS''', 'RE.REMAST', '', '', '', NULL, 50, 'N', 30, 'NYNNYYYNNN', 'Y', 'T', '', 'N', '', '');