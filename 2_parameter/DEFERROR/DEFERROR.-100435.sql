SET DEFINE OFF;DELETE FROM DEFERROR WHERE 1 = 1 AND ERRNUM = -100435;Insert into DEFERROR   (ERRNUM, ERRDESC, EN_ERRDESC, MODCODE, CONFLVL) Values   (-100435, '[-100435]: Tỉ lệ vay, giá vay tính sức mua phải bé hơn hoặc bằng tỉ lệ vay, giá vay tính tài sản!', '[-100435]: Tỉ lệ vay, giá vay tính sức mua phải bé hơn hoặc bằng tỉ lệ vay, giá vay tính tài sản!', 'SA', NULL);COMMIT;