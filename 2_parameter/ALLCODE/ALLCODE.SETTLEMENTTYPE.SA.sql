SET DEFINE OFF;DELETE FROM ALLCODE WHERE 1 = 1 AND NVL(CDNAME,'NULL') = NVL('SETTLEMENTTYPE','NULL') AND NVL(CDTYPE,'NULL') = NVL('SA','NULL');Insert into ALLCODE   (CDTYPE, CDNAME, CDVAL, CDCONTENT, LSTODR, CDUSER, EN_CDCONTENT, CHSTATUS) Values   ('SA', 'SETTLEMENTTYPE', 'CWMS', 'Thanh toán bằng tiền', 1, 'Y', 'Paid Money', 'C');Insert into ALLCODE   (CDTYPE, CDNAME, CDVAL, CDCONTENT, LSTODR, CDUSER, EN_CDCONTENT, CHSTATUS) Values   ('SA', 'SETTLEMENTTYPE', 'CWTS', 'Chuyển giao chứng khoán', 2, 'Y', 'Transfer securities', 'C');COMMIT;