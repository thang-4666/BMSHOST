SET DEFINE OFF;
                a.ALTC, a.LNAM2, NVL(a1.CDCONTENT,'''') IDTY2, a.IDID2, a.IDSN2, a.BIRD2, a.COUR2, a.TAXN2, NVL(a3.CDCONTENT, '''') ICAT2, a.HLDC2
  FROM COMPARESID a,(select * FROM ALLCODE WHERE CDTYPE = ''CF'' AND CDNAME = ''IDTYPESID'' ) A0,
                    (select * FROM ALLCODE WHERE CDTYPE = ''CF'' AND CDNAME = ''IDTYPESID'' ) A1,
                    (select * FROM ALLCODE WHERE CDTYPE = ''CF'' AND CDNAME = ''CUSTTYPESID'' ) A2,
                    (select * FROM ALLCODE WHERE CDTYPE = ''CF'' AND CDNAME = ''CUSTTYPESID'' ) A3
 WHERE a.IDTY1 = A0.CDVAL (+) AND a.IDTY2 = A1.CDVAL (+) AND a.ICAT1 = A2.CDVAL (+)  AND a.ICAT2 = A3.CDVAL (+) ', 'CF1513', '', '', '', 0, 50, 'N', 30, '', 'Y', 'T', '', 'N', '', '');