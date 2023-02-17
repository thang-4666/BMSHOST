SET DEFINE OFF;
select mst.*, CF.CUSTODYCD, v_advPay.advamt,
round((case when MARGINRATE * MRIRATE =0 then greatest(-OUTSTANDING,0) else
greatest( 0,-OUTSTANDING-NAVACCOUNT *100/MRIRATE) end),0) ADDVND
from CFMAST CF, v_acoountmarginrate mst  LEFT JOIN v_getAccountAvlAdvance v_advPay ON v_advPay.afacctno=mst.afacctno
where mst.CUSTID = CF.CUSTID AND groupleader=<$KEYVAL> ORDER BY cf.custodycd', 'MRTYPE', '', '', '', NULL, 50, 'N', 30, '', 'Y', 'T', '', 'N', '', '');