SET DEFINE OFF;DELETE FROM DEFERROR WHERE 1 = 1 AND ERRNUM = -400008;Insert into DEFERROR   (ERRNUM, ERRDESC, EN_ERRDESC, MODCODE, CONFLVL) Values   (-400008, '[-400008]: ERR_CI_CIMAST_RAMT_NOTENOUGHT', '[-400008]: ERR_CI_CIMAST_RAMT_NOTENOUGHT', 'CI', NULL);COMMIT;