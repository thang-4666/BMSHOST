SET DEFINE OFF;DELETE FROM ALLCODE WHERE 1 = 1 AND NVL(CDNAME,'NULL') = NVL('AD_HOC','NULL') AND NVL(CDTYPE,'NULL') = NVL('SY','NULL');Insert into ALLCODE   (CDTYPE, CDNAME, CDVAL, CDCONTENT, LSTODR, CDUSER, EN_CDCONTENT, CHSTATUS) Values   ('SY', 'AD_HOC', 'Y', 'Có', 0, 'Y', 'Có', 'C');Insert into ALLCODE   (CDTYPE, CDNAME, CDVAL, CDCONTENT, LSTODR, CDUSER, EN_CDCONTENT, CHSTATUS) Values   ('SY', 'AD_HOC', 'N', 'Không', 1, 'Y', 'Không', 'C');COMMIT;