SET DEFINE OFF;DELETE FROM DEFERROR WHERE 1 = 1 AND ERRNUM = -180069;Insert into DEFERROR   (ERRNUM, ERRDESC, EN_ERRDESC, MODCODE, CONFLVL) Values   (-180069, '[-180069]: Khách hàng có nợ bảo lãnh không được làm giao dịch này ', '[-180069]: Khách hàng có nợ bảo lãnh không được làm giao dịch này', 'RE', NULL);COMMIT;