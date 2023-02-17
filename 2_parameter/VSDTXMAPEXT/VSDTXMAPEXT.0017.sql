SET DEFINE OFF;
from (select (case when NCUSTTYPE <> OCUSTTYPE then NCUSTTYPE else OCUSTTYPE end) NCUSTTYPE from cfvsdlog
WHERE CUSTID = ''<$FILTERID>'' order by txnum desc)where rownum = 1 ', 'Loại khách hàng', '', '', '', NULL, '', '');
from (select (case when naddress <> oaddress then naddress else oaddress end) naddress from cfvsdlog
WHERE CUSTID = ''<$FILTERID>'' order by txnum desc)where rownum = 1', 'Địa chỉ thường trú', '', '', '', 1233219999, 'F', '72');
from (select (case when naddress <> oaddress then naddress else oaddress end) naddress from cfvsdlog
WHERE CUSTID = ''<$FILTERID>'' order by txnum desc)where rownum = 1', 'Địa chỉ thường trú', '', '', '', 1233219999, 'F', '72');
       WHEN  CUSTTYPE = ''I'' AND COUNTRY <> ''234'' THEN ''FIND''
       WHEN  CUSTTYPE = ''B'' AND COUNTRY = ''234'' THEN ''DNOT''
       WHEN  CUSTTYPE = ''B'' AND COUNTRY <> ''234'' THEN ''DNOT''
       ELSE '''' END
FROM (SELECT (CASE WHEN NCUSTTYPE <> OCUSTTYPE THEN NCUSTTYPE ELSE OCUSTTYPE END) CUSTTYPE, (CASE WHEN NCOUNTRY <> OCOUNTRY THEN NCOUNTRY ELSE OCOUNTRY END) country FROM CFVSDLOG
WHERE CUSTID = ''<$FILTERID>'' ORDER BY TXNUM DESC)WHERE ROWNUM = 1 ', 'Loại giấy tờ', '', '', '', 1233219999, '', '');
from (select cf.custodycd,(case when nidcode <> oidcode then nidcode else oidcode end) nidcode,(case when ntradingcode <> otradingcode then ntradingcode else otradingcode end) ntradingcode from cfvsdlog cfo, cfmast cf
where cfo.custid = cf.custid and cfo.custid = ''<$FILTERID>'' order by txnum desc)where rownum = 1', 'Giấy đăng ký sở hữu', '', '', '', 1233219999, 'F', '');
from (select cf.custodycd,(case when niddate <> oiddate then niddate else oiddate end) niddate,cf.tradingcodedt from cfvsdlog cfo, cfmast cf
where cfo.custid = cf.custid and cfo.custid = ''<$FILTERID>'' order by txnum desc)where rownum = 1', 'Ngày cấp', '', '', '', 1233219999, '', '');
from (select (case when nfullname <> ofullname then nfullname else ofullname end) nfullname from cfvsdlog
WHERE CUSTID = ''<$FILTERID>'' order by txnum desc)where rownum = 1', 'Tên đầy đủ nhà đầu tư', '', '', '', 1233219999, 'F', '72');
                   WHEN ''002'' THEN ''5''
                   WHEN ''003'' THEN ''4''
                   WHEN ''010'' THEN ''4''
                   WHEN ''005'' THEN ''3''
                   WHEN ''006'' THEN ''4''
                   WHEN ''009'' THEN ''2''
       ELSE ''4'' END
FROM CFMAST WHERE CUSTID=''<$FILTERID>''', 'Loại giấy tờ', '', '', '', 1233219999, '', '');
       WHEN CUSTTYPE = ''B'' AND country = ''234'' THEN ''INV-DO'' WHEN CUSTTYPE = ''B'' AND country <> ''234'' THEN ''INV-FO''
       ELSE '''' END
FROM (SELECT (CASE WHEN NCUSTTYPE <> OCUSTTYPE THEN NCUSTTYPE ELSE OCUSTTYPE END) CUSTTYPE, (CASE WHEN NCOUNTRY <> OCOUNTRY THEN NCOUNTRY ELSE OCOUNTRY END) country FROM CFVSDLOG
WHERE CUSTID = ''<$FILTERID>'' ORDER BY TXNUM DESC)WHERE ROWNUM = 1 ', 'Loại đối tượng', '', '', '', 1233219999, '', '');
            WHEN  country <> ''234'' THEN ''CUSF''
            ELSE '''' END
FROM (SELECT (CASE WHEN NCOUNTRY <> OCOUNTRY THEN NCOUNTRY ELSE OCOUNTRY END) country FROM CFVSDLOG
WHERE CUSTID = ''<$FILTERID>'' ORDER BY TXNUM DESC) where rownum = 1', 'Loại khách hàng', '', '', '', 1233219999, '', '');
FROM (SELECT (CASE WHEN NCOUNTRY <> OCOUNTRY THEN NCOUNTRY ELSE OCOUNTRY END) country FROM CFVSDLOG
WHERE CUSTID = ''<$FILTERID>'' ORDER BY TXNUM DESC), allcode
WHERE cdname = ''NATIONAL'' and cdval = country AND ROWNUM = 1 ', 'Quốc tịch', '', '', '', 1233219999, '', '');
FROM CFMAST
WHERE CUSTID = ''<$FILTERID>''
', 'Mã số thuế', '', '', '', 1233219999, '', '');
from (select (case when NCUSTTYPE <> OCUSTTYPE then NCUSTTYPE else OCUSTTYPE end) NCUSTTYPE from cfvsdlog
WHERE CUSTID = ''<$FILTERID>'' order by txnum desc)where rownum = 1 ', 'Loại khách hàng', '', '', '', 1233219999, '', '');
from (select (case when naddress <> oaddress then naddress else oaddress end) naddress from cfvsdlog
WHERE CUSTID = ''<$FILTERID>'' order by txnum desc)where rownum = 1', 'Địa chỉ thường trú', '', '', '', 1233219999, 'F', '72');
from (select (case when naddress <> oaddress then naddress else oaddress end) naddress from cfvsdlog
WHERE CUSTID = ''<$FILTERID>'' order by txnum desc)where rownum = 1', 'Địa chỉ thường trú', '', '', '', 1233219999, 'F', '72');
       WHEN  CUSTTYPE = ''I'' AND COUNTRY <> ''234'' THEN ''FIND''
       WHEN  CUSTTYPE = ''B'' AND COUNTRY = ''234'' THEN ''DNOT''
       WHEN  CUSTTYPE = ''B'' AND COUNTRY <> ''234'' THEN ''DNOT''
       ELSE '''' END
FROM (SELECT (CASE WHEN NCUSTTYPE <> OCUSTTYPE THEN NCUSTTYPE ELSE OCUSTTYPE END) CUSTTYPE, (CASE WHEN NCOUNTRY <> OCOUNTRY THEN NCOUNTRY ELSE OCOUNTRY END) country FROM CFVSDLOG
WHERE CUSTID = ''<$FILTERID>'' ORDER BY TXNUM DESC)WHERE ROWNUM = 1 ', 'Loại giấy tờ', '', '', '', 1233219999, '', '');
from (select cf.custodycd,(case when nidcode <> oidcode then nidcode else oidcode end) nidcode,(case when ntradingcode <> otradingcode then ntradingcode else otradingcode end) ntradingcode from cfvsdlog cfo, cfmast cf
where cfo.custid = cf.custid and cfo.custid = ''<$FILTERID>'' order by txnum desc)where rownum = 1', 'Giấy đăng ký sở hữu', '', '', '', 1233219999, 'F', '');
from (select cf.custodycd,(case when niddate <> oiddate then niddate else oiddate end) niddate,cf.tradingcodedt from cfvsdlog cfo, cfmast cf
where cfo.custid = cf.custid and cfo.custid = ''<$FILTERID>'' order by txnum desc)where rownum = 1', 'Ngày cấp', '', '', '', 1233219999, '', '');
from (select (case when nfullname <> ofullname then nfullname else ofullname end) nfullname from cfvsdlog
WHERE CUSTID = ''<$FILTERID>'' order by txnum desc)where rownum = 1', 'Tên đầy đủ nhà đầu tư', '', '', '', 1233219999, 'F', '72');
                   WHEN ''002'' THEN ''5''
                   WHEN ''003'' THEN ''4''
                   WHEN ''010'' THEN ''4''
                   WHEN ''005'' THEN ''3''
                   WHEN ''006'' THEN ''4''
                   WHEN ''009'' THEN ''2''
       ELSE ''4'' END
FROM CFMAST WHERE CUSTID=''<$FILTERID>''', 'Loại giấy tờ', '', '', '', 1233219999, '', '');
       WHEN CUSTTYPE = ''B'' AND country = ''234'' THEN ''INV-DO'' WHEN CUSTTYPE = ''B'' AND country <> ''234'' THEN ''INV-FO''
       ELSE '''' END
FROM (SELECT (CASE WHEN NCUSTTYPE <> OCUSTTYPE THEN NCUSTTYPE ELSE OCUSTTYPE END) CUSTTYPE, (CASE WHEN NCOUNTRY <> OCOUNTRY THEN NCOUNTRY ELSE OCOUNTRY END) country FROM CFVSDLOG
WHERE CUSTID = ''<$FILTERID>'' ORDER BY TXNUM DESC)WHERE ROWNUM = 1 ', 'Loại đối tượng', '', '', '', 1233219999, '', '');
            WHEN  country <> ''234'' THEN ''CUSF''
            ELSE '''' END
FROM (SELECT (CASE WHEN NCOUNTRY <> OCOUNTRY THEN NCOUNTRY ELSE OCOUNTRY END) country FROM CFVSDLOG
WHERE CUSTID = ''<$FILTERID>'' ORDER BY TXNUM DESC) where rownum = 1', 'Loại khách hàng', '', '', '', 1233219999, '', '');
FROM (SELECT (CASE WHEN NCOUNTRY <> OCOUNTRY THEN NCOUNTRY ELSE OCOUNTRY END) country FROM CFVSDLOG
WHERE CUSTID = ''<$FILTERID>'' ORDER BY TXNUM DESC), allcode
WHERE cdname = ''NATIONAL'' and cdval = country AND ROWNUM = 1 ', 'Quốc tịch', '', '', '', 1233219999, '', '');
FROM CFMAST
WHERE CUSTID = ''<$FILTERID>''
', 'Mã số thuế', '', '', '', 1233219999, '', '');