create table USER(
	userID varchar(20),
    userPassword varchar(20),
    userName varchar(20),
    primary key(userID)
);

 insert into USER values("root","root","관리자");  /*필수 root 계정과 일반계정이 다름*/

create table shoesinfo(
	shoesno int,
	day int,
	name varchar(20),
	price int,
    site varchar(20),
    method varchar(20),
    image varchar(50),
    primary key(shoesno)
);
    
    
create table BBS(
	bbsID int,
	bbsTitle varchar(50),
	userID varchar(20),
	bbsDate datetime,
	bbsContent varchar(2048),
	bbsAvailable INT,
	primary key(bbsID)
);
