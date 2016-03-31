select measures.measurenm, procvar.measureid, procvar.var_score
  from procvar
  join measures
  on procvar.measureid = measures.measureid
  order by var_score desc limit 10;
