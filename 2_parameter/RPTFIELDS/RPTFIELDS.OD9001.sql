SET DEFINE OFF;
 union all select ''ALL'' FILTERCD  , ''ALL'' value  , ''ALL'' valuecd , ''ALL'' DISPLAY , ''ALL'' EN_DISPLAY , ''ALL'' DESCRIPTION from dual  ORDER BY VALUE DESC

', '', 'Y', 'C', 'N');
 FROM (SELECT ''F'' VALUE ,''Truc tiep'' SYMBOL ,''Truc tiep'' fullname ,0 LSTODR FROM DUAL
    UNION ALL
SELECT ''O'' VALUE , ''Online'' SYMBOL ,''Online'' fullname ,1 LSTODR FROM DUAL)ORDER BY LSTODR', '', 'Truc tiep', 'Y', 'N', 'Y', '', '', 'N', 'C', '', '', '', '', '', '', '', '', '', '', '', '', 'Y', 'C', 'N');
fullname EN_DISPLAY, fullname DESCRIPTION FROM CFAUTH WHERE ACCTNO =''<$TAGFIELD>''  union all select ''Không chọn'' FILTERCD  , ''000'' value  , ''000'' valuecd , ''Không chọn'' DISPLAY , ''Không chọn'' EN_DISPLAY , ''Không chọn'' DESCRIPTION from dual  ORDER BY VALUE ', '', 'Y', 'C', 'N');