create table if not exists plan_table (
    plan_id bigint,
    startdate varchar(100) not null,
    enddate varchar(100) not null,
    planday varchar(100) not null,
    totaldate varchar(100) not null,
    primary key (plan_id)
);

insert into plan_table (plan_id, startdate, enddate, planday, totaldate) values (1, "2021-04-28", "2021-04-30", "1", "3");
insert into plan_table (plan_id, startdate, enddate, planday, totaldate) values (2, "2021-04-28", "2021-04-30", "2", "3");
insert into plan_table (plan_id, startdate, enddate, planday, totaldate) values (3, "2021-04-28", "2021-04-30", "3", "3");