SET DEFINE OFF;
            cf.fullname,cf.address,cf.idcode license,
            af.acctno afacctno,af.acctno CATXNUM,af.bankacctno,cra.refacctno desacctno,cra.refacctname desacctname,
            af.bankname bankcode,af.bankname || '':'' || crb.bankname bankname , af.careby,
            least(getbaldefovd(af.acctno),
                       ci.balance - ci.holdbalance - CI.ovamt - CI.dueamt - ci.dfdebtamt - ci.dfintdebtamt
                       - ramt - ci.depofeeamt) trfamt
       from cimast ci, afmast af ,cfmast cf,crbdefacct cra,crbdefbank crb,
       (select sum(depoamt) avladvance,afacctno from v_getAccountAvlAdvance group by afacctno) adv
       where ci.acctno = af.acctno and af.custid= cf.custid
       and af.corebank =''N'' and af.alternateacct=''Y''
       and af.autotrf =''Y''
       and af.bankname=cra.refbank and cra.trfcode=''TRFSUBTRER''
       and af.bankname=crb.bankcode
       and ci.acctno = adv.afacctno(+)
       and least(getbaldefovd(af.acctno),
                       ci.balance - ci.holdbalance - CI.ovamt - CI.dueamt - ci.dfdebtamt - ci.dfintdebtamt
                       - ramt - ci.depofeeamt) > 0
', 'CRBTRFLOG', '', '', '6649', 0, 50, 'N', 30, '', 'Y', 'T', '', 'Y', 'ACCTNO', '');