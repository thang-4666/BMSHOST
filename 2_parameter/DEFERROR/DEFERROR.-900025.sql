SET DEFINE OFF;DELETE FROM DEFERROR WHERE 1 = 1 AND ERRNUM = -900025;Insert into DEFERROR   (ERRNUM, ERRDESC, EN_ERRDESC, MODCODE, CONFLVL) Values   (-900025, '[-900025]: ERR_SE_RECEIVING', '[-900025]: ERR_SE_RECEIVING', 'SE', NULL);COMMIT;