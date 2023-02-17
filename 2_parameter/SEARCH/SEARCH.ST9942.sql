SET DEFINE OFF;
        ,a2.CDCONTENT VSDPROMSG_VALUE,VSD.VSDMSGDATE,VSD.VSDMSGDATEEFF,VSD.REFCUSTODYCD,VSD.CUSTODYCD,VSD.ADRESS,VSD.EXRATE,VSD.PRICE,
       VSD.RIGHTOFFRATE,VSD.BEGINDATE,VSD.ENDDATE,VSD.EXPRICE,VSD.POSTDATE,VSD.FRDATETRANSFER,VSD.TODATETRANSFER, a1.CDCONTENT VSDMSGTYPE,VSD.QTTY,a3.CDCONTENT ROUND,VSD.DESCRIPTION,
       case when vsdmsgtype in (''MEET'',''XMET'') then DATETYPE else null end MEETDATE, VSD.DATETYPE,
       case when INSTR(VSD.SYMBOL,''ISIN'') >0 then REPLACE(VSD.SYMBOL,''ISIN '') else VSD.SYMBOL end SYMBOL,case when INSTR(REFSYMBOL,''ISIN'') >0 then REPLACE(REFSYMBOL,''ISIN '') else REFSYMBOL end REFSYMBOL,
       a4.CDCONTENT TAXPLACE,EXPRICETYPE
FROM VSD_MT564_INF VSD, 
(
    select * from vsdtrflog 
    union all
    select * from vsdtrfloghist
)log,
(select * from allcode where cdname = ''MT_564'') a1,
(select * from allcode where cdname = ''MT_564_INFTYPE'') a2,
(select * from allcode where cdname = ''ROUNDTYPE'') a3,
(select * from allcode where cdname = ''TAXPLACE'') a4
WHERE  vsd.VSDMSGTYPE = a1.cdval(+)
and vsd.VSDPROMSG_VALUE = a2.cdval(+)
and vsd.ROUND = a3.cdval(+)
and VSD.TAX = a4.cdval(+)
and VSD.vsdmsgid = log.autoid', 'CFMAST', 'frmMT598', 'AUTOID DESC', '', 0, 50, 'Y', 30, 'NYNNYYYNNN', 'Y', 'T', '', 'N', '', '');