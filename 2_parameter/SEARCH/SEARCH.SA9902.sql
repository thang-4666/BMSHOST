SET DEFINE OFF;
       ovrrqs, nvl(ch.tlname, ''_'') chid, nvl(chk.tlname, ''_'') chkid, tltxcd, deltd, busdate, txdesc,
       ipaddress, wsname, a1.cdcontent txstatus, msgsts, ovrsts, msgamt, msgacct, chktime,
       offtime, carebygrp
  from tllogall a, brgrp b, tlprofiles tl, tlprofiles ap, tlprofiles ch, tlprofiles chk, (select * from allcode where cdtype = ''SY'' and cdname = ''TXSTATUS'') a1
 where a.brid = b.brid
   and a.tlid = tl.tlid
   and a.offid = ap.tlid
   and a.txstatus = a1.cdval
   and a.chid = ch.tlid(+)
   and a.chkid = chk.tlid(+)', 'TLLOGALL', '', '', '', NULL, 50, 'N', 30, 'NYNNYYYNNN', 'Y', 'T', '', 'N', '', '');