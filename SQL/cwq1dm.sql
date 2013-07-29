CREATE DIMENSION dm_store
LEVEL timeid IS (mdassa02.time_by_day.time_id)
LEVEL theday IS (mdassa02.time_by_day.the_day)
LEVEL themonth IS (mdassa02.time_by_day.month_of_year)
LEVEL thequarter IS (mdassa02.time_by_day.quarter)
LEVEL theyear IS  (mdassa02.time_by_day.the_year)
HIERARCHY calendar_rollup (
timeid CHILD OF
theday CHILD OF
themonth CHILD OF
thequarter CHILD OF
theyear
);



