SET DEFINE OFF;DELETE FROM DEFERROR WHERE 1 = 1 AND ERRNUM = -200105;Insert into DEFERROR   (ERRNUM, ERRDESC, EN_ERRDESC, MODCODE, CONFLVL) Values   (-200105, '[-200105]: Trạng thái master của người dùng không thay đổi', '[-200105]: Trạng thái master của người dùng không thay đổi', 'CF', NULL);COMMIT;