SET DEFINE OFF;DELETE FROM DEFERROR WHERE 1 = 1 AND ERRNUM = -500014;Insert into DEFERROR   (ERRNUM, ERRDESC, EN_ERRDESC, MODCODE, CONFLVL) Values   (-500014, '[-500014]: Mã TK cấp trên bao gồm 7 ký tự', '[-500014]: GLBANK include 7 character', 'GL', NULL);COMMIT;