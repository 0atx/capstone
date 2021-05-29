create table if not exists plan_spot_table (
    planid bigint,
    spotid bigint,
    primary key (planid, spotid),
    foreign key (planid) references plan_table(id),
    foreign key (spotid) references spot_table(id)
)engine=InnoDB default charset=utf8;

insert into plan_spot_table (planid, spotid) values (1, 1);
insert into plan_spot_table (planid, spotid) values (1, 2);
insert into plan_spot_table (planid, spotid) values (2, 3);
insert into plan_spot_table (planid, spotid) values (2, 4);
insert into plan_spot_table (planid, spotid) values (3, 5);
insert into plan_spot_table (planid, spotid) values (3, 6);