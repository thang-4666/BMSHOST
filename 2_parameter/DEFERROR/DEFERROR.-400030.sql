SET DEFINE OFF;DELETE FROM DEFERROR WHERE 1 = 1 AND ERRNUM = -400030;Insert into DEFERROR   (ERRNUM, ERRDESC, EN_ERRDESC, MODCODE, CONFLVL) Values   (-400030, '[-400030]: ERR_CI_NAMT', '[-400030]: ERR_CI_NAMT', 'CI', NULL);COMMIT;