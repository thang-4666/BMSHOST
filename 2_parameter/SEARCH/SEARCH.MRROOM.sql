SET DEFINE OFF;
select vm.codeid, vm.roomlimit prlimit, sb.symbol, nvl(vp.prinused,0) prinused
from vw_marginroomsystem vm, sbsecurities sb, securities_risk rsk,
(select codeid, sum(prinused) prinused from vw_afpralloc_all where restype = ''M'' group by codeid) vp
where vm.codeid = sb.codeid
and vm.codeid = vp.codeid(+)
and vm.codeid = rsk.codeid(+)
and rsk.ismarginallow = ''Y''
', 'MRROOM', 'CODEID', '', '', NULL, 50, 'N', 30, '', 'Y', 'T', '', 'N', '', '');