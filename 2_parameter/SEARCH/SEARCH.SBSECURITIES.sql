SET DEFINE OFF;
    A3.CDCONTENT ODD_LOT_HALT, A4.CDCONTENT HALT
 FROM SBSECURITIES,ALLCODE A0, ALLCODE A2, ALLCODE A3, ALLCODE A4
 WHERE   A0.CDTYPE = ''SA'' AND A0.CDNAME = ''SECTYPE''
  AND A0.CDVAL=SECTYPE and  A2.CDTYPE = ''SA'' AND A2.CDNAME = ''TRADEPLACE'' AND A2.CDVAL= TRADEPLACE
  AND A3.CDTYPE = ''SY'' AND A3.CDNAME = ''YESNO'' AND A3.CDVAL = ODD_LOT_HALT
  AND A4.CDTYPE = ''SY'' AND A4.CDNAME = ''YESNO'' AND A4.CDVAL = HALT', 'SBSECURITIES', 'frmSBSECURITIES', '', '', NULL, 50, 'N', 30, '', 'Y', 'T', '', 'N', '', '');