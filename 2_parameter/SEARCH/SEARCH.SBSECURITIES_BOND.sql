SET DEFINE OFF;
 FROM SBSECURITIES SB,ALLCODE A0, ALLCODE A2 , securities_info SEC
 WHERE SB.TRADEPLACE IN (''007'',''008'') AND SB.SECTYPE IN (''006'',''003'') AND A0.CDTYPE = ''SA''
    AND A0.CDNAME = ''SECTYPE'' AND A0.CDVAL=SECTYPE and  A2.CDTYPE = ''SA'' AND A2.CDNAME = ''TRADEPLACE''
    AND A2.CDVAL= TRADEPLACE and SB.expdate >= getcurrdate
    AND SB.codeid = SEC.codeid', 'SBSECURITIES', 'frmSBSECURITIES', '', '', NULL, 50, 'N', 30, '', 'Y', 'T', '', 'N', '', '');