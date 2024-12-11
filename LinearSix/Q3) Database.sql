create database linearsix;
use linearsix;

create table user(
id int,
firstname varchar(255),
lastname varchar(255),
email varchar(255),
cultureID int,
deleted bit,
country varchar(255),
isRevokeAccess bit,
created datetime
);

insert into user values(1, 'Victor', 'Shevchenko', 'vs@gmail.com', 1033, 1, 'US', 0, '2011-04-05'),
(2, 'Oleksandr', 'Petrenko', 'op@gmail.com', 1034, 0, 'UA', 0, '2014-05-01'),
(3, 'Victor', 'Tarasenko', 'vt@gmail.com', 1033, 1, 'US', 1, '2015-07-03'),
(4, 'Sergiy', 'Ivanenko', 'sergiy@gmail.com', 1046, 0, 'UA', 1, '2010-02-02'),
(5, 'Vitalii', 'Danilchenko', 'shumko@gmail.com', 1031, 0, 'UA', 1, '2014-05-01'),
(6, 'Joe', 'Dou', 'joe@gmail.com', 1032, 0, 'US', 1, '2009-01-01'),
(7, 'Marko', 'Polo', 'marko@gmail.com', 1033, 1, 'UA', 1, '2015-07-03');


create table `group`(
id int,
name varchar(255),
created datetime
);

insert into `group` values
(10, 'Support', '2010-02-02'),
(12, 'Dev team', '2010-02-03'),
(13, 'Apps team', '2011-05-06'),
(14, 'TEST-dev-team', '2013-05-06'),
(15, 'Guest', '2014-02-02'),
(16, 'TEST-QA-team', '2014-02-02'),
(17, 'TEST-team', '2011-01-07');


create table groupMembership(
id int,
userID int,
groupID int,
created datetime
);

insert into groupMembership values
(110, 2, 10, '2010-02-02'),
(112, 3, 15, '2010-02-03'),
(114, 1, 10, '2014-02-02'),
(115, 1, 17, '2011-05-02'),
(117, 4, 12, '2014-07-13'),
(120, 5, 15, '2014-06-15');

select * from user;
select * from `group`;
select * from groupMembership;

-- 3.2
select name from `group`
where name like "TEST-%" and id not in (select groupID from groupMembership);

-- 3.3
select firstname, lastname from user
where firstname = 'Victor' and id not in (select userID from groupMembership 
where groupID in (select id from `group` where name like "TEST-%"));

-- 3.4
select user.firstname, user.lastname, `group`.name
from user
join groupMembership 
on user.id = groupMembership.userID 
join `group`
on groupMembership.groupID = `group`.id
where user.created < `group`.created;



