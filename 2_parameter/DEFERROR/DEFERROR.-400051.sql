SET DEFINE OFF;DELETE FROM DEFERROR WHERE 1 = 1 AND ERRNUM = -400051;Insert into DEFERROR   (ERRNUM, ERRDESC, EN_ERRDESC, MODCODE, CONFLVL) Values   (-400051, '[-400051]: Tài khoản vẫn còn thực hiện quyền !', '[-400051]: Tài khoản vẫn còn thực hiện quyền !', 'CI', NULL);COMMIT;