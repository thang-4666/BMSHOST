SET DEFINE OFF;DELETE FROM DEFERROR WHERE 1 = 1 AND ERRNUM = -700124;Insert into DEFERROR   (ERRNUM, ERRDESC, EN_ERRDESC, MODCODE, CONFLVL) Values   (-700124, '[-700124]: Lệnh tổng đã được gán cho môi giới khác!', '[-700124]:Lệnh tổng đã được gán cho môi giới khác!', 'OD', NULL);COMMIT;