SET DEFINE OFF;DELETE FROM DEFERROR WHERE 1 = 1 AND ERRNUM = -400007;Insert into DEFERROR   (ERRNUM, ERRDESC, EN_ERRDESC, MODCODE, CONFLVL) Values   (-400007, '[-400007]: Lãi thấu chi cộng dồn không đủ để điều chỉnh. Thực hiện giao dịch 1171 để tra cứu số tiền lãi này.', '[-400007]: Not enought overdraft accrual interest. Make transaction 1171 to know interest amount.', 'CI', NULL);COMMIT;