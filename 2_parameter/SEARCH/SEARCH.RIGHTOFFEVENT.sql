SET DEFINE OFF;
       A.TTHCP, A.DIVCP, A.TTHT, A.DIVT, A.PR1, A.PR2, A.PR3,
       A.AUTOCALC, A.BASICPRICE, (CASE WHEN A.STATUS IN (''P'') THEN ''Y'' ELSE ''N'' END) APRALLOW, al.cdcontent status, NVL(SEC.MARGINPRICE,0) MARGINPRICE, NVL(SEC.MARGINCALLPRICE,0) MARGINCALLPRICE
       FROM RIGHTOFFEVENT A , allcode al, securities_info SEC  WHERE A.status = al.cdval AND al.cdname = ''STATUS'' AND al.cdtype = ''SA'' AND A.symbol = SEC.symbol(+)  ', 'RIGHTOFFEVENT', 'frmRIGHTOFFEVENT', '', '', NULL, 50, 'N', 30, '', 'Y', 'T', '', 'N', '', '');