SET DEFINE OFF;DELETE FROM DEFERROR WHERE 1 = 1 AND ERRNUM = -201181;Insert into DEFERROR   (ERRNUM, ERRDESC, EN_ERRDESC, MODCODE, CONFLVL) Values   (-201181, '[-201181]: Vẫn còn ck chuyển khoản của tài khoản !', '[-201181]: MUST_TO_CLEAR_QUANTITY !', 'SE', NULL);COMMIT;