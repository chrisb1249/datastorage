select provider, hosp_name, city, state, count(provider) as cntr
  from better
  group by provider, hosp_name, city, state
  sort by cntr DESC
  limit 10;
