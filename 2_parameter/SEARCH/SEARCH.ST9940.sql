SET DEFINE OFF;
A5.CDCONTENT MSGSTATUS,
REQ.VSD_ERR_MSG ,to_char(req.CREATEDATE,''hh24:mi:ss.'') CREATEDATE ,req.tlid,tl.tlname,''NACK'' SWPROCESS
FROm VSDTXREQ REQ, ALLCODE A5,tlprofiles tl,
(select reqid,max(cval) cval from vsdtxreqdtl where fldname=''CUSTODYCD'' group by reqid) reqdtl
WHERE A5.CDTYPE=''SA'' AND A5.CDNAME=''VSDTXREQSTS'' AND A5.CDVAL=REQ.MSGSTATUS
and req.tlid=tl.tlid(+) And  req.MSGSTATUS=''N''
and req.reqid=reqdtl.reqid(+)', 'CFMAST', 'frmMMSG', 'REQID DESC', '9940', 0, 50, 'Y', 30, 'NYNNYYYNNN', 'Y', 'T', '', 'N', '', '');