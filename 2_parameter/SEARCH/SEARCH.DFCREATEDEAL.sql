SET DEFINE OFF;
select * from v_getCreateDeal where  afacctno like nvl(''<$AFACCTNO>'',''%'')
and symbol in (select symbol from dfbasket bk, dftype dft where bk.basketid = dft.basketid and dft.actype like nvl(''<@KEYVALUE>'',''%''))
and DTYPE in <$CUSTID>
', 'DFMAST', '', '', '', NULL, 50, 'N', 0, '', 'Y', 'T', '', 'N', '', '');