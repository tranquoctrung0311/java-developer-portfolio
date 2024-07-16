--Tao bang POSITION 
create table POSITION(
	positionNo NUMBER NOT NULL,
  	positionName VARCHAR2(30) NOT NULL UNIQUE
);

--Khoa chinh
ALTER TABLE POSITION ADD CONSTRAINT PK_POSITION PRIMARY KEY (positionNo);

--Du lieu
Insert into POSITION (POSITIONNO,POSITIONNAME) values (1,'Quản lý phòng nhân sự');
Insert into POSITION (POSITIONNO,POSITIONNAME) values (2,'Quản lý phòng kế toán');
Insert into POSITION (POSITIONNO,POSITIONNAME) values (3,'Truong ban bao ve');
Insert into POSITION (POSITIONNO,POSITIONNAME) values (4,'Editor');
Insert into POSITION (POSITIONNO,POSITIONNAME) values (5,'Nhân viên vệ sinh');
Insert into POSITION (POSITIONNO,POSITIONNAME) values (6,'Trưởng phòng hành chính');
Insert into POSITION (POSITIONNO,POSITIONNAME) values (7,'Trưởng phòng Marketing');
