SET DEFINE OFF;
        FROM vw_advanceschedule sts, afmast af, cimast ci,
            cfmast cf, aftype aft, adtype ad, mrtype mrt,v_getbuyorderinfo v,BRGRP br
        where sts.acctno =af.acctno and af.custid=cf.custid
            and ci.afacctno=af.acctno and ci.balance-ci.buysecamt-v.secureamt<0
            and af.actype = aft.actype  and aft.adtype = ad.actype and aft.mrtype = mrt.actype
            and af.acctno = v.afacctno
            AND sts.isvsd <> ''Y''
            and br.brid = br.brid
            AND af.autoadv=''Y''
            group by CF.BRID
            UNION ALL
        select ''ALL'' brname, ''ALL'' BRID,  sum(sts.MAXAVLAMT) MAXAVLAMT, sum(least(ci.buysecamt-ci.balance+v.secureamt, sts.MAXAVLAMT)) AMTADV,sum( ci.buysecamt-ci.balance+v.secureamt) ABALANCE
        FROM vw_advanceschedule sts, afmast af, cimast ci,
            cfmast cf, aftype aft, adtype ad, mrtype mrt,v_getbuyorderinfo v,BRGRP br
        where sts.acctno =af.acctno and af.custid=cf.custid
            and ci.afacctno=af.acctno and ci.balance-ci.buysecamt-v.secureamt<0
            and af.actype = aft.actype  and aft.adtype = ad.actype and aft.mrtype = mrt.actype
            and af.acctno = v.afacctno
            AND sts.isvsd <> ''Y''
            and br.brid = br.brid
            AND af.autoadv=''Y''

            ', 'CFLINK', '', '', '', NULL, 50, 'N', 30, 'NYNNYYYNNN', 'Y', 'T', '', 'N', '', '');