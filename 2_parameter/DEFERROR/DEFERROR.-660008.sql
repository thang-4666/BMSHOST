SET DEFINE OFF;DELETE FROM DEFERROR WHERE 1 = 1 AND ERRNUM = -660008;Insert into DEFERROR   (ERRNUM, ERRDESC, EN_ERRDESC, MODCODE, CONFLVL) Values   (-660008, 'Số tiền phải là kiểu số', 'Amount must be numeric', 'RM', 0);COMMIT;