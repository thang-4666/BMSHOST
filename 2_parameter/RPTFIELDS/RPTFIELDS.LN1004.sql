SET DEFINE OFF;
SELECT CDVAL VALUE,CDVAL VALUECD, CDCONTENT DISPLAY, CDCONTENT EN_DISPLAY, CDCONTENT DESCRIPTION
FROM (
SELECT ''CL'' CDVAL,''Giao dịch ký quỹ'' CDCONTENT, 1 LSTODR FROM dual
) ORDER BY LSTODR', '', 'CL', 'Y', 'Y', 'Y', '', '', 'Y', 'C', '', '', '', '', '', '', '', '', '', '', '', '', 'Y', '', 'N');
SELECT CDVAL VALUE,CDVAL VALUECD, CDCONTENT DISPLAY, CDCONTENT EN_DISPLAY, CDCONTENT DESCRIPTION
FROM (
SELECT ''TGD'' CDVAL,''Tổng Giám Đốc'' CDCONTENT, 0 LSTODR FROM dual
union all
SELECT ''GDCN'' CDVAL,''Giám Đốc Chi Nhánh'' CDCONTENT, 1 LSTODR FROM dual
) ORDER BY LSTODR', '', '', 'Y', 'N', 'Y', '', '', 'N', 'C', '', '', '', '', '', '', '', '', '', '', '', '', 'Y', 'C', 'N');