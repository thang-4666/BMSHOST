SET DEFINE OFF;
cft.typename,  dtl.tradevalue, dtl.nav, dtl.feeamt,
dtl.finrevenue, dtl.numoverdeal, dtl.calldays,dtl.NAVCURR,dtl.NUMKEEPCF,dtl.TYPEREVIEW
from cfreview hdr , cfreviewdtl dtl , cftype cft
where  hdr.autoid=dtl.cfrevid
    and dtl.cftype=cft.actype
    and dtl.cfrevid=''<$KEYVAL>''', 'SA.CFREVIEWDTL', 'frmTDTYPE', '', '', 0, 50, 'N', 30, '', 'Y', 'T', '', 'N', '', '');