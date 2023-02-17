SET DEFINE OFF;
    select lnt.actype, lnt.typename, odrnum, ''Y'' IsSub
        from afmast af, aftype aft, afidtype afid, lntype lnt
        where aft.actype = afid.aftype
            and afid.actype = lnt.actype
            and af.actype = aft.actype
            and af.acctno = ''<$TAGFIELD>''
            and objname = ''LN.LNTYPE'' and lnt.status <> ''N''
    union all
    select lnt.actype, lnt.typename, 999 odrnum, ''N'' IsSub
        from afmast af, aftype aft, lntype lnt
        where af.actype = aft.actype
            and af.acctno = ''<$TAGFIELD>''
            and (aft.lntype = lnt.actype or aft.t0lntype = lnt.actype) and lnt.status <> ''N''
            )
order by case when IsSub = ''Y'' then 1 else 0 end, odrnum', 'N', '', 'Y', '', 'N', '', '', '', 'N');