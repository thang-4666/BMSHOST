SET DEFINE OFF;DELETE FROM DEFERROR WHERE 1 = 1 AND ERRNUM = -670031;Insert into DEFERROR   (ERRNUM, ERRDESC, EN_ERRDESC, MODCODE, CONFLVL) Values   (-670031, '[-670031]: Tài khoản không được phép truy cập', '[-670031]: Account access permission deneied', 'RM', 0);COMMIT;