create table if not exists spot_table (
    id bigint,
    title varchar(200) not null,
    addr varchar(500) not null,
    image varchar(200),
    mapx double,
    mapy double,
    cat varchar(100), 
    plan_id bigint,
    primary key (id),
    foreign key (plan_id) references plan_table(plan_id)
);

insert into spot_table (id, title, addr, mapx, mapy, cat, plan_id) values (1, '서울1', '서울특별시', 22.34, 55.32, null, 1);
insert into spot_table (id, title, addr, mapx, mapy, cat, plan_id) values (2, "서울2", "서울특별시", 532.34, 155.32, null, 1);
insert into spot_table (id, title, addr, mapx, mapy, cat, plan_id) values (3, "서울3", "서울특별시", 683.05, 275.19, null, 2);
insert into spot_table (id, title, addr, mapx, mapy, cat, plan_id) values (4, "서울4", "서울특별시", 123.34, 565.32, null, 2);
insert into spot_table (id, title, addr, mapx, mapy, cat, plan_id) values (5, "서울5", "서울특별시", 722.34, 315.32, null, 3);
insert into spot_table (id, title, addr, mapx, mapy, cat, plan_id) values (6, "서울6", "서울특별시", 922.34, 255.32, null, 3);