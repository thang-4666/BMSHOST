SET DEFINE OFF;
       l.referenceid, l.finfilename, to_char(l.timecreated,''hh24:mi:ss'')timecreated , l.timeprocess,
       l.status, l.autoconf, l.errdesc, l.symbol, l.reclas, l.reqtty,
       l.refcustodycd, l.reccustodycd, l.vsdeffdate , c.CDCONTENT description, l.timecreated datecreated
from vsdtrfloghist l, (select trfcode, description CDCONTENT, en_description EN_CDCONTENT,type from vsdtrfcode) c
where c.type = ''INF''
and l.funcname = c.trfcode', 'TTDIENRHIST', 'frmVSDTXINFOHIST', 'DATECREATED DESC, TIMECREATED DESC', '', 0, 50, 'Y', 30, '', 'Y', 'T', '', 'N', '', '');