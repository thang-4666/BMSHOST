SET DEFINE OFF;DELETE FROM DEFERROR WHERE 1 = 1 AND ERRNUM = -200087;Insert into DEFERROR   (ERRNUM, ERRDESC, EN_ERRDESC, MODCODE, CONFLVL) Values   (-200087, '[-200087]: Tài khoản này đang hoạt động nên không thể xóa được !', '[-200087]: Tài khoản này đang hoạt động nên không thể xóa được !', 'CF', NULL);COMMIT;