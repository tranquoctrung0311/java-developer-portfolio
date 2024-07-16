--Tao bang SKILL
create table SKILL (
	skillNo NUMBER NOT NULL,
  	skillName VARCHAR2(50) NOT NULL UNIQUE
);

--Khoa chinh
ALTER TABLE SKILL ADD CONSTRAINT PK_SKILL PRIMARY KEY (skillNo);

--Du lieu
Insert into SKILL (SKILLNO,SKILLNAME) values (seq_skillID.nextval,'Ngoại ngữ');
Insert into SKILL (SKILLNO,SKILLNAME) values (seq_skillID.nextval,'Tin học văn phòng');
Insert into SKILL (SKILLNO,SKILLNAME) values (seq_skillID.nextval,'Reporting');
Insert into SKILL (SKILLNO,SKILLNAME) values (seq_skillID.nextval,'Quản lý dự án');
Insert into SKILL (SKILLNO,SKILLNAME) values (seq_skillID.nextval,'Researching');
Insert into SKILL (SKILLNO,SKILLNAME) values (seq_skillID.nextval,'Tiếp thu kiến thức mới nhanh');
Insert into SKILL (SKILLNO,SKILLNAME) values (seq_skillID.nextval,'Hoạt động nhóm tốt');
Insert into SKILL (SKILLNO,SKILLNAME) values (seq_skillID.nextval,'Có khả năng lãnh đạo');
Insert into SKILL (SKILLNO,SKILLNAME) values (seq_skillID.nextval,'Làm việc nhóm tốt');
Insert into SKILL (SKILLNO,SKILLNAME) values (seq_skillID.nextval,'Có khả năng tự học cao');
