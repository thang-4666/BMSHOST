SET DEFINE OFF;
substr(s.fromtime,0,2) || '':'' || substr(s.fromtime,3,2) as "fromtime",
substr(s.totime,0,2) || '':'' || substr(s.totime,3,2) as "totime", a.cdcontent status
from smsmonitormanager s, tlprofiles t, allcode a, allcode b WHERE
s.tlid = t.tlid and a.cdname = ''STATUS'' and a.cdtype = ''SY'' and a.cdval = s.status
and b.cdtype = ''SA'' and b.cdname = ''SMSMONITORNAME'' and b.cdval = s.smsid', 'SMSMONITORMANAGER', 'frmSMSMONITORMANAGER', '', '', NULL, 50, 'N', 30, '', 'Y', 'T', '', 'N', '', '');