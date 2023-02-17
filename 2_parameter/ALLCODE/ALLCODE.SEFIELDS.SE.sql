SET DEFINE OFF;DELETE FROM ALLCODE WHERE 1 = 1 AND NVL(CDNAME,'NULL') = NVL('SEFIELDS','NULL') AND NVL(CDTYPE,'NULL') = NVL('SE','NULL');Insert into ALLCODE   (CDTYPE, CDNAME, CDVAL, CDCONTENT, LSTODR, CDUSER, EN_CDCONTENT, CHSTATUS) Values   ('SE', 'SEFIELDS', 'TRADE', 'TU DO', 1, 'Y', 'Tự do', 'C');Insert into ALLCODE   (CDTYPE, CDNAME, CDVAL, CDCONTENT, LSTODR, CDUSER, EN_CDCONTENT, CHSTATUS) Values   ('SE', 'SEFIELDS', 'RECEIVING', 'CHO VE', 1, 'Y', 'Chờ về', 'C');Insert into ALLCODE   (CDTYPE, CDNAME, CDVAL, CDCONTENT, LSTODR, CDUSER, EN_CDCONTENT, CHSTATUS) Values   ('SE', 'SEFIELDS', 'BLOCKED', 'HCCN', 2, 'Y', 'Hạn chế chuyển nhượng', 'C');Insert into ALLCODE   (CDTYPE, CDNAME, CDVAL, CDCONTENT, LSTODR, CDUSER, EN_CDCONTENT, CHSTATUS) Values   ('SE', 'SEFIELDS', 'EMKQTTY', 'PHONG TOA', 3, 'Y', 'Phong tỏa', 'C');Insert into ALLCODE   (CDTYPE, CDNAME, CDVAL, CDCONTENT, LSTODR, CDUSER, EN_CDCONTENT, CHSTATUS) Values   ('SE', 'SEFIELDS', 'MORTAGE', 'CC', 4, 'Y', 'Cầm cố', 'C');Insert into ALLCODE   (CDTYPE, CDNAME, CDVAL, CDCONTENT, LSTODR, CDUSER, EN_CDCONTENT, CHSTATUS) Values   ('SE', 'SEFIELDS', 'DEPOSIT', 'CHO LUU KY', 5, 'Y', 'Chờ lưu ký', 'C');Insert into ALLCODE   (CDTYPE, CDNAME, CDVAL, CDCONTENT, LSTODR, CDUSER, EN_CDCONTENT, CHSTATUS) Values   ('SE', 'SEFIELDS', 'SENDDEPOSIT', 'GUI CHO LUU KY', 6, 'Y', 'Gửi chờ lưu ký', 'C');Insert into ALLCODE   (CDTYPE, CDNAME, CDVAL, CDCONTENT, LSTODR, CDUSER, EN_CDCONTENT, CHSTATUS) Values   ('SE', 'SEFIELDS', 'WITHDRAW', 'CHO RUT', 7, 'Y', 'Chờ rút', 'C');Insert into ALLCODE   (CDTYPE, CDNAME, CDVAL, CDCONTENT, LSTODR, CDUSER, EN_CDCONTENT, CHSTATUS) Values   ('SE', 'SEFIELDS', 'DTOCLOSE', 'CHO DONG', 8, 'Y', 'Chờ đóng', 'C');Insert into ALLCODE   (CDTYPE, CDNAME, CDVAL, CDCONTENT, LSTODR, CDUSER, EN_CDCONTENT, CHSTATUS) Values   ('SE', 'SEFIELDS', 'BLOCKWITHDRAW', 'CHO RUT HCCN', 9, 'Y', 'Chờ rút HCCN', 'C');Insert into ALLCODE   (CDTYPE, CDNAME, CDVAL, CDCONTENT, LSTODR, CDUSER, EN_CDCONTENT, CHSTATUS) Values   ('SE', 'SEFIELDS', 'BLOCKDTOCLOSE', 'CHO DONG HCCN', 10, 'Y', 'Chờ đóng HCCN', 'C');Insert into ALLCODE   (CDTYPE, CDNAME, CDVAL, CDCONTENT, LSTODR, CDUSER, EN_CDCONTENT, CHSTATUS) Values   ('SE', 'SEFIELDS', 'NETTING', 'CHO GIAO', 11, 'Y', 'Chờ giao', 'C');COMMIT;