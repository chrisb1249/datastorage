select tally_state.state as st, tally_state.score as measure_score, hosp_state.hospnum as num_of_hosp, tally_state.score/hosp_state.hospnum as final_score
from tally_state
join hosp_state
on tally_state.state = hosp_state.state
order by final_score desc
limit 10;
