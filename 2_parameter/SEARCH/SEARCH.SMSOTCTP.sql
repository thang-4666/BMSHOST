SET DEFINE OFF;
  from SMSOTCTP S, tlprofiles tl,allcode a
 where s.tlid = tl.tlid and a.cdval = s.status and a.CDTYPE = ''SA'' AND a.CDNAME = ''STATUS'' order by autoid 
', 'SMSOTCTP', 'frmSMSMONITORMANAGER', '', '', NULL, 50, 'N', 30, '', 'Y', 'T', '', 'N', '', '');