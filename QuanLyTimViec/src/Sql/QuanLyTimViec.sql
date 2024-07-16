/*=======================================================================================================================================================*/
/*									TABLE										 */
/*=======================================================================================================================================================*/
--Tao bang POSITION va khoa chinh
create table POSITION(
	positionNo NUMBER NOT NULL,
  	positionName VARCHAR2(30) NOT NULL UNIQUE
);
ALTER TABLE POSITION ADD CONSTRAINT PK_POSITION PRIMARY KEY (positionNo);

CREATE SEQUENCE seq_positionid
MINVALUE 1
START WITH 1
INCREMENT BY 1;

--Tao bang REQUIREMENT va khoa chinh
create table REQUIREMENT (
	requirementNo NUMBER NOT NULL,
  	requirementName VARCHAR2(50) NOT NULL UNIQUE
);

ALTER TABLE REQUIREMENT ADD CONSTRAINT PK_REQUIREMENT PRIMARY KEY (requirementNo);

CREATE SEQUENCE seq_requirementid
MINVALUE 1
START WITH 1
INCREMENT BY 1;
--Tao bang REQUIRE va khoa chinh
create table REQUIRE (
	positionNo NUMBER NOT NULL,
  	requirementNo NUMBER NOT NULL,
	level_Re NUMBER,
	yearsOfExperience NUMBER,
	CHECK (level_Re BETWEEN 1 AND 6)
		 --1: Kem,
		 --2: Yeu,
		 --3: Trung binh,
		 --4: Kha,
		 --5: Gioi,
		 --6: Chuyen sau
);
ALTER TABLE REQUIRE ADD CONSTRAINT PK_REQUIRE PRIMARY KEY (positionNo, requirementNo);

--Tao bang SKILL va khoa chinh
create table SKILL (
	skillNo NUMBER NOT NULL,
  	skillName VARCHAR2(50) NOT NULL UNIQUE
);

ALTER TABLE SKILL ADD CONSTRAINT PK_SKILL PRIMARY KEY (skillNo);

CREATE SEQUENCE seq_skillid
MINVALUE 1
START WITH 1
INCREMENT BY 1;
--Tao bang RECRUIT va khoa chinh
create table RECRUIT (
	companyNo NUMBER NOT NULL,
	departmentNo NUMBER NOT NULL,
  	positionNo NUMBER NOT NULL,
  	numberOfPersonnel NUMBER
);
ALTER TABLE RECRUIT ADD CONSTRAINT PK_RECRUIT PRIMARY KEY (companyNo, departmentNo, positionNo);

--Tao bang APPLICANT va khoa chinh
CREATE TABLE APPLICANT
(
	applicantNo NUMBER NOT NULL,
	applicantName VARCHAR2(30),
	citizenID VARCHAR2(12) UNIQUE,
	dateOfBirth DATE,
	gender NUMBER,
	address VARCHAR2(60),
	phoneNumber VARCHAR2(10),
	gmail VARCHAR2(30) UNIQUE,
    accountID NUMBER,
	CHECK (gender BETWEEN 0 AND 1) 
		--0 : Nam 
		--1 : Nu
);
ALTER TABLE APPLICANT ADD CONSTRAINT PK_APPLICANT PRIMARY KEY (applicantNo);

CREATE SEQUENCE seq_applicantid
MINVALUE 1
START WITH 1
INCREMENT BY 1;

--Tao bang HAVE va khoa chinh
CREATE TABLE HAVE
(
	skillNo NUMBER NOT NULL,
	applicantNo NUMBER NOT NULL,
	level_apl NUMBER,
	yearsOfExperience NUMBER,
	CHECK (level_apl BETWEEN 1 AND 6)
		 --1: Kem,
		 --2: Yeu,
		 --3: Trung binh,
		 --4: Kha,
		 --5: Gioi,
		 --6: Chuyen sau
);
ALTER TABLE HAVE ADD CONSTRAINT PK_HAVE PRIMARY KEY (skillNo, applicantNo);

--Tao bang REGISTER va khoa chinh
CREATE TABLE REGISTER
(
	interviewScheduleNo NUMBER NOT NULL,
	applicantNo NUMBER NOT NULL,
	departmentNo NUMBER NOT NULL,
	positionNo NUMBER NOT NULL,
	status NUMBER,
	CHECK (status BETWEEN 0 AND 4)
		-- 0: Da dang ky
		-- 1: Da huy dang ky
		-- 2: Da hoan thanh
		-- 3: Khong tham gia
		-- 4: Da duoc nhan vao lam
);
ALTER TABLE REGISTER ADD CONSTRAINT PK_REGISTER PRIMARY KEY (interviewScheduleNo, applicantNo, departmentNo, positionNo);

--Tao bang EVALUATE_APL va khoa chinh
CREATE TABLE EVALUATE_APL
(
	companyNo NUMBER NOT NULL,
	applicantNo NUMBER NOT NULL,
	interviewScheduleNo NUMBER NOT NULL,
	mark_apl NUMBER,
	comment_apl VARCHAR2(2000),
	CHECK (mark_apl BETWEEN 1 AND 5)
		 --1: Rat te,
		 --2: Khong hai long,
		 --3: Binh thuong,
		 --4: Hai long,
		 --5: Rat hai long
);
ALTER TABLE EVALUATE_APL ADD CONSTRAINT PK_EVALUATE_APL PRIMARY KEY (companyNo, applicantNo, interviewScheduleNo);

--Tao bang EVALUATE_CO va khoa chinh
CREATE TABLE EVALUATE_CO
(
	companyNo NUMBER NOT NULL,
	applicantNo NUMBER NOT NULL,
	interviewScheduleNo NUMBER NOT NULL,
	mark_co NUMBER,
	comment_co VARCHAR2(2000),
	CHECK (mark_co BETWEEN 1 AND 5)
		 --1: Rat te,
		 --2: Khong hai long,
		 --3: Binh thuong,
		 --4: Hai long,
		 --5: Rat hai long
);
ALTER TABLE EVALUATE_CO ADD CONSTRAINT PK_EVALUATE_CO PRIMARY KEY (companyNo, applicantNo,interviewScheduleNo);

--Tao bang COMPANY va khoa chinh
CREATE TABLE COMPANY
(
	companyNo NUMBER NOT NULL,
	companyName VARCHAR2(50) NOT NULL UNIQUE,
	address VARCHAR2(60),
	hotline VARCHAR2(10),
	gmail VARCHAR2(30),
	startDate DATE,
	accountID NUMBER
);
ALTER TABLE COMPANY ADD CONSTRAINT PK_COMPANY PRIMARY KEY (companyNo);
CREATE SEQUENCE seq_companyid
MINVALUE 1
START WITH 1
INCREMENT BY 1;

--Tao bang DEPARTMENT va khoa chinh
CREATE TABLE DEPARTMENT
(
	departmentNo NUMBER NOT NULL,
	departmentName VARCHAR2(30) NOT NULL UNIQUE
);
ALTER TABLE DEPARTMENT ADD CONSTRAINT PK_DEPARTMENT PRIMARY KEY (departmentNo);

CREATE SEQUENCE seq_departmentid
MINVALUE 1
START WITH 1
INCREMENT BY 1;
--Tao bang INTERVIEWER va khoa chinh
CREATE TABLE INTERVIEWER
(
	interviewerNo NUMBER NOT NULL,
	interviewerName VARCHAR2(30) NOT NULL,
	phoneNumber VARCHAR2(10),
	gmail VARCHAR2(30),
	companyNo NUMBER,
	accountID NUMBER
);

ALTER TABLE INTERVIEWER ADD CONSTRAINT PK_INTERVIEWER PRIMARY KEY (interviewerNo);

CREATE SEQUENCE seq_interviewid
MINVALUE 1
START WITH 1
INCREMENT BY 1;


--Tao bang INTERVIEW_SCHEDULE va khoa chinh
CREATE TABLE INTERVIEW_SCHEDULE
(
	interviewScheduleNo NUMBER NOT NULL,
	startTime DATE,
	endTime DATE,
	location  VARCHAR2(60),
	status NUMBER,
	slot NUMBER,
	interviewerNo NUMBER,
	CHECK (status BETWEEN 0 AND 1)
		-- 0: Chua hoan thanh
		-- 1: Da hoan thanh
);
ALTER TABLE INTERVIEW_SCHEDULE ADD CONSTRAINT PK_INTERVIEW_SCHEDULE PRIMARY KEY (interviewScheduleNo);

CREATE SEQUENCE seq_scheduleid
MINVALUE 1
START WITH 1
INCREMENT BY 1;

-- Tao bang ACCOUNT
CREATE TABLE ACCOUNT (
	accountID	NUMBER NOT NULL,
	userName	VARCHAR2(20) NOT NULL UNIQUE,
	password	VARCHAR2(50) NOT NULL,
	role	 	VARCHAR2(20) NOT NULL,
	linkimage	VARCHAR2(1000) 
);
ALTER TABLE ACCOUNT ADD CONSTRAINT PK_ACC PRIMARY KEY (AccountID);

CREATE SEQUENCE seq_accountid
MINVALUE 1
START WITH 1
INCREMENT BY 1;


/*=======================================================================================================================================================*/
/*									FOREIGN KEY	 								 */
/*=======================================================================================================================================================*/


--Bang REQUIRE
ALTER TABLE REQUIRE ADD CONSTRAINT FK1_REQUIRE FOREIGN KEY (positionNo) REFERENCES POSITION(positionNo);
ALTER TABLE REQUIRE ADD CONSTRAINT FK2_REQUIRE FOREIGN KEY (requirementNo) REFERENCES REQUIREMENT(requirementNo);


--Bang HAVE
ALTER TABLE HAVE ADD CONSTRAINT FK1_HAVE FOREIGN KEY (skillNo) REFERENCES SKILL(skillNo);
ALTER TABLE HAVE ADD CONSTRAINT FK2_HAVE FOREIGN KEY (applicantNo) REFERENCES APPLICANT(applicantNo);


--Bang RECRUIT
ALTER TABLE RECRUIT ADD CONSTRAINT FK1_RECRUIT FOREIGN KEY (departmentNo) REFERENCES DEPARTMENT(departmentNo);
ALTER TABLE RECRUIT ADD CONSTRAINT FK2_RECRUIT FOREIGN KEY (positionNo) REFERENCES POSITION(positionNo);
ALTER TABLE RECRUIT ADD CONSTRAINT FK3_RECRUIT FOREIGN KEY (companyNo) REFERENCES COMPANY(companyNo);

--Bang REGISTER
ALTER TABLE REGISTER ADD CONSTRAINT FK1_REGISTER FOREIGN KEY (interviewScheduleNo) REFERENCES INTERVIEW_SCHEDULE (interviewScheduleNo);
ALTER TABLE REGISTER ADD CONSTRAINT FK2_REGISTER FOREIGN KEY (applicantNo) REFERENCES APPLICANT (applicantNo);
ALTER TABLE REGISTER ADD CONSTRAINT FK3_REGISTER FOREIGN KEY (positionNo) REFERENCES POSITION (positionNo);
ALTER TABLE REGISTER ADD CONSTRAINT FK4_REGISTER FOREIGN KEY (departmentNo) REFERENCES DEPARTMENT (departmentNo);

--Bang EVALUATE_APL
ALTER TABLE EVALUATE_APL ADD CONSTRAINT FK1_EVALUATE_APL FOREIGN KEY (companyNo) REFERENCES COMPANY (companyNo);
ALTER TABLE EVALUATE_APL ADD CONSTRAINT FK2_EVALUATE_APL FOREIGN KEY (applicantNo) REFERENCES APPLICANT (applicantNo);
ALTER TABLE EVALUATE_APL ADD CONSTRAINT FK3_EVALUATE_APL FOREIGN KEY (interviewScheduleNo) REFERENCES INTERVIEW_SCHEDULE (interviewScheduleNo);

--Bang EVALUATE_CO
ALTER TABLE EVALUATE_CO ADD CONSTRAINT FK1_EVALUATE_CO FOREIGN KEY (companyNo) REFERENCES COMPANY (companyNo);
ALTER TABLE EVALUATE_CO ADD CONSTRAINT FK2_EVALUATE_CO FOREIGN KEY (applicantNo) REFERENCES APPLICANT (applicantNo);
ALTER TABLE EVALUATE_CO ADD CONSTRAINT FK3_EVALUATE_CO FOREIGN KEY (interviewScheduleNo) REFERENCES INTERVIEW_SCHEDULE (interviewScheduleNo);

--Bang INTERVIEWER
ALTER TABLE INTERVIEWER ADD CONSTRAINT FK_INTERVIEWER FOREIGN KEY (companyNo) REFERENCES COMPANY (companyNo);
ALTER TABLE INTERVIEWER ADD CONSTRAINT FK_INTERVIEWER_ACCOUNT FOREIGN KEY (accountID) REFERENCES ACCOUNT (accountID);

--Bang INTERVIEW_SCHEDULE
ALTER TABLE INTERVIEW_SCHEDULE ADD CONSTRAINT FK_INTERVIEW_SCHEDULE FOREIGN KEY (interviewerNo) REFERENCES INTERVIEWER (interviewerNo);

-- Bang COMPANY
ALTER TABLE COMPANY ADD CONSTRAINT FK_COMPANY_ACCOUNT FOREIGN KEY (accountID) REFERENCES ACCOUNT (accountID);

-- BANG APPLICANT
ALTER TABLE APPLICANT ADD CONSTRAINT FK_APPLICANT_ACCOUNT FOREIGN KEY (accountID) REFERENCES ACCOUNT (accountID);



--Du lieu
Insert into ACCOUNT (ACCOUNTID,USERNAME,PASSWORD,ROLE) values (1,'samsung','samsungcongty123','Công ty');
Insert into ACCOUNT (ACCOUNTID,USERNAME,PASSWORD,ROLE) values (2,'intel','intelcongty123','Công ty');
Insert into ACCOUNT (ACCOUNTID,USERNAME,PASSWORD,ROLE) values (3,'cocacola','cocacola123','Công ty');
Insert into ACCOUNT (ACCOUNTID,USERNAME,PASSWORD,ROLE) values (4,'petrolimex','petrolimex123','Công ty');
Insert into ACCOUNT (ACCOUNTID,USERNAME,PASSWORD,ROLE) values (5,'viettel','viettel123','Công ty');
Insert into ACCOUNT (ACCOUNTID,USERNAME,PASSWORD,ROLE) values (6,'fpt','fptcongty123','Công ty');
Insert into ACCOUNT (ACCOUNTID,USERNAME,PASSWORD,ROLE) values (7,'tranvan','vana123','Nhà tuyển dụng');
Insert into ACCOUNT (ACCOUNTID,USERNAME,PASSWORD,ROLE) values (8,'tranvbao','vanbao123','Nhà tuyển dụng');
Insert into ACCOUNT (ACCOUNTID,USERNAME,PASSWORD,ROLE) values (9,'nguyenmcong','cong1234','Nhà tuyển dụng');
Insert into ACCOUNT (ACCOUNTID,USERNAME,PASSWORD,ROLE) values (10,'luuqanh','quocanh1234','Nhà tuyển dụng');
Insert into ACCOUNT (ACCOUNTID,USERNAME,PASSWORD,ROLE) values (11,'tranmdang','dang1234','Nhà tuyển dụng');
Insert into ACCOUNT (ACCOUNTID,USERNAME,PASSWORD,ROLE) values (12,'thaohong','thaohong123','Ứng viên');
Insert into ACCOUNT (ACCOUNTID,USERNAME,PASSWORD,ROLE) values (13,'thanhphat','thanhphat123','Ứng viên');
Insert into ACCOUNT (ACCOUNTID,USERNAME,PASSWORD,ROLE) values (14,'hoailinh','hoailinh123','Ứng viên');
Insert into ACCOUNT (ACCOUNTID,USERNAME,PASSWORD,ROLE) values (15,'anhkiet','anhkiet123','Ứng viên');
Insert into ACCOUNT (ACCOUNTID,USERNAME,PASSWORD,ROLE) values (16,'mynhung','mynhung123','Ứng viên');
Insert into ACCOUNT (ACCOUNTID,USERNAME,PASSWORD,ROLE) values (17,'phuonglinh','phuonglinh123','Ứng viên');
Insert into ACCOUNT (ACCOUNTID,USERNAME,PASSWORD,ROLE) values (18,'quoctrung','quoctrung123','Ứng viên');

Insert into APPLICANT (APPLICANTNO,APPLICANTNAME,CITIZENID,DATEOFBIRTH,GENDER,ADDRESS,PHONENUMBER,GMAIL,ACCOUNTID) values (4,'Nguyễn Thị Thảo Hồng','079202001436',to_date('11-MAR-98','DD-MON-RR'),0,'227 Nguyễn Thị Minh Khai','0275784426','thaohongnt2001@gmail.com',12);
Insert into APPLICANT (APPLICANTNO,APPLICANTNAME,CITIZENID,DATEOFBIRTH,GENDER,ADDRESS,PHONENUMBER,GMAIL,ACCOUNTID) values (3,'Nguyễn Thành Phát','079202067492',to_date('07-SEP-01','DD-MON-RR'),1,'11/6/8 Trương Công Định','0387518022','thanhphatnguyen2001@gmail.com',13);
Insert into APPLICANT (APPLICANTNO,APPLICANTNAME,CITIZENID,DATEOFBIRTH,GENDER,ADDRESS,PHONENUMBER,GMAIL,ACCOUNTID) values (1,'Nguyễn Hoài Linh','079202009176',to_date('23-APR-02','DD-MON-RR'),1,'68/23 Đồng Đen','070786884','linhhoainguyen2002@gmail.com',14);
Insert into APPLICANT (APPLICANTNO,APPLICANTNAME,CITIZENID,DATEOFBIRTH,GENDER,ADDRESS,PHONENUMBER,GMAIL,ACCOUNTID) values (2,'Nguyễn Anh Kiệt','079202005713',to_date('21-JUL-02','DD-MON-RR'),1,'76/3 Nguyễn Trãi','0787264822','nguyenanhkiet2002@gmail.com',15);
Insert into APPLICANT (APPLICANTNO,APPLICANTNAME,CITIZENID,DATEOFBIRTH,GENDER,ADDRESS,PHONENUMBER,GMAIL,ACCOUNTID) values (6,'Trần Thị Mỹ Nhung','080202009171',to_date('25-SEP-99','DD-MON-RR'),0,'89 Nguyễn Văn Cừ','0163787333','nhungtranthimy@gmail.com',16);
Insert into APPLICANT (APPLICANTNO,APPLICANTNAME,CITIZENID,DATEOFBIRTH,GENDER,ADDRESS,PHONENUMBER,GMAIL,ACCOUNTID) values (5,'Vũ Thị Phương Linh','079202008648',to_date('16-JUN-01','DD-MON-RR'),0,'61 Đống Đa','0909666371','vtplinh2k1@gmail.com',17);
Insert into APPLICANT (APPLICANTNO,APPLICANTNAME,CITIZENID,DATEOFBIRTH,GENDER,ADDRESS,PHONENUMBER,GMAIL,ACCOUNTID) values (7,'Trần Quốc Trung','077202009679',to_date('11-NOV-00','DD-MON-RR'),1,'22/6 Nguyễn Bá Tòng','0193882563','trungquoctran@gmail.com',18);

Insert into COMPANY (COMPANYNO,COMPANYNAME,ADDRESS,HOTLINE,GMAIL,STARTDATE,ACCOUNTID) values (1,'SamSung','Quận 1','2839157310','samsung@gmai.com',to_date('30-JAN-07','DD-MON-RR'),1);
Insert into COMPANY (COMPANYNO,COMPANYNAME,ADDRESS,HOTLINE,GMAIL,STARTDATE,ACCOUNTID) values (2,'Intel','Phú Nhuận','8437363000','Intel@gmai.com',to_date('21-FEB-06','DD-MON-RR'),2);
Insert into COMPANY (COMPANYNO,COMPANYNAME,ADDRESS,HOTLINE,GMAIL,STARTDATE,ACCOUNTID) values (3,'Cocacola','Hải Phòng','0500233891','Cocacola@gmai.com',to_date('14-JUN-96','DD-MON-RR'),3);
Insert into COMPANY (COMPANYNO,COMPANYNAME,ADDRESS,HOTLINE,GMAIL,STARTDATE,ACCOUNTID) values (4,'Petrolimex','Hà Nội','1900363003','Petrolimex@gmai.com',to_date('22-JUN-05','DD-MON-RR'),4);
Insert into COMPANY (COMPANYNO,COMPANYNAME,ADDRESS,HOTLINE,GMAIL,STARTDATE,ACCOUNTID) values (5,'Viettel','Hà Nội','18008098','Viettel@gmai.com',to_date('01-JUN-89','DD-MON-RR'),5);
Insert into COMPANY (COMPANYNO,COMPANYNAME,ADDRESS,HOTLINE,GMAIL,STARTDATE,ACCOUNTID) values (6,'FPT','TP HCM','0962636481','fpt@gmai.com',to_date('03-JUN-89','DD-MON-RR'),6);

Insert into DEPARTMENT (DEPARTMENTNO,DEPARTMENTNAME,DESCRIBE) values (1,'Phòng nhân sự');
Insert into DEPARTMENT (DEPARTMENTNO,DEPARTMENTNAME,DESCRIBE) values (2,'Phòng kế toán');
Insert into DEPARTMENT (DEPARTMENTNO,DEPARTMENTNAME,DESCRIBE) values (3,'Quản lý dự án');
Insert into DEPARTMENT (DEPARTMENTNO,DEPARTMENTNAME,DESCRIBE) values (4,'Bảo vệ');
Insert into DEPARTMENT (DEPARTMENTNO,DEPARTMENTNAME,DESCRIBE) values (5,'Kế toán thuế');
Insert into DEPARTMENT (DEPARTMENTNO,DEPARTMENTNAME,DESCRIBE) values (6,'Phòng hành chính');
Insert into DEPARTMENT (DEPARTMENTNO,DEPARTMENTNAME,DESCRIBE) values (7,'Phong Marketing');

Insert into EVALUATE_APL (COMPANYNO,APPLICANTNO,INTERVIEWSCHEDULENO,MARK_APL,COMMENT_APL) values (1,2,1,5,'Ứng viên trung thực');
Insert into EVALUATE_APL (COMPANYNO,APPLICANTNO,INTERVIEWSCHEDULENO,MARK_APL,COMMENT_APL) values (1,3,3,4,'Ứng viên chưa có nhiều kinh nghiệm');
Insert into EVALUATE_APL (COMPANYNO,APPLICANTNO,INTERVIEWSCHEDULENO,MARK_APL,COMMENT_APL) values (2,2,2,4,'Ứng viên hơi lúng túng');
Insert into EVALUATE_APL (COMPANYNO,APPLICANTNO,INTERVIEWSCHEDULENO,MARK_APL,COMMENT_APL) values (2,4,2,5,'Ứng viên có thực lực');
Insert into EVALUATE_APL (COMPANYNO,APPLICANTNO,INTERVIEWSCHEDULENO,MARK_APL,COMMENT_APL) values (2,5,3,5,'Kỹ năng chuyên môn cao');
Insert into EVALUATE_APL (COMPANYNO,APPLICANTNO,INTERVIEWSCHEDULENO,MARK_APL,COMMENT_APL) values (3,4,4,3,'Không chuẩn bị chu đáo');
Insert into EVALUATE_APL (COMPANYNO,APPLICANTNO,INTERVIEWSCHEDULENO,MARK_APL,COMMENT_APL) values (3,5,2,3,'Thiếu kinh nghiệm chuyên môn');
Insert into EVALUATE_APL (COMPANYNO,APPLICANTNO,INTERVIEWSCHEDULENO,MARK_APL,COMMENT_APL) values (3,6,1,3,'Còn nhiều thiếu sót');
Insert into EVALUATE_APL (COMPANYNO,APPLICANTNO,INTERVIEWSCHEDULENO,MARK_APL,COMMENT_APL) values (4,7,5,5,'Kỹ năng giao tiếp tốt');
Insert into EVALUATE_APL (COMPANYNO,APPLICANTNO,INTERVIEWSCHEDULENO,MARK_APL,COMMENT_APL) values (4,1,1,5,'Kỹ năng giao tiếp kém');
Insert into EVALUATE_APL (COMPANYNO,APPLICANTNO,INTERVIEWSCHEDULENO,MARK_APL,COMMENT_APL) values (4,1,2,5,'Thụ động trong trả lời câu hỏi');
Insert into EVALUATE_APL (COMPANYNO,APPLICANTNO,INTERVIEWSCHEDULENO,MARK_APL,COMMENT_APL) values (5,7,3,2,'Kỹ năng giao tiếp kém, thụ động');
Insert into EVALUATE_APL (COMPANYNO,APPLICANTNO,INTERVIEWSCHEDULENO,MARK_APL,COMMENT_APL) values (5,7,4,2,'Kỹ năng giao tiếp tốt');
Insert into EVALUATE_APL (COMPANYNO,APPLICANTNO,INTERVIEWSCHEDULENO,MARK_APL,COMMENT_APL) values (5,7,5,2,'Kỹ năng giao tiếp kém, thụ động');
Insert into EVALUATE_APL (COMPANYNO,APPLICANTNO,INTERVIEWSCHEDULENO,MARK_APL,COMMENT_APL) values (6,5,5,4,'Có nhiều trải nghiệm');
Insert into EVALUATE_APL (COMPANYNO,APPLICANTNO,INTERVIEWSCHEDULENO,MARK_APL,COMMENT_APL) values (6,6,1,4,'Kinh nghiệm làm việc phong phú');

Insert into EVALUATE_CO (COMPANYNO,APPLICANTNO,INTERVIEWSCHEDULENO,MARK_CO,COMMENT_CO) values (6,5,5,4,'Công ty uy tín');
Insert into EVALUATE_CO (COMPANYNO,APPLICANTNO,INTERVIEWSCHEDULENO,MARK_CO,COMMENT_CO) values (1,6,5,3,'Công ty hỏi đúng trọng tâm công việc nhưng còn hơi sơ sài');
Insert into EVALUATE_CO (COMPANYNO,APPLICANTNO,INTERVIEWSCHEDULENO,MARK_CO,COMMENT_CO) values (2,5,5,5,'Thông tin công việc đầy đủ');
Insert into EVALUATE_CO (COMPANYNO,APPLICANTNO,INTERVIEWSCHEDULENO,MARK_CO,COMMENT_CO) values (3,3,2,5,'Công ty uy tín, đáng để làm việc');
Insert into EVALUATE_CO (COMPANYNO,APPLICANTNO,INTERVIEWSCHEDULENO,MARK_CO,COMMENT_CO) values (4,5,2,4,'Tuyệt vời');

Insert into HAVE (SKILLNO,APPLICANTNO,LEVEL_APL,YEARSOFEXPERIENCE) values (1,4,5,3);
Insert into HAVE (SKILLNO,APPLICANTNO,LEVEL_APL,YEARSOFEXPERIENCE) values (1,3,4,5);
Insert into HAVE (SKILLNO,APPLICANTNO,LEVEL_APL,YEARSOFEXPERIENCE) values (2,2,3,3);
Insert into HAVE (SKILLNO,APPLICANTNO,LEVEL_APL,YEARSOFEXPERIENCE) values (3,4,2,1);
Insert into HAVE (SKILLNO,APPLICANTNO,LEVEL_APL,YEARSOFEXPERIENCE) values (4,5,5,8);
Insert into HAVE (SKILLNO,APPLICANTNO,LEVEL_APL,YEARSOFEXPERIENCE) values (5,1,1,1);
Insert into HAVE (SKILLNO,APPLICANTNO,LEVEL_APL,YEARSOFEXPERIENCE) values (1,1,3,5);

Insert into INTERVIEW_SCHEDULE (INTERVIEWSCHEDULENO,STARTTIME,ENDTIME,LOCATION,STATUS,SLOT,INTERVIEWERNO) values (1,to_date('13-JAN-21','DD-MON-RR'),to_date('15-JAN-21','DD-MON-RR'),'71 Đinh Tiên Hoàng',0,15,1);
Insert into INTERVIEW_SCHEDULE (INTERVIEWSCHEDULENO,STARTTIME,ENDTIME,LOCATION,STATUS,SLOT,INTERVIEWERNO) values (2,to_date('13-FEB-21','DD-MON-RR'),to_date('16-FEB-21','DD-MON-RR'),'65/6 Hà Tôn Quyền',1,17,2);
Insert into INTERVIEW_SCHEDULE (INTERVIEWSCHEDULENO,STARTTIME,ENDTIME,LOCATION,STATUS,SLOT,INTERVIEWERNO) values (3,to_date('26-JAN-21','DD-MON-RR'),to_date('29-JAN-21','DD-MON-RR'),'15 Nguyễn Tri Phương',0,18,2);
Insert into INTERVIEW_SCHEDULE (INTERVIEWSCHEDULENO,STARTTIME,ENDTIME,LOCATION,STATUS,SLOT,INTERVIEWERNO) values (4,to_date('13-JAN-21','DD-MON-RR'),to_date('14-JAN-21','DD-MON-RR'),'72 Ho Tung Mau',0,19,4);
Insert into INTERVIEW_SCHEDULE (INTERVIEWSCHEDULENO,STARTTIME,ENDTIME,LOCATION,STATUS,SLOT,INTERVIEWERNO) values (5,to_date('21-MAR-21','DD-MON-RR'),to_date('24-MAR-21','DD-MON-RR'),'79/5/1 Nguyen Thai Hoc',0,20,5);

Insert into INTERVIEWER (INTERVIEWERNO,INTERVIEWERNAME,PHONENUMBER,GMAIL,COMPANYNO,ACCOUNTID) values (1,'Trần Văn An','0378009008','tranvanan@gmai.com',1,7);
Insert into INTERVIEWER (INTERVIEWERNO,INTERVIEWERNAME,PHONENUMBER,GMAIL,COMPANYNO,ACCOUNTID) values (2,'Trần Văn Bảo','0378989238','tranvanbao@gmai.com.vn',2,8);
Insert into INTERVIEWER (INTERVIEWERNO,INTERVIEWERNAME,PHONENUMBER,GMAIL,COMPANYNO,ACCOUNTID) values (3,'Nguyễn Minh Công','0378011108','nguyenminhcong@gmai.com',3,9);
Insert into INTERVIEWER (INTERVIEWERNO,INTERVIEWERNAME,PHONENUMBER,GMAIL,COMPANYNO,ACCOUNTID) values (4,'Lưu Quốc Anh','0378123097','luuquocanh@gmai.com',4,10);
Insert into INTERVIEWER (INTERVIEWERNO,INTERVIEWERNAME,PHONENUMBER,GMAIL,COMPANYNO,ACCOUNTID) values (5,'Trần Minh Đăng','0374568088','tranminhdang@gmai.com',5,11);

Insert into POSITION (POSITIONNO,POSITIONNAME) values (1,'Quản lý phòng nhân sự');
Insert into POSITION (POSITIONNO,POSITIONNAME) values (2,'Quản lý phòng kế toán');
Insert into POSITION (POSITIONNO,POSITIONNAME) values (3,'Truong ban bao ve');
Insert into POSITION (POSITIONNO,POSITIONNAME) values (4,'Editor');
Insert into POSITION (POSITIONNO,POSITIONNAME) values (5,'Nhân viên vệ sinh');
Insert into POSITION (POSITIONNO,POSITIONNAME) values (6,'Trưởng phòng hành chính');
Insert into POSITION (POSITIONNO,POSITIONNAME) values (7,'Trưởng phòng Marketing');

Insert into RECRUIT (COMPANYNO,DEPARTMENTNO,POSITIONNO,NUMBEROFPERSONNEL) values (1,1,5,3);
Insert into RECRUIT (COMPANYNO,DEPARTMENTNO,POSITIONNO,NUMBEROFPERSONNEL) values (1,6,6,1);
Insert into RECRUIT (COMPANYNO,DEPARTMENTNO,POSITIONNO,NUMBEROFPERSONNEL) values (2,2,3,0);
Insert into RECRUIT (COMPANYNO,DEPARTMENTNO,POSITIONNO,NUMBEROFPERSONNEL) values (2,2,4,2);
Insert into RECRUIT (COMPANYNO,DEPARTMENTNO,POSITIONNO,NUMBEROFPERSONNEL) values (4,4,3,1);
Insert into RECRUIT (COMPANYNO,DEPARTMENTNO,POSITIONNO,NUMBEROFPERSONNEL) values (4,7,7,1);
Insert into RECRUIT (COMPANYNO,DEPARTMENTNO,POSITIONNO,NUMBEROFPERSONNEL) values (5,5,2,1);

Insert into REGISTER (INTERVIEWSCHEDULENO,APPLICANTNO,DEPARTMENTNO,POSITIONNO,STATUS) values (1,1,1,5,4);
Insert into REGISTER (INTERVIEWSCHEDULENO,APPLICANTNO,DEPARTMENTNO,POSITIONNO,STATUS) values (1,3,1,5,4);
Insert into REGISTER (INTERVIEWSCHEDULENO,APPLICANTNO,DEPARTMENTNO,POSITIONNO,STATUS) values (1,5,1,5,3);
Insert into REGISTER (INTERVIEWSCHEDULENO,APPLICANTNO,DEPARTMENTNO,POSITIONNO,STATUS) values (2,2,2,3,4);
Insert into REGISTER (INTERVIEWSCHEDULENO,APPLICANTNO,DEPARTMENTNO,POSITIONNO,STATUS) values (2,3,2,4,4);
Insert into REGISTER (INTERVIEWSCHEDULENO,APPLICANTNO,DEPARTMENTNO,POSITIONNO,STATUS) values (3,1,2,4,1);
Insert into REGISTER (INTERVIEWSCHEDULENO,APPLICANTNO,DEPARTMENTNO,POSITIONNO,STATUS) values (3,3,2,3,1);
Insert into REGISTER (INTERVIEWSCHEDULENO,APPLICANTNO,DEPARTMENTNO,POSITIONNO,STATUS) values (3,4,2,3,1);
Insert into REGISTER (INTERVIEWSCHEDULENO,APPLICANTNO,DEPARTMENTNO,POSITIONNO,STATUS) values (3,5,2,3,1);
Insert into REGISTER (INTERVIEWSCHEDULENO,APPLICANTNO,DEPARTMENTNO,POSITIONNO,STATUS) values (4,2,4,3,0);
Insert into REGISTER (INTERVIEWSCHEDULENO,APPLICANTNO,DEPARTMENTNO,POSITIONNO,STATUS) values (4,3,4,3,0);
Insert into REGISTER (INTERVIEWSCHEDULENO,APPLICANTNO,DEPARTMENTNO,POSITIONNO,STATUS) values (5,2,5,2,0);
Insert into REGISTER (INTERVIEWSCHEDULENO,APPLICANTNO,DEPARTMENTNO,POSITIONNO,STATUS) values (5,5,5,2,0);

Insert into REQUIRE (POSITIONNO,REQUIREMENTNO,LEVEL_RE,YEARSOFEXPERIENCE) values (1,3,2,null);
Insert into REQUIRE (POSITIONNO,REQUIREMENTNO,LEVEL_RE,YEARSOFEXPERIENCE) values (2,1,5,4);
Insert into REQUIRE (POSITIONNO,REQUIREMENTNO,LEVEL_RE,YEARSOFEXPERIENCE) values (5,4,6,null);
Insert into REQUIRE (POSITIONNO,REQUIREMENTNO,LEVEL_RE,YEARSOFEXPERIENCE) values (4,5,3,2);
Insert into REQUIRE (POSITIONNO,REQUIREMENTNO,LEVEL_RE,YEARSOFEXPERIENCE) values (3,2,4,1);
Insert into REQUIRE (POSITIONNO,REQUIREMENTNO,LEVEL_RE,YEARSOFEXPERIENCE) values (6,5,5,4);
Insert into REQUIRE (POSITIONNO,REQUIREMENTNO,LEVEL_RE,YEARSOFEXPERIENCE) values (7,5,5,6);

Insert into REQUIREMENT (REQUIREMENTNO,REQUIREMENTNAME) values (1,'Kế toán');
Insert into REQUIREMENT (REQUIREMENTNO,REQUIREMENTNAME) values (2,'Quản lý dự án');
Insert into REQUIREMENT (REQUIREMENTNO,REQUIREMENTNAME) values (3,'Ngoại ngữ');
Insert into REQUIREMENT (REQUIREMENTNO,REQUIREMENTNAME) values (4,'Tin học văn phong');
Insert into REQUIREMENT (REQUIREMENTNO,REQUIREMENTNAME) values (5,'Lãnh đạo');

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


/*=======================================================================================================================================================*/
/*									TRIGGER									 	 */
/*=======================================================================================================================================================*/
--------------------------------------------------------
--  DDL for Trigger CANCEL_SCHEDULE
--------------------------------------------------------

  CREATE OR REPLACE NONEDITIONABLE TRIGGER "CANCEL_SCHEDULE" 
BEFORE UPDATE
ON REGISTER
FOR EACH ROW
DECLARE 
	ID INTERVIEW_SCHEDULE.interviewerNo%TYPE;
BEGIN
	IF :NEW.STATUS = 1
	THEN
    		SELECT (ISC.interviewerNo) into ID
		FROM INTERVIEW_SCHEDULE ISC
		WHERE ISC.interviewScheduleNo = :OLD.interviewScheduleNo
                AND (( TO_DATE(ISC.startTime,'dd/mm/yyyy') - TO_DATE(CURRENT_DATE,'dd/mm/yyyy')) <= 1);

		IF  (ID is null)
    		THEN
        		RAISE_APPLICATION_ERROR(-20000, 'UNG VIEN CHI CO THE HUY LICH TRUOC 1 NGAY');
		END IF;
	END IF;
END;
ALTER TRIGGER "CANCEL_SCHEDULE" ENABLE
--------------------------------------------------------
--  DDL for Trigger INTERVIEW_SLOT
--------------------------------------------------------

  CREATE OR REPLACE NONEDITIONABLE TRIGGER "INTERVIEW_SLOT" 
BEFORE INSERT OR UPDATE
ON INTERVIEW_SCHEDULE
FOR EACH ROW
BEGIN    
    IF (:NEW.slot > 20)
    THEN
        RAISE_APPLICATION_ERROR(-20000, 'MOT LICH CHI CO TOI DA 20 UNG VIEN');
    END IF;
END;
ALTER TRIGGER "INTERVIEW_SLOT" ENABLE
--------------------------------------------------------
--  DDL for Trigger REGISTINTERVIEW_CHECKDATE
--------------------------------------------------------

  CREATE OR REPLACE NONEDITIONABLE TRIGGER "REGISTINTERVIEW_CHECKDATE" 
Before insert 
on register
for each row
declare
    interviewScheduleNo_n register.interviewscheduleno%TYPE;
    applicantNo_n register.applicantno%TYPE;
    flag number(1);
begin
    interviewScheduleNo_n := :NEW.interviewScheduleNo;
    applicantNo_n := :NEW.APPLICANTNO;

    select case
            when exists (select *
                        from (select is_i.startTime, is_i.endTime, i_i.companyNo
                                from INTERVIEW_SCHEDULE is_i join interviewer i_i on is_i.interviewerNo = i_i.interviewerNo
                                where is_i.interviewScheduleNo = interviewScheduleNo_n) them,
                            (select r_e.*, is_e.startTime, is_e.endTime, i_e.companyNo
                            from (register r_e join INTERVIEW_SCHEDULE is_e on r_e.interviewScheduleNo = is_e.interviewScheduleNo) join interviewer i_e on is_e.interviewerNo = i_e.interviewerNo) existed
                        where applicantNo_n = existed.applicantNo
                        and ((them.startTime >= existed.startTime and them.startTime <= existed.endTime) 
                        or (them.startTime < existed.startTime and them.endTime >= existed.startTime))
                        and them.companyNo <> existed.companyNo)
            then 1
            else 0 
        end into flag
    from dual;

    if flag = 1
    then
        RAISE_APPLICATION_ERROR(-20000, 'Ung vien khong the dang ky lich phong van cho nhieu cong ty tai mot thoi diem');
    end if;
end;
ALTER TRIGGER "REGISTINTERVIEW_CHECKDATE" ENABLE
--------------------------------------------------------
--  DDL for Trigger REGISTINTERVIEW_CHECKPOINT
--------------------------------------------------------

  CREATE OR REPLACE NONEDITIONABLE TRIGGER "REGISTINTERVIEW_CHECKPOINT" 
before insert
on register
for each row
declare
    diemTB float;
    slg int;
begin		
    select avg(e.mark_apl) into diemTB
    from EVALUATE_APL e
    where e.applicantNo = :NEW.applicantNo;

	select count(r.interviewScheduleNo) into slg
	from REGISTER r
	where r.applicantNo = :NEW.applicantNo
	and r.status = 0; --phieu phong van da dang ky

	if diemTB < 3 and slg >= 3
    then
        RAISE_APPLICATION_ERROR(-20000, 'DIEM UY TIN NHO HON 3 KHONG THE DANG KY THEM');
	end if;
end;
ALTER TRIGGER "REGISTINTERVIEW_CHECKPOINT" ENABLE
--------------------------------------------------------
--  DDL for Trigger TRIGGER_INTERVIEW_TIME_INTERVIEWSHCEDULE
--------------------------------------------------------

  CREATE OR REPLACE NONEDITIONABLE TRIGGER "TRIGGER_INTERVIEW_TIME_INTERVIEWSHCEDULE" 
AFTER INSERT OR UPDATE
ON INTERVIEW_SCHEDULE
FOR EACH ROW
BEGIN
	IF ((:NEW.ENDTIME - :NEW.STARTTIME)/365 < 0) THEN
        Raise_Application_Error(-20011, 'THOI GIAN KET THUC KHONG THE BE HON THOI GIAN BAT DAU');
    END IF;
END;
ALTER TRIGGER "TRIGGER_INTERVIEW_TIME_INTERVIEWSHCEDULE" ENABLE
--------------------------------------------------------
--  DDL for Trigger TRIGGER_MINUS_REGIS_SLOT
--------------------------------------------------------

  CREATE OR REPLACE NONEDITIONABLE TRIGGER "TRIGGER_MINUS_REGIS_SLOT" 
BEFORE INSERT
ON REGISTER
FOR EACH ROW
DECLARE
    SlotInItvs NUMBER := 0;
BEGIN
    -- TIM SO SLOT DANG CO TRONG LICH PHONG VAN
    SELECT Slot INTO SlotInItvs
    FROM INTERVIEW_SCHEDULE
    WHERE interviewScheduleNo = :NEW.interviewScheduleNo AND :NEW.status = 0;

    -- BAT DAU CAP NHAT
    IF(SlotInItvs <= 0) THEN
        Raise_Application_Error(-20011, 'LICH DA QUA SO LUOT SO DANG KY');
    ELSE
        UPDATE INTERVIEW_SCHEDULE S
        SET slot = slot - 1
        WHERE S.interviewScheduleNo = :NEW.interviewScheduleNo;
    END IF;
END;
ALTER TRIGGER "TRIGGER_MINUS_REGIS_SLOT" ENABLE
--------------------------------------------------------
--  DDL for Trigger TRIGGER_SCHEDULE_NOTSAME_INTERVIEWSCHEDULE
--------------------------------------------------------

  CREATE OR REPLACE NONEDITIONABLE TRIGGER "TRIGGER_SCHEDULE_NOTSAME_INTERVIEWSCHEDULE" 
BEFORE INSERT 
ON INTERVIEW_SCHEDULE
for each row
DECLARE
    flag number(1);
    SlotInItvs NUMBER := 0;
BEGIN
        SELECT CASE 
            WHEN EXISTS ( SELECT * FROM INTERVIEW_SCHEDULE
                          WHERE InterviewerNo = :NEW.InterviewerNo 
                                AND :NEW.interviewScheduleNo <> interviewScheduleNo
                                AND ( :NEW.STARTTIME >= STARTTIME AND :NEW.STARTTIME <= ENDTIME) 
                                OR  ( :NEW.STARTTIME < STARTTIME AND :NEW.ENDTIME >= STARTTIME))
            THEN 1
            ELSE 0 
        END INTO flag FROM dual;
        IF FLAG = 1
        THEN
            Raise_Application_Error(-20011, 'BAN DA CO LICH NGAY HOM DO ROI');
        END IF;


END;
ALTER TRIGGER "TRIGGER_SCHEDULE_NOTSAME_INTERVIEWSCHEDULE" ENABLE
--------------------------------------------------------
--  DDL for Trigger trigger_status_register
--------------------------------------------------------

  CREATE OR REPLACE NONEDITIONABLE TRIGGER "trigger_status_register" 
BEFORE UPDATE
ON REGISTER
FOR EACH ROW
DECLARE
    slg int := 0;
    companyNo_v company.companyNo%TYPE;
    SlotInItvs NUMBER := 0;
    startTime_v interview_schedule.startTime%TYPE;
BEGIN
    select i.companyNo into companyNo_v
    from interview_schedule intv join interviewer i on intv.interviewerNo = i.interviewerNo
    where intv.interviewScheduleNo = :OLD.interviewScheduleNo;
    select numberofpersonnel into slg
    from recruit 
    WHERE positionNo = :OLD.positionNo and departmentNo = :OLD.departmentNo and companyno = companyNo_v;

    ------Nhan vao lam
    if :NEW.status = 4
    then
        if slg > 0
        then
            update recruit 
            set numberofpersonnel = numberofpersonnel - 1
            where companyno = companyNo_v and departmentNo = :OLD.departmentNO and positionNo = :OLD.positionNo;
        else
            RAISE_APPLICATION_ERROR(-20000, 'Da nhan du so luong');
        end if;
     end if;

    -------Khong tham gia 
    IF :NEW.status = 3 THEN
        INSERT INTO EVALUATE_APL VALUES (companyNo_v, :OLD.APPLICANTNO, :OLD.interviewScheduleNo, 1, 'Khong tham gia');
    END IF;

    --------Huy dang ky
    IF :NEW.status = 1 
    THEN 
        SELECT Slot INTO SlotInItvs
        FROM INTERVIEW_SCHEDULE
        WHERE interviewScheduleNo = :OLD.interviewScheduleNo;

    -- BAT DAU CAP NHAT
        IF SlotInItvs >= 20 THEN
            Raise_Application_Error(-20011, 'MOT LICH CHI CO 20 UNG VIEN DUOC DANG KY');
        ELSE 
            select startTime into startTime_v
            from INTERVIEW_SCHEDULE
            WHERE interviewScheduleNo = :OLD.interviewScheduleNo;

            IF TO_DATE(startTime_v,'dd/mm/yyyy') - TO_DATE(CURRENT_DATE,'dd/mm/yyyy') > 1
            THEN
                UPDATE INTERVIEW_SCHEDULE S
                SET slot = slot + 1
                WHERE S.interviewScheduleNo = :OLD.interviewScheduleNo;
            ELSE
                RAISE_APPLICATION_ERROR(-20000, 'UNG VIEN CHI CO THE HUY LICH TRUOC 1 NGAY');
            END IF;
        END IF;
    END IF;
END;
ALTER TRIGGER "trigger_status_register" ENABLE


/*=======================================================================================================================================================*/
/*									PROCEDURE								 	 */
/*=======================================================================================================================================================*/
--------------------------------------------------------
--  DDL for Procedure FIND_APPLICANT
--------------------------------------------------------
set define off;

  CREATE OR REPLACE NONEDITIONABLE PROCEDURE "FIND_APPLICANT" (name_apl APPLICANT.applicantName%type)
AS
    v_apl APPLICANT%ROWTYPE;
BEGIN
    SELECT * INTO v_apl
    FROM APPLICANT
    WHERE applicantName = name_apl;

    DBMS_OUTPUT.PUT_LINE('Ma ung vien: ' || v_apl.applicantNo || '. Ten ung vien: ' || v_apl.applicantName ||
                            '. CCCD: ' || v_apl.citizenid || '. Ngay sinh: ' || v_apl.dateofbirth || '. Gioi tinh: ' ||
                            v_apl.gender || '. Dia chi: ' || v_apl.address || '. SDT: ' || v_apl.phonenumber || 
                            '. Gmail: ' || v_apl.gmail || '. So tai khoan: ' || v_apl.accountid);
END;
--------------------------------------------------------
--  DDL for Procedure FIND_COMPANY
--------------------------------------------------------
set define off;

  CREATE OR REPLACE NONEDITIONABLE PROCEDURE "FIND_COMPANY" (name_co company.companyname%type)
AS
    CURSOR c_company IS SELECT companyNo, companyName, address, startDate FROM COMPANY WHERE companyName = name_co;
    v_companyNo company.companyno%type;
    v_companyName company.companyName%type;
    v_address company.address%type;
    v_startDate company.startDate%type;
BEGIN
    OPEN c_company;
    LOOP
        FETCH c_company INTO v_companyNo, v_companyName, v_address, v_startDate;
        EXIT WHEN c_company%NOTFOUND;

        DBMS_OUTPUT.PUT('Ma cong ty: ' || v_companyNo ||'. Ten cong ty: ' || v_companyName || '. Dia chi: ' || v_address || 
                                '. Ngay thanh lap: ' || v_startDate);

        DECLARE
        CURSOR c_position IS SELECT P.positionNo, P.positionName, R.numberOfPersonnel, AVG(E.mark_co)
                                FROM BELONG B JOIN DEPARTMENT D ON B.departmentNo = D.departmentNo
                                                JOIN RECRUIT R ON D.departmentNo = R.departmentNo
                                                JOIN POSITION P ON R.positionNo = P.positionNo
                                                JOIN EVALUATE_CO E ON B.companyNo = E.companyNo
                                WHERE B.companyNo = v_companyNo
                                GROUP BY P.positionNo, P.positionName, R.numberOfPersonnel;

        v_positionNo POSITION.positionNo%type;
        v_positionName POSITION.positionName%type;
        v_numberOfPersonnel RECRUIT.numberOfPersonnel%type;
        v_avg float;

        BEGIN
            OPEN c_position;
            LOOP
                FETCH c_position INTO v_positionNo, v_positionName, v_numberOfPersonnel, v_avg;
                EXIT WHEN c_position%NOTFOUND;

                IF c_position%FOUND THEN
                    DBMS_OUTPUT.PUT_LINE('. Ma vi tri: ' || v_positionNo || '. Ten vi tri: ' || v_positionName || 
                    '. So luong can:' || v_numberOfPersonnel || '. Diem trung binh: ' || v_avg);
                END IF;
            END LOOP;
            CLOSE c_position;
        END;
    END LOOP;
    CLOSE c_company;
END;
--------------------------------------------------------
--  DDL for Procedure FIND_EVALUATE_APPLICANT
--------------------------------------------------------
set define off;

  CREATE OR REPLACE NONEDITIONABLE PROCEDURE "FIND_EVALUATE_APPLICANT" (name_apl APPLICANT.applicantName%type)
AS
    CURSOR c_applicant IS SELECT applicantNo, applicantName FROM APPLICANT WHERE applicantName = name_apl;
    v_applicantNo APPLICANT.applicantNo%type;
    v_applicantName APPLICANT.applicantName%type;
BEGIN
    OPEN c_applicant;
    LOOP
        FETCH c_applicant INTO v_applicantNo, v_applicantName;
        EXIT WHEN c_applicant%NOTFOUND;

        DBMS_OUTPUT.PUT_LINE('Ma ung vien: ' || v_applicantNo || '. Ten ung vien: ' || v_applicantName);

        DECLARE
        CURSOR c_evaluate IS SELECT mark_apl, comment_apl, companyNo FROM EVALUATE_APL WHERE applicantNo = v_applicantNo;
        v_mark_apl EVALUATE_APL.mark_apl%type;
        v_comment_apl EVALUATE_APL.comment_apl%type;
        v_companyNo EVALUATE_APL.companyNo%type;

        BEGIN
        OPEN c_evaluate;
        LOOP
            FETCH c_evaluate INTO v_mark_apl, v_comment_apl, v_companyNo;
            EXIT WHEN c_evaluate%NOTFOUND;

            IF c_evaluate%FOUND THEN
                DBMS_OUTPUT.PUT_LINE('Ma cong ty: ' || v_companyNo || '. Diem danh gia: ' || v_mark_apl || '. Ghi chu: ' ||
                                        v_comment_apl);
            END IF;
        END LOOP;
        CLOSE c_evaluate;
        END;
    END LOOP;
    CLOSE c_applicant;
END;
--------------------------------------------------------
--  DDL for Procedure FIND_EVALUATE_COMPANY
--------------------------------------------------------
set define off;

  CREATE OR REPLACE NONEDITIONABLE PROCEDURE "FIND_EVALUATE_COMPANY" (name_co COMPANY.companyName%type)
AS
    CURSOR c_company IS SELECT companyNo, companyName FROM COMPANY WHERE companyName = name_co;
    v_companyNo COMPANY.companyNo%type;
    v_companyName COMPANY.companyName%type;
BEGIN
    OPEN c_company;
    LOOP
        FETCH c_company INTO v_companyNo, v_companyName;
        EXIT WHEN c_company%NOTFOUND;

        DBMS_OUTPUT.PUT_LINE('Ma cong ty: ' || v_companyNo || '. Ten cong ty: ' || v_companyName);

        DECLARE
        CURSOR c_evaluate IS SELECT mark_co, comment_co, applicantNo FROM EVALUATE_CO WHERE companyNo = v_companyNo;
        v_mark_co EVALUATE_CO.mark_co%type;
        v_comment_co EVALUATE_CO.comment_co%type;
        v_applicantNo EVALUATE_CO.applicantNo%type;

        BEGIN
        OPEN c_evaluate;
        LOOP
            FETCH c_evaluate INTO v_mark_co, v_comment_co, v_applicantNo;
            EXIT WHEN c_evaluate%NOTFOUND;

            IF c_evaluate%FOUND THEN
                DBMS_OUTPUT.PUT_LINE('Ma ung vien: ' || v_applicantNo || '. Diem danh gia: ' || v_mark_co || '. Ghi chu: ' ||
                                        v_comment_co);
            END IF;
        END LOOP;
        CLOSE c_evaluate;
        END;
    END LOOP;
    CLOSE c_company;
END;
--------------------------------------------------------
--  DDL for Procedure FIND_INTERVIEWER
--------------------------------------------------------
set define off;

  CREATE OR REPLACE NONEDITIONABLE PROCEDURE "FIND_INTERVIEWER" (name_interviewer INTERVIEWER.interviewerName%type)
AS
    CURSOR c_interviewer IS SELECT  I.interviewerNo, I.interviewerName, I.phoneNumber, I.gmail, C.companyName 
                            FROM INTERVIEWER I JOIN COMPANY C ON I.companyNo = C.companyNo
                            WHERE I.interviewerName =  name_interviewer;
    v_interviewerNo INTERVIEWER.interviewerNo%type;
    v_interviewerName INTERVIEWER.interviewerName%type;
    v_phoneNumber INTERVIEWER.phoneNumber%type;
    v_gmail INTERVIEWER.gmail%type;
    v_companyName COMPANY.companyName%type;
BEGIN
    OPEN c_interviewer;
    LOOP
        FETCH c_interviewer INTO v_interviewerNo, v_interviewerName, v_phoneNumber, v_gmail, v_companyName;
        EXIT WHEN c_interviewer%NOTFOUND;

        DBMS_OUTPUT.PUT_LINE('Ma nha tuyen dung: ' || v_interviewerNo || '. Ten nha tuyen dung: ' || v_interviewerName ||
                                '. SDT: ' || v_phoneNumber || '. Gmail: ' || v_gmail || '. Ten cong ty: ' || v_companyName);
    END LOOP;
    CLOSE c_interviewer;
END;
--------------------------------------------------------
--  DDL for Procedure HUY_LICH
--------------------------------------------------------
set define off;

  CREATE OR REPLACE NONEDITIONABLE PROCEDURE "HUY_LICH" (applicantNo_in applicant.applicantNo%TYPE, 
                                        interviewScheduleNo_in interview_schedule.interviewscheduleno%TYPE)
as
begin
    update register
    set status = 1
    where applicantNo = applicantNo_in and interviewScheduleNo = interviewScheduleNo_in and status = 0;
end;
--------------------------------------------------------
--  DDL for Procedure PROC_APPLICANT_SKILL
--------------------------------------------------------
set define off;

  CREATE OR REPLACE NONEDITIONABLE PROCEDURE "PROC_APPLICANT_SKILL" (ApplicantNo_In applicant.applicantno%TYPE)
AS
    -- Khoi tao con tro luu du lieu ma ung vien voi ma ung vien = ma ung vien truyen vao
    CURSOR C_APPLICANT IS SELECT ApplicantNo FROM APPLICANT WHERE ApplicantNo = ApplicantNo_In;
    Applicant_No APPLICANT.ApplicantNo%TYPE;
BEGIN
    OPEN C_APPLICANT;
    LOOP
        FETCH C_APPLICANT INTO Applicant_No;
        EXIT WHEN C_APPLICANT%NOTFOUND;

        DBMS_OUTPUT.PUT_LINE('Ma ung vien: ' || Applicant_No);

        DECLARE
            -- Khoi tao con tro luu du lieu cac ki nang cua ung vien
            -- Dieu kien: ma ung vien co ki nang nay phai bang ma ung vien duoc luu boi con tro o tren
            CURSOR C_SKILL IS SELECT S.SkillNo, S.SkillName
                              FROM APPLICANT A JOIN HAVE H ON A.ApplicantNo = H.ApplicantNo
                                               JOIN SKILL S ON H.SkillNo = S.SkillNo
                              WHERE A.ApplicantNo = Applicant_No;
            Skill_No SKILL.SkillNo%TYPE;
            Skill_Name SKILL.SkillName%TYPE;
        BEGIN
            OPEN C_SKILL;
            LOOP
                FETCH C_SKILL INTO Skill_No, Skill_Name;
                EXIT WHEN C_SKILL%NOTFOUND;

                IF C_SKILL%FOUND THEN
                    DBMS_OUTPUT.PUT_LINE('Ma ky nang: ' || Skill_No);
                    DBMS_OUTPUT.PUT_LINE('Ky nang cua ung vien: ' || Skill_Name);
                END IF;
            END LOOP;
            CLOSE C_SKILL;
        END;
    END LOOP;
    CLOSE C_APPLICANT;
END;
--------------------------------------------------------
--  DDL for Procedure PROC_COMPANY_RECRUIT
--------------------------------------------------------
set define off;

  CREATE OR REPLACE NONEDITIONABLE PROCEDURE "PROC_COMPANY_RECRUIT" (companyNo_IN IN company.companyno%TYPE)
AS
    -- Khoi tao con tro luu du lieu Ma Cong Ty voi dieu kien Ma Cong Ty = Ma Cong Ty truyen vao
    CURSOR C_COMPANY IS SELECT CompanyNo FROM Company WHERE CompanyNo = companyNo_IN;
    Company_No company.companyno%TYPE;
BEGIN
    OPEN C_COMPANY;
    LOOP
        FETCH C_COMPANY INTO Company_No;
        EXIT WHEN C_COMPANY%NOTFOUND;

        DBMS_OUTPUT.PUT_LINE('Ma cong ty: ' || companyNo_IN);

        DECLARE
            -- Khoi tao con tro luu du lieu ten cong viec va ma cong viec can tuyen
            -- Dieu kien: Ma cong ty tuyen cong viec do bang ma cua con tro o tren
            CURSOR C_POS IS SELECT P.PositionNo, P.PositionName 
                            FROM DEPARTMENT D JOIN BELONG B ON D.departmentNo = B.departmentNo 
                                  JOIN COMPANY C ON B.companyNo = C.companyNo
                                  JOIN RECRUIT R ON R.departmentNo = D.departmentNo
                                  JOIN POSITION P ON P.positionNo = R.positionNo
                            WHERE C.CompanyNo = Company_No; 
            Pos_No Position.PositionNo%TYPE;
            Pos_name Position.PositionName%TYPE;
        BEGIN                           
            OPEN C_POS;
            LOOP
                FETCH C_POS INTO Pos_No, Pos_Name;
                EXIT WHEN C_POS%NOTFOUND;

                IF C_POS%FOUND THEN
                    DBMS_OUTPUT.PUT_LINE('Ma cong viec dang tuyen: ' || Pos_No);
                    DBMS_OUTPUT.PUT_LINE('Ten cong viec dang tuyen: ' || Pos_Name);
                END IF;
            END LOOP;
            CLOSE C_POS;
        END;

    END LOOP;
    CLOSE C_COMPANY;
END;
--------------------------------------------------------
--  DDL for Procedure PROC_DELETE_ACCOUNT
--------------------------------------------------------
set define off;

  CREATE OR REPLACE NONEDITIONABLE PROCEDURE "PROC_DELETE_ACCOUNT" (userName_dlt IN ACCOUNT.username%TYPE)
AS
    NumberOfEffect NUMBER:=0;
BEGIN
    -- DEM SO DONG ANH HUONG
    SELECT COUNT(accountID) INTO NumberOfEffect
    FROM Account
    WHERE userName = userName_dlt;
    -- XOA DU LIEU
    DELETE FROM Account
    WHERE userName = userName_dlt;

    -- THONG BAO
    IF(NumberOfEffect <> 0) THEN
        DBMS_OUTPUT.PUT_LINE('Xoa thanh cong!');
    ELSE
        DBMS_OUTPUT.PUT_LINE('Du lieu khong ton tai!');
    END IF;
    COMMIT;
END;
--------------------------------------------------------
--  DDL for Procedure PROC_DELETE_APPLICANT
--------------------------------------------------------
set define off;

  CREATE OR REPLACE NONEDITIONABLE PROCEDURE "PROC_DELETE_APPLICANT" (v_applicantNo APPLICANT.applicantNo%TYPE)
AS
BEGIN
    DELETE FROM APPLICANT
    WHERE applicantNo = v_applicantNo;
    COMMIT;
END;
--------------------------------------------------------
--  DDL for Procedure PROC_DELETE_COMP
--------------------------------------------------------
set define off;

  CREATE OR REPLACE NONEDITIONABLE PROCEDURE "PROC_DELETE_COMP" (companyName_dlt IN COMPANY.companyname%TYPE)
AS
    NumberOfEffect NUMBER:=0;
BEGIN
    -- DEM SO DONG ANH HUONG
    SELECT COUNT(companyNo) INTO NumberOfEffect
    FROM COMPANY
    WHERE companyName = companyName_dlt;
    -- XOA DU LIEU
    DELETE FROM COMPANY
    WHERE companyName = companyName_dlt;

    -- THONG BAO
    IF(NumberOfEffect <> 0) THEN
        DBMS_OUTPUT.PUT_LINE('Xoa thanh cong!');
    ELSE
        DBMS_OUTPUT.PUT_LINE('Du lieu khong ton tai!');
    END IF;
    COMMIT;
END;
--------------------------------------------------------
--  DDL for Procedure PROC_DELETE_DEP
--------------------------------------------------------
set define off;

  CREATE OR REPLACE NONEDITIONABLE PROCEDURE "PROC_DELETE_DEP" (departmentName_dlt IN department.departmentname%TYPE)
AS
    NumberOfEffect NUMBER:=0;
BEGIN
    -- DEM SO DONG ANH HUONG
    SELECT COUNT(departmentNo) INTO NumberOfEffect
    FROM DEPARTMENT
    WHERE departmentName = departmentName_dlt;
    -- XOA DU LIEU
    DELETE FROM DEPARTMENT
    WHERE departmentName = departmentName_dlt;

    -- THONG BAO
    IF(NumberOfEffect <> 0) THEN
        DBMS_OUTPUT.PUT_LINE('Xoa thanh cong!');
    ELSE
        DBMS_OUTPUT.PUT_LINE('Du lieu khong ton tai!');
    END IF;
    COMMIT;
END;
--------------------------------------------------------
--  DDL for Procedure PROC_DELETE_DEPARTMENT_OF_RECRUIT
--------------------------------------------------------
set define off;

  CREATE OR REPLACE NONEDITIONABLE PROCEDURE "PROC_DELETE_DEPARTMENT_OF_RECRUIT" (companyNo_in RECRUIT.COMPANYNO%TYPE,
                                            departmentNo_in RECRUIT.DEPARTMENTNO%TYPE)
AS
BEGIN
    DELETE FROM RECRUIT
    WHERE companyNo = companyNo_in and departmentno = departmentNo_in;

    DELETE FROM REGISTER
    WHERE departmentno = departmentNo_in and interviewscheduleNo in (select its.interviewScheduleNo
									from interview_schedule its join interviewer i 
										on its.interviewerNo = i.interviewerNo
									where i.companyNo =  companyNo_in);
    COMMIT;
END;
--------------------------------------------------------
--  DDL for Procedure PROC_DELETE_EVALUATE_APL
--------------------------------------------------------
set define off;

  CREATE OR REPLACE NONEDITIONABLE PROCEDURE "PROC_DELETE_EVALUATE_APL" (companyNo_in EVALUATE_APL.companyNo%TYPE,
                                            applicantNo_in EVALUATE_APL.applicantNo%TYPE,
                                            interviewScheduleNo_in EVALUATE_APL.interviewscheduleno%TYPE)
AS
BEGIN
        DELETE EVALUATE_APL
        WHERE companyNo = companyNo_in and applicantNo = applicantNo_in and interviewscheduleno = interviewScheduleNo_in;
        DBMS_OUTPUT.PUT_LINE('Xoa thanh cong!');
        COMMIT;
END;
--------------------------------------------------------
--  DDL for Procedure PROC_DELETE_EVALUATE_CO
--------------------------------------------------------
set define off;

  CREATE OR REPLACE NONEDITIONABLE PROCEDURE "PROC_DELETE_EVALUATE_CO" (companyNo_in EVALUATE_CO.companyNo%TYPE,
                                                    applicantNo_in EVALUATE_CO.applicantNo%TYPE,
                                                    interviewScheduleNo_in EVALUATE_CO.interviewScheduleNo%TYPE)
AS
BEGIN
        DELETE EVALUATE_CO
        WHERE companyNo = companyNo_in and applicantNo = applicantNo_in and interviewScheduleNo = interviewScheduleNo_in;
        DBMS_OUTPUT.PUT_LINE('Xoa thanh cong!');
        COMMIT;
END;
--------------------------------------------------------
--  DDL for Procedure PROC_DELETE_HAVE
--------------------------------------------------------
set define off;

  CREATE OR REPLACE NONEDITIONABLE PROCEDURE "PROC_DELETE_HAVE" (skillName_in SKILL.skillName%TYPE,
                                            applicantNo_in HAVE.applicantNo%TYPE)
AS
    skillNo_in SKILL.skillno%TYPE;
BEGIN
        select skillNo into skillNo_in
        from skill
        where skillname = skillname_in;

        DELETE HAVE 
        WHERE skillNo = skillNo_in and applicantNo = applicantNo_in;
        COMMIT;
END;
--------------------------------------------------------
--  DDL for Procedure PROC_DELETE_INTERVIEWER
--------------------------------------------------------
set define off;

  CREATE OR REPLACE NONEDITIONABLE PROCEDURE "PROC_DELETE_INTERVIEWER" (v_interviewerNo INTERVIEWER.interviewerNo%TYPE)
AS
BEGIN
    DELETE FROM INTERVIEWER
    WHERE interviewerNo = v_interviewerNo;
    COMMIT;
END;
--------------------------------------------------------
--  DDL for Procedure PROC_DELETE_INTERVIEW_SCHEDULE
--------------------------------------------------------
set define off;

  CREATE OR REPLACE NONEDITIONABLE PROCEDURE "PROC_DELETE_INTERVIEW_SCHEDULE" (v_interviewScheduleNo INTERVIEW_SCHEDULE.interviewScheduleNo%TYPE)
AS
BEGIN
    DELETE FROM INTERVIEW_SCHEDULE
    WHERE interviewScheduleNo = v_interviewScheduleNo;
    COMMIT;
END;
--------------------------------------------------------
--  DDL for Procedure PROC_DELETE_POSITION
--------------------------------------------------------
set define off;

  CREATE OR REPLACE NONEDITIONABLE PROCEDURE "PROC_DELETE_POSITION" (PosNo IN Position.PositionNo%TYPE)
IS
BEGIN
    -- XOA DU LIEU
    DELETE FROM POSITION
    WHERE positionNo = PosNo;
    DBMS_OUTPUT.PUT_LINE('Xoa thanh cong!');
    COMMIT;
END;
--------------------------------------------------------
--  DDL for Procedure PROC_DELETE_POSITION_OF_RECRUIT
--------------------------------------------------------
set define off;

  CREATE OR REPLACE NONEDITIONABLE PROCEDURE "PROC_DELETE_POSITION_OF_RECRUIT" (companyNo_in RECRUIT.COMPANYNO%TYPE,
                                            departmentNo_in DEPARTMENT.DEPARTMENTNO%TYPE,
                                            positionName_in POSITION.POSITIONNAME%TYPE)
AS
    positionNo_in position.positionNo%TYPE;
BEGIN
    Select positionNo into positionNo_in
    From position where positionname = positionname_in;

    DELETE FROM RECRUIT 
    WHERE companyno = companyNo_in and departmentNo = departmentNo_in and positionNo = positionNo_in;
    COMMIT;
END;
--------------------------------------------------------
--  DDL for Procedure PROC_DELETE_RECRUIT
--------------------------------------------------------
set define off;

  CREATE OR REPLACE NONEDITIONABLE PROCEDURE "PROC_DELETE_RECRUIT" (Company_No Recruit.companyNo%TYPE,
                                                Depart_No Recruit.departmentNo%TYPE,
                                                Pos_No Recruit.positionNo%TYPE)
IS
BEGIN    
    -- XOA DU LIEU
    DELETE FROM RECRUIT
    WHERE DepartmentNo = Depart_No AND PositionNo = Pos_No AND companyNo = Company_No;
    DBMS_OUTPUT.PUT_LINE('Xoa thanh cong');
    EXCEPTION WHEN no_data_found
    THEN
        DBMS_OUTPUT.PUT_LINE('Du lieu khonng ton tai');
    COMMIT;
END;
--------------------------------------------------------
--  DDL for Procedure PROC_DELETE_REGISTER
--------------------------------------------------------
set define off;

  CREATE OR REPLACE NONEDITIONABLE PROCEDURE "PROC_DELETE_REGISTER" (interviewScheduleNo_in REGISTER.interviewScheduleNo%TYPE,
                                                 departmentNo_in REGISTER.departmentNo%TYPE,
                                                 applicantNo_in REGISTER.applicantNo%TYPE,
                                                 positionNo_in REGISTER.positionNo%TYPE)
AS
BEGIN
        DELETE REGISTER
        WHERE interviewScheduleNo = interviewScheduleNo_in and applicantNo = applicantNo_in
        and departmentNo = departmentNo_in and positionNo = positionNo_in;
        DBMS_OUTPUT.PUT_LINE('Sua thanh cong!');
        COMMIT;
END;
--------------------------------------------------------
--  DDL for Procedure PROC_DELETE_REQUIRE
--------------------------------------------------------
set define off;

  CREATE OR REPLACE NONEDITIONABLE PROCEDURE "PROC_DELETE_REQUIRE" (posNo REQUIRE.positionNo%TYPE,
                                                requireNo REQUIRE.requirementNo%TYPE)
IS
BEGIN
    DELETE FROM REQUIRE
    WHERE positionNo = posNo AND requirementNo = requireNo;
    DBMS_OUTPUT.PUT_LINE('Xoa thanh cong!');
    COMMIT;
END;
--------------------------------------------------------
--  DDL for Procedure PROC_DELETE_REQUIREMENT
--------------------------------------------------------
set define off;

  CREATE OR REPLACE NONEDITIONABLE PROCEDURE "PROC_DELETE_REQUIREMENT" (requirement_No REQUIREMENT.requirementNo%TYPE)
IS
BEGIN
    -- XOA DU LIEU
    DELETE FROM REQUIREMENT
    WHERE requirementNo = requirement_No;
    DBMS_OUTPUT.PUT_LINE('Xoa thanh cong');
    EXCEPTION WHEN no_data_found
    THEN 
        DBMS_OUTPUT.PUT_LINE('Du lieu khong ton tai');
    COMMIT;
END;
--------------------------------------------------------
--  DDL for Procedure PROC_DELETE_SKILL
--------------------------------------------------------
set define off;

  CREATE OR REPLACE NONEDITIONABLE PROCEDURE "PROC_DELETE_SKILL" (v_skillNo SKILL.skillNo%TYPE)
AS
BEGIN
    DELETE FROM SKILL
    WHERE skillNo = v_skillNo;
    COMMIT;
END;
--------------------------------------------------------
--  DDL for Procedure PROC_DELETE_SKILLT
--------------------------------------------------------
set define off;

  CREATE OR REPLACE NONEDITIONABLE PROCEDURE "PROC_DELETE_SKILLT" (v_skillNo SKILL.skillNo%TYPE)
AS
BEGIN
    DELETE FROM SKILL
    WHERE skillNo = v_skillNo;
    COMMIT;
END;
--------------------------------------------------------
--  DDL for Procedure PROC_INSERT_ACCOUNT
--------------------------------------------------------
set define off;

  CREATE OR REPLACE NONEDITIONABLE PROCEDURE "PROC_INSERT_ACCOUNT" ( userName_new ACCOUNT.username%TYPE,
                                             password_new ACCOUNT.password%TYPE,
                                             role_new ACCOUNT.role%TYPE)
AS
BEGIN
        -- THEM DU LIEU MOI
        INSERT INTO ACCOUNT(accountID, userName,password,role) 
        VALUES(seq_accountid.nextval,userName_new,password_new,role_new);
        DBMS_OUTPUT.PUT_LINE('Them thanh cong!');
        COMMIT;
END;
--------------------------------------------------------
--  DDL for Procedure PROC_INSERT_APPLICANT
--------------------------------------------------------
set define off;

  CREATE OR REPLACE NONEDITIONABLE PROCEDURE "PROC_INSERT_APPLICANT" (  v_applicantName APPLICANT.applicantName%TYPE,
                                                    v_citizenID APPLICANT.citizenID%TYPE,
                                                    v_dateOfBirth VARCHAR2,
                                                    v_gender APPLICANT.gender%TYPE,
                                                    v_address APPLICANT.address%TYPE,
                                                    v_PHONENUMBER APPLICANT.PHONENUMBER%TYPE,
                                                    v_gmail APPLICANT.gmail%TYPE,
                                                    v_accountID APPLICANT.accountID%TYPE)
AS
BEGIN
    INSERT INTO APPLICANT VALUES (seq_applicantid.nextval,v_applicantName, v_citizenID , TO_DATE(v_dateOfBirth,'dd/mm/yyyy'), v_gender , v_address, v_PHONENUMBER, v_gmail, v_accountID);
    COMMIT;
END;
--------------------------------------------------------
--  DDL for Procedure PROC_INSERT_BELONG
--------------------------------------------------------
set define off;

  CREATE OR REPLACE NONEDITIONABLE PROCEDURE "PROC_INSERT_BELONG" ( departmentNo_new BELONG.departmentno%TYPE,
                                                companyNo_new BELONG.companyNo%TYPE)                                             
AS
BEGIN
        -- THEM DU LIEU MOI
        INSERT INTO BELONG(departmentNo, companyNo) 
        VALUES(departmentNo_new,companyNo_new);
        DBMS_OUTPUT.PUT_LINE('Them thanh cong!');
        COMMIT;
END;
--------------------------------------------------------
--  DDL for Procedure PROC_INSERT_COMP
--------------------------------------------------------
set define off;

  CREATE OR REPLACE NONEDITIONABLE PROCEDURE "PROC_INSERT_COMP" (companyName_new COMPANY.companyname%TYPE,
                                             address_new  company.address%TYPE,
                                             hotline_new company.hotline%TYPE,
                                             gmail_new COMPANY.gmail%TYPE,
                                             startDate_new COMPANY.startdate%TYPE,
                                             accountID_new company.accountid%TYPE)
AS
BEGIN
        -- THEM DU LIEU MOI
        INSERT INTO COMPANY(companyNo,companyName,address,hotline,gmail,startDate,accountID) 
        VALUES(seq_companyid.nextval,companyName_new,address_new,hotline_new,gmail_new,startDate_new,accountID_new);
        DBMS_OUTPUT.PUT_LINE('Them thanh cong!');
        COMMIT;
END;
--------------------------------------------------------
--  DDL for Procedure PROC_INSERT_DEP
--------------------------------------------------------
set define off;

  CREATE OR REPLACE NONEDITIONABLE PROCEDURE "PROC_INSERT_DEP" ( departmentName_new department.departmentname%TYPE)                                             
AS
BEGIN
        -- THEM DU LIEU MOI
        INSERT INTO DEPARTMENT(departmentNo, departmentName) 
        VALUES(seq_departmentid.nextval,departmentName_new);
        DBMS_OUTPUT.PUT_LINE('Them thanh cong!');
        COMMIT;
END;
--------------------------------------------------------
--  DDL for Procedure PROC_INSERT_DEPARTMENT_OF_RECRUIT
--------------------------------------------------------
set define off;

  CREATE OR REPLACE NONEDITIONABLE PROCEDURE "PROC_INSERT_DEPARTMENT_OF_RECRUIT" (companyNo_in RECRUIT.COMPANYNO%TYPE,
                                            departmentName_new DEPARTMENT.DEPARTMENTNAME%TYPE,
                                            positionName_new POSITION.POSITIONNAME%TYPE,
                                            numberOfPersonnel_new recruit.numberofpersonnel%TYPE)
AS
    departmentNo_new department.departmentNo%TYPE;
    positionNo_new position.positionNo%TYPE;
    flag_department number(1);
    flag_position number(1);
BEGIN
   select case 
        when exists (select * from department where departmentname = departmentName_new)
        then 1
        else 0
    end into flag_department
    from dual;

    if flag_department =  0
    Then 
        proc_insert_dep(departmentName_new);

        Select departmentNo into departmentNo_new
        From department where departmentname = departmentname_new;
    Else
        Select departmentNo into departmentNo_new
        From department where departmentname = departmentname_new;
    End if;

    select case 
        when exists (select * from position where positionname = positionName_new)
        then 1
        else 0
    end into flag_position
    from dual;

    if flag_position =  0
    Then 
        proc_insert_position(positionName_new);

        Select positionNo into positionNo_new
        From position where positionname = positionname_new;
    Else
        Select positionNo into positionNo_new
        From position where positionname = positionname_new;
    End if;

    Insert into recruit values (companyNo_in, departmentNo_new, positionNo_new, numberOfPersonnel_new);  
    COMMIT;
END;
--------------------------------------------------------
--  DDL for Procedure PROC_INSERT_EVALUATE_APL
--------------------------------------------------------
set define off;

  CREATE OR REPLACE NONEDITIONABLE PROCEDURE "PROC_INSERT_EVALUATE_APL" (companyNo_new EVALUATE_APL.companyNo%TYPE,
                                            	     applicantNo_new EVALUATE_APL.applicantNo%TYPE,
						     scheduleNo_new  EVALUATE_APL.interviewScheduleNo%TYPE,
                                                     mark_apl_new EVALUATE_APL.mark_apl%TYPE,
                                                     comment_apl_new EVALUATE_APL.comment_apl%TYPE)
AS
BEGIN
        INSERT INTO EVALUATE_APL
        VALUES(companyNo_new, applicantNo_new, scheduleNo_new, mark_apl_new, comment_apl_new);
        DBMS_OUTPUT.PUT_LINE('Them thanh cong!');
        COMMIT;
END;
--------------------------------------------------------
--  DDL for Procedure PROC_INSERT_EVALUATE_CO
--------------------------------------------------------
set define off;

  CREATE OR REPLACE NONEDITIONABLE PROCEDURE "PROC_INSERT_EVALUATE_CO" (companyNo_new EVALUATE_CO.companyNo%TYPE,
                                            	    applicantNo_new EVALUATE_CO.applicantNo%TYPE,
						    scheduleNo_new  EVALUATE_CO.interviewScheduleNo%TYPE,
                                                    mark_co_new EVALUATE_CO.mark_co%TYPE,
                                                    comment_co_new EVALUATE_CO.comment_co%TYPE)
AS
BEGIN
        INSERT INTO EVALUATE_CO
        VALUES(companyNo_new, applicantNo_new, scheduleNo_new, mark_co_new, comment_co_new);
        DBMS_OUTPUT.PUT_LINE('Them thanh cong!');
        COMMIT;
END;
--------------------------------------------------------
--  DDL for Procedure PROC_INSERT_HAVE
--------------------------------------------------------
set define off;

  CREATE OR REPLACE NONEDITIONABLE PROCEDURE "PROC_INSERT_HAVE" (skillName_new SKILL.skillName%TYPE,
                                            applicantNo_new HAVE.applicantNo%TYPE,
                                             level_apl_new HAVE.level_apl%TYPE,
                                             yearsOfExperience_new HAVE.yearsOfExperience%TYPE)
AS
    skillNo_new skill.skillno%type;
    flag number(1);
BEGIN
    select case 
        when exists (select * from skill where skillname = skillname_new)
        then 1
        else 0
    end into flag
    from dual;

    if flag =  0
    Then 
        proc_insert_skill(skillname_new);

        Select skillno into skillno_new 
        From skill where skillname = skillname_new;

        Insert into have values (skillno_new, applicantno_new, level_apl_new, yearsOfExperience_new);
    Else
        Select skillno into skillno_new 
        From skill where skillname = skillname_new;

        Insert into have values (skillno_new, applicantno_new, level_apl_new, yearsOfExperience_new);
    End if;
    COMMIT;
END;
--------------------------------------------------------
--  DDL for Procedure PROC_INSERT_INTERVIEWER
--------------------------------------------------------
set define off;

  CREATE OR REPLACE NONEDITIONABLE PROCEDURE "PROC_INSERT_INTERVIEWER" (v_interviewerName INTERVIEWER.interviewerName%TYPE,
                                                    v_phoneNumber INTERVIEWER.phoneNumber%TYPE,
                                                    v_gmail INTERVIEWER.gmail%TYPE,
                                                    v_companyNo INTERVIEWER.companyNo%TYPE,
                                                    v_accountID INTERVIEWER.accountID%TYPE)
AS
BEGIN
	IF v_companyNo = 0
	THEN
		INSERT INTO INTERVIEWER VALUES (seq_interviewid.nextval, v_interviewerName, v_phoneNumber, v_gmail, null, v_accountID);
	ELSE	
		INSERT INTO INTERVIEWER VALUES (seq_interviewid.nextval, v_interviewerName, v_phoneNumber, v_gmail, v_companyNo, v_accountID);
	END IF;
	COMMIT;
END;
--------------------------------------------------------
--  DDL for Procedure PROC_INSERT_INTERVIEW_SCHEDULE
--------------------------------------------------------
set define off;

  CREATE OR REPLACE NONEDITIONABLE PROCEDURE "PROC_INSERT_INTERVIEW_SCHEDULE" ( v_startTime interview_schedule.starttime%type,
                                                            v_endTime interview_schedule.endtime%type,
                                                            v_location INTERVIEW_SCHEDULE.location%TYPE,
                                                            v_status INTERVIEW_SCHEDULE.status%TYPE,
                                                            v_slot INTERVIEW_SCHEDULE.slot%TYPE,
                                                            v_interviewerNo INTERVIEW_SCHEDULE.interviewerNo%TYPE)
AS
BEGIN
    INSERT INTO INTERVIEW_SCHEDULE VALUES (seq_scheduleid.nextval,v_startTime, v_endTime , v_location , v_status , v_slot, v_interviewerNo);
    COMMIT;
END;
--------------------------------------------------------
--  DDL for Procedure PROC_INSERT_POSITION
--------------------------------------------------------
set define off;

  CREATE OR REPLACE NONEDITIONABLE PROCEDURE "PROC_INSERT_POSITION" ( PosName_New POSITION.PositionName%TYPE)
AS
BEGIN
        -- THEM DU LIEU MOI
        INSERT INTO POSITION(PositionNo, PositionName) 
        VALUES(seq_positionid.nextval,PosName_New);
        DBMS_OUTPUT.PUT_LINE('Them thanh cong!');
        COMMIT;
END;
--------------------------------------------------------
--  DDL for Procedure PROC_INSERT_POSITION_OF_RECRUIT
--------------------------------------------------------
set define off;

  CREATE OR REPLACE NONEDITIONABLE PROCEDURE "PROC_INSERT_POSITION_OF_RECRUIT" (companyNo_in RECRUIT.COMPANYNO%TYPE,
                                            departmentNo_in DEPARTMENT.DEPARTMENTNO%TYPE,
                                            positionName_new POSITION.POSITIONNAME%TYPE,
                                            numberOfPersonnel_new recruit.numberofpersonnel%TYPE)
AS
    positionNo_new position.positionNo%TYPE;
    flag_position number(1);
BEGIN
    select case 
        when exists (select * from position where positionname = positionName_new)
        then 1
        else 0
    end into flag_position
    from dual;

    if flag_position =  0
    Then 
        proc_insert_position(positionName_new);

        Select positionNo into positionNo_new
        From position where positionname = positionname_new;
    Else
        Select positionNo into positionNo_new
        From position where positionname = positionname_new;
    End if;

    Insert into recruit values (companyNo_in, departmentNo_in, positionNo_new, numberOfPersonnel_new);  
    COMMIT;
END;
--------------------------------------------------------
--  DDL for Procedure PROC_INSERT_RECRUIT
--------------------------------------------------------
set define off;

  CREATE OR REPLACE NONEDITIONABLE PROCEDURE "PROC_INSERT_RECRUIT" (CompanyNo_New Recruit.companyNo%TYPE,
                                                DepartNo_New Recruit.departmentNo%TYPE,
                                                PosNo_New Recruit.positionNo%TYPE,
                                                NoOfPerson Recruit.NumberOfPersonnel%TYPE)
IS
BEGIN
    INSERT INTO RECRUIT(companyNo, departmentNo, positionNo, numberofpersonnel)
    VALUES (CompanyNo_New, DepartNo_New, PosNo_New, NoOfPerson);
    DBMS_OUTPUT.PUT_LINE('Them thanh cong!');
    COMMIT;
END;
--------------------------------------------------------
--  DDL for Procedure PROC_INSERT_REGISTER
--------------------------------------------------------
set define off;

  CREATE OR REPLACE NONEDITIONABLE PROCEDURE "PROC_INSERT_REGISTER" (interviewScheduleNo_new REGISTER.interviewScheduleNo%TYPE,
                                                 applicantNo_new REGISTER.applicantNo%TYPE,
                                                 departmentNo_new REGISTER.departmentNo%TYPE,
                                                 positionNo_new REGISTER.positionNo%TYPE,
                                                 status_new REGISTER.status%TYPE)
AS
BEGIN
        INSERT INTO REGISTER
        VALUES(interviewScheduleNo_new, applicantNo_new, departmentNo_new, positionNo_new, status_new);
        DBMS_OUTPUT.PUT_LINE('Them thanh cong!');
        COMMIT;
END;
--------------------------------------------------------
--  DDL for Procedure PROC_INSERT_REQUIRE
--------------------------------------------------------
set define off;

  CREATE OR REPLACE NONEDITIONABLE PROCEDURE "PROC_INSERT_REQUIRE" (posNo REQUIRE.positionNo%TYPE,
                                                requireNo REQUIRE.requirementNo%TYPE,
                                                level_require REQUIRE.level_re%TYPE,
                                                YearExperience REQUIRE.yearsOfExperience%TYPE)
IS
BEGIN
    INSERT INTO REQUIRE (positionNo, requirementNo, level_re, yearsOfExperience)
    VALUES(posNo, requireNo, level_require, YearExperience);
    DBMS_OUTPUT.PUT_LINE('Them thanh cong!');
    COMMIT;
END;
--------------------------------------------------------
--  DDL for Procedure PROC_INSERT_REQUIREMENT
--------------------------------------------------------
set define off;

  CREATE OR REPLACE NONEDITIONABLE PROCEDURE "PROC_INSERT_REQUIREMENT" (requirement_Name REQUIREMENT.requirementName%TYPE)
IS
BEGIN
    INSERT INTO REQUIREMENT(requirementNo,requirementName)
    VALUES(seq_requirementid.NEXTVAL,requirement_Name);
    DBMS_OUTPUT.PUT_LINE('Them thanh cong!');
    COMMIT;
END;
--------------------------------------------------------
--  DDL for Procedure PROC_INSERT_SKILL
--------------------------------------------------------
set define off;

  CREATE OR REPLACE NONEDITIONABLE PROCEDURE "PROC_INSERT_SKILL" (v_skillName SKILL.skillName%TYPE)
AS
BEGIN
    INSERT INTO SKILL VALUES (seq_skillid.nextval, v_skillName);
    COMMIT;
END;
--------------------------------------------------------
--  DDL for Procedure PROC_UPDATE_ACCOUNT
--------------------------------------------------------
set define off;

  CREATE OR REPLACE NONEDITIONABLE PROCEDURE "PROC_UPDATE_ACCOUNT" (userName_OLD IN ACCOUNT.username%TYPE,
                                                userName_update IN ACCOUNT.username%TYPE,
                                                password_update ACCOUNT.password%TYPE,
                                                role_update ACCOUNT.role%TYPE)
AS
BEGIN
    UPDATE ACCOUNT
    SET userName = userName_update, password = password_update, role =role_update
    WHERE userName=userName_OLD;
    DBMS_OUTPUT.PUT_LINE('Cap nhat thanh cong!');
    COMMIT;
END;
--------------------------------------------------------
--  DDL for Procedure PROC_UPDATE_APPLICANT
--------------------------------------------------------
set define off;

  CREATE OR REPLACE NONEDITIONABLE PROCEDURE "PROC_UPDATE_APPLICANT" (  v_applicantNo APPLICANT.applicantNo%TYPE,
                                                    v_applicantName APPLICANT.applicantName%TYPE,
                                                    v_citizenID APPLICANT.citizenID%TYPE,
                                                    v_dateOfBirth APPLICANT.dateOfBirth%TYPE,
                                                    v_gender APPLICANT.gender%TYPE,
                                                    v_address APPLICANT.address%TYPE,
                                                    v_PHONENUMBER APPLICANT.PHONENUMBER%TYPE,
                                                    v_gmail APPLICANT.gmail%TYPE,
                                                    v_accountID APPLICANT.accountID%TYPE)
AS
BEGIN
    UPDATE APPLICANT
    SET applicantName = v_applicantName,
        citizenID = v_citizenID,
        dateOfBirth = v_dateOfBirth,
        gender = v_gender,
        address = v_address,
        PHONENUMBER = v_PHONENUMBER,
        gmail = v_gmail,
        accountID = v_accountID
    WHERE applicantNo = v_applicantNo;
    COMMIT;
END;
--------------------------------------------------------
--  DDL for Procedure PROC_UPDATE_BELONG
--------------------------------------------------------
set define off;

  CREATE OR REPLACE NONEDITIONABLE PROCEDURE "PROC_UPDATE_BELONG" (departmentNo_old belong.departmentno%TYPE,
                                                departmentNo_update belong.departmentno%TYPE,
                                                companyNo_update belong.companyno%TYPE)
AS
BEGIN
    UPDATE BELONG
    SET departmentNo= departmentNo_update, companyNo = companyNo_update
    WHERE departmentNo=departmentNo_old;
    DBMS_OUTPUT.PUT_LINE('Cap nhat thanh cong!');
    COMMIT;
END;
--------------------------------------------------------
--  DDL for Procedure PROC_UPDATE_COMP
--------------------------------------------------------
set define off;

  CREATE OR REPLACE NONEDITIONABLE PROCEDURE "PROC_UPDATE_COMP" (companyNo_old COMPANY.companyno%TYPE,
                                             companyName_update COMPANY.companyname%TYPE,
                                             address_update  company.address%TYPE,
                                             hotline_update company.hotline%TYPE,
                                             gmail_update COMPANY.gmail%TYPE,
                                             startDate_update COMPANY.startdate%TYPE,
                                             accountID_update company.accountid%TYPE)
AS
BEGIN
    UPDATE COMPANY
    SET companyName = companyName_update, address = address_update, hotline =hotline_update,gmail=gmail_update,startDate=startDate_update,accountID=accountID_update
    WHERE companyNo = companyNo_old;
    DBMS_OUTPUT.PUT_LINE('Cap nhat thanh cong!');
    COMMIT;
END;
--------------------------------------------------------
--  DDL for Procedure PROC_UPDATE_DEP
--------------------------------------------------------
set define off;

  CREATE OR REPLACE NONEDITIONABLE PROCEDURE "PROC_UPDATE_DEP" (departmentName_old department.departmentname%TYPE,
                                                departmentName_update department.departmentname%TYPE)
AS
BEGIN
    UPDATE DEPARTMENT
    SET departmentName= departmentName_update
    WHERE departmentName=departmentName_old;
    DBMS_OUTPUT.PUT_LINE('Cap nhat thanh cong!');
    COMMIT;
END;
--------------------------------------------------------
--  DDL for Procedure PROC_UPDATE_EVALUATE_APL
--------------------------------------------------------
set define off;

  CREATE OR REPLACE NONEDITIONABLE PROCEDURE "PROC_UPDATE_EVALUATE_APL" (companyNo_in EVALUATE_APL.companyNo%TYPE,
                                                     applicantNo_in EVALUATE_APL.applicantNo%TYPE,
						     scheduleNo_new  EVALUATE_APL.interviewScheduleNo%TYPE,
                                                     mark_apl_new EVALUATE_APL.mark_apl%TYPE,
                                                     comment_apl_new EVALUATE_APL.comment_apl%TYPE)
AS
BEGIN
        UPDATE EVALUATE_APL
        SET interviewScheduleNo = scheduleNo_new, mark_apl = mark_apl_new, comment_apl = comment_apl_new
        WHERE companyNo = companyNo_in and applicantNo = applicantNo_in;
        DBMS_OUTPUT.PUT_LINE('Sua thanh cong!');
        COMMIT;
END;
--------------------------------------------------------
--  DDL for Procedure PROC_UPDATE_EVALUATE_CO
--------------------------------------------------------
set define off;

  CREATE OR REPLACE NONEDITIONABLE PROCEDURE "PROC_UPDATE_EVALUATE_CO" (companyNo_in EVALUATE_CO.companyNo%TYPE,
                                            	    applicantNo_in EVALUATE_CO.applicantNo%TYPE,
						    scheduleNo_new  EVALUATE_CO.interviewScheduleNo%TYPE,
                                                    mark_co_new EVALUATE_CO.mark_co%TYPE,
                                                    comment_co_new EVALUATE_CO.comment_co%TYPE)
AS
BEGIN
        UPDATE EVALUATE_CO
        SET interviewScheduleNo = scheduleNo_new, mark_co = mark_co_new, comment_co = comment_co_new
        WHERE companyNo = companyNo_in and applicantNo = applicantNo_in;
        DBMS_OUTPUT.PUT_LINE('Sua thanh cong!');
        COMMIT;
END;
--------------------------------------------------------
--  DDL for Procedure PROC_UPDATE_HAVE
--------------------------------------------------------
set define off;

  CREATE OR REPLACE NONEDITIONABLE PROCEDURE "PROC_UPDATE_HAVE" (skillName_new SKILL.skillName%TYPE,
                                            applicantNo_in HAVE.applicantNo%TYPE,
                                             level_apl_new HAVE.level_apl%TYPE,
                                             yearsOfExperience_new HAVE.yearsOfExperience%TYPE)
AS
    skillNo_new SKILL.skillno%TYPE;
BEGIN
        select skillNo into skillNo_new
        from skill
        where skillname = skillname_new;

        UPDATE HAVE 
        SET level_apl = level_apl_new, yearsOfExperience = yearsOfExperience_new
        WHERE skillNo = skillNo_new and applicantNo = applicantNo_in;

        COMMIT;
END;
--------------------------------------------------------
--  DDL for Procedure PROC_UPDATE_INTERVIEWER
--------------------------------------------------------
set define off;

  CREATE OR REPLACE NONEDITIONABLE PROCEDURE "PROC_UPDATE_INTERVIEWER" (v_interviewerNo INTERVIEWER.interviewerNo%TYPE,
                                                    v_interviewerName INTERVIEWER.interviewerName%TYPE,
                                                    v_phoneNumber INTERVIEWER.phoneNumber%TYPE,
                                                    v_gmail INTERVIEWER.gmail%TYPE,
                                                    v_companyNo INTERVIEWER.companyNo%TYPE,
                                                    v_accountID INTERVIEWER.accountID%TYPE)
AS
BEGIN
    UPDATE INTERVIEWER
    SET interviewerName = v_interviewerName,
        phoneNumber = v_phoneNumber,
        gmail = v_gmail,
        companyNo = v_companyNo,
        accountID = v_accountID
    WHERE interviewerNo = v_interviewerNo;
    COMMIT;
END;
--------------------------------------------------------
--  DDL for Procedure PROC_UPDATE_INTERVIEW_SCHEDULE
--------------------------------------------------------
set define off;

  CREATE OR REPLACE NONEDITIONABLE PROCEDURE "PROC_UPDATE_INTERVIEW_SCHEDULE" ( v_interviewScheduleNo INTERVIEW_SCHEDULE.interviewScheduleNo%TYPE,
                                                            v_startTime interview_schedule.starttime%type,
                                                            v_endTime interview_schedule.endtime%type,
                                                            v_location INTERVIEW_SCHEDULE.location%TYPE,
                                                            v_status INTERVIEW_SCHEDULE.status%TYPE,
                                                            v_slot INTERVIEW_SCHEDULE.slot%TYPE,
                                                            v_interviewerNo INTERVIEW_SCHEDULE.interviewerNo%TYPE)
AS
BEGIN
    UPDATE INTERVIEW_SCHEDULE
    SET startTime = v_startTime,
        endTime = v_endTime,
        location = v_location,
        status = v_status,
        slot = v_slot,
        interviewerNo = v_interviewerNo
    WHERE interviewScheduleNo = v_interviewScheduleNo;
    COMMIT;
END;
--------------------------------------------------------
--  DDL for Procedure PROC_UPDATE_POSITION
--------------------------------------------------------
set define off;

  CREATE OR REPLACE NONEDITIONABLE PROCEDURE "PROC_UPDATE_POSITION" (PosNo_Old POSITION.PositionNo%TYPE,
                                            PosName_Update POSITION.PositionName%TYPE)
AS
BEGIN
    UPDATE POSITION 
    SET PositionName = PosName_Update
    WHERE PositionNo = PosNo_Old;
    DBMS_OUTPUT.PUT_LINE('Cap nhat thanh cong!');
    EXCEPTION WHEN no_data_found
    THEN
        DBMS_OUTPUT.PUT_LINE('Ma vi tri khong ton tai');
END;
--------------------------------------------------------
--  DDL for Procedure PROC_UPDATE_POSITION_OF_RECRUIT
--------------------------------------------------------
set define off;

  CREATE OR REPLACE NONEDITIONABLE PROCEDURE "PROC_UPDATE_POSITION_OF_RECRUIT" (companyNo_in RECRUIT.COMPANYNO%TYPE,
                                            departmentNo_in DEPARTMENT.DEPARTMENTNO%TYPE,
                                            positionName_in POSITION.POSITIONNAME%TYPE,
                                            numberOfPersonnel_new recruit.numberofpersonnel%TYPE)
AS
    positionNo_in position.positionNo%TYPE;
BEGIN
    Select positionNo into positionNo_in
    From position where positionname = positionname_in;

    UPDATE RECRUIT 
    SET numberOfPersonnel = numberOfPersonnel_new
    WHERE companyno = companyNo_in and departmentNo = departmentNo_in and positionNo = positionNo_in;
    COMMIT;
END;
--------------------------------------------------------
--  DDL for Procedure PROC_UPDATE_RECRUIT
--------------------------------------------------------
set define off;

  CREATE OR REPLACE NONEDITIONABLE PROCEDURE "PROC_UPDATE_RECRUIT" (CompanyNo_Old Recruit.companyNo%TYPE,
                                                DepartNo_Old RECRUIT.departmentNo%TYPE,
                                                PosNo_Old RECRUIT.positionNo%TYPE,
                                                DepartNo_Update RECRUIT.departmentNo%TYPE,
                                                PosNo_Update RECRUIT.positionNo%TYPE,
                                                NoOfPerson_Update Recruit.NumberOfPersonnel%TYPE)
IS
BEGIN
   UPDATE RECRUIT
   SET departmentNo = DepartNo_Update, positionNo = PosNo_Update, NumberOfPersonnel = NoOfPerson_Update
   WHERE CompanyNo = CompanyNo_Old AND departmentNo = DepartNo_Old AND positionNo = PosNo_Old;
   DBMS_OUTPUT.PUT_LINE('Cap nhat thanh cong');
END;
--------------------------------------------------------
--  DDL for Procedure PROC_UPDATE_REGISTER
--------------------------------------------------------
set define off;

  CREATE OR REPLACE NONEDITIONABLE PROCEDURE "PROC_UPDATE_REGISTER" (interviewScheduleNo_in REGISTER.interviewScheduleNo%TYPE,
                                                 applicantNo_in REGISTER.applicantNo%TYPE,
                                                 departmentNo_in REGISTER.departmentNo%TYPE,
                                                 positionNo_in REGISTER.positionNo%TYPE,
                                                 status_new REGISTER.status%TYPE)
AS
BEGIN
        UPDATE REGISTER
        SET status = status_new
        WHERE interviewScheduleNo = interviewScheduleNo_in and applicantNo = applicantNo_in and departmentNo = departmentNo_in
        and positionNo = positionNo_in;
        DBMS_OUTPUT.PUT_LINE('Sua thanh cong!');
        COMMIT;
END;
--------------------------------------------------------
--  DDL for Procedure PROC_UPDATE_REQUIRE
--------------------------------------------------------
set define off;

  CREATE OR REPLACE NONEDITIONABLE PROCEDURE "PROC_UPDATE_REQUIRE" (posNo_Old REQUIRE.positionNo%TYPE,
                                                requireNo_Old REQUIRE.requirementNo%TYPE,
                                                posNo_Update REQUIRE.positionNo%TYPE,
                                                requireNo_Update REQUIRE.requirementNo%TYPE,
                                                level_Update REQUIRE.level_re%TYPE,
                                                Year_Update REQUIRE.yearsOfExperience%TYPE)
IS
BEGIN

    UPDATE REQUIRE
    SET positionNo = posNo_Update, requirementNo = requireNo_Update, level_re = level_Update, 
        yearsOfExperience = Year_Update
    WHERE positionNo = posNo_Old AND requirementNo = requireNo_Old;
    DBMS_OUTPUT.PUT_LINE('Cap nhat thanh cong!');
    COMMIT;
END;
--------------------------------------------------------
--  DDL for Procedure PROC_UPDATE_REQUIREMENT
--------------------------------------------------------
set define off;

  CREATE OR REPLACE NONEDITIONABLE PROCEDURE "PROC_UPDATE_REQUIREMENT" (requirementNo_Old REQUIREMENT.requirementNo%TYPE,
                                                    requirementName_Update REQUIREMENT.requirementName%TYPE)
IS
BEGIN
    UPDATE REQUIREMENT
    SET requirementName = requirementName_Update 
    WHERE requirementNo = requirementNo_Old;
    DBMS_OUTPUT.PUT_LINE('Cap nhat thanh cong!');
    COMMIT;
END;
--------------------------------------------------------
--  DDL for Procedure PROC_UPDATE_SKILL
--------------------------------------------------------
set define off;

  CREATE OR REPLACE NONEDITIONABLE PROCEDURE "PROC_UPDATE_SKILL" (v_skillNo SKILL.skillNo%TYPE, v_skillName SKILL.skillName%TYPE)
AS
BEGIN
    UPDATE SKILL
    SET skillName = v_skillName
    WHERE skillNo = v_skillNo;
    COMMIT;
END;
--------------------------------------------------------
--  DDL for Procedure PRO_BELONG_COMPANY
--------------------------------------------------------
set define off;

  CREATE OR REPLACE NONEDITIONABLE PROCEDURE "PRO_BELONG_COMPANY" (companyNo_IN IN company.companyno%TYPE)
AS 
    -- Khoi tao con tro luu du lieu Ma Cong Ty voi dieu kien Ma Cong Ty = Ma Cong Ty truyen vao
    CURSOR C_COMPANY IS SELECT CompanyNo FROM COMPANY WHERE CompanyNo = companyNo_IN;
    Company_No company.companyno%TYPE;
BEGIN
    OPEN C_COMPANY;
    LOOP
        FETCH C_COMPANY INTO Company_No;
        EXIT WHEN C_COMPANY%NOTFOUND;

        DBMS_OUTPUT.PUT_LINE('Ma cong ty: ' || companyNo_IN);

        DECLARE
            -- Khoi tao con tro thu hai luu ma va ten phong ban 
            -- Dieu kien: Ma cong ty cua phong ban duoc luu boi con tro 2 phai bang ma cong ty cua con tro o tren
            CURSOR C_DEPARTMENT IS SELECT D.DepartmentNo, D.DepartmentName
                                   FROM COMPANY C JOIN BELONG B ON C.CompanyNo = B.CompanyNo
                                                  JOIN DEPARTMENT D ON B.DepartmentNo = D.DepartmentNo
                                   WHERE C.CompanyNo = Company_No;
            Depart_No DEPARTMENT.DepartmentNo%TYPE;
            Depart_Name DEPARTMENT.DepartmentName%TYPE;
        BEGIN
            OPEN C_DEPARTMENT;
            LOOP 
                FETCH C_DEPARTMENT INTO Depart_No, Depart_Name;
                EXIT WHEN C_DEPARTMENT%NOTFOUND;

                IF C_DEPARTMENT%FOUND THEN

                    DBMS_OUTPUT.PUT_LINE('Ma phong ban: ' || Depart_No);
                    DBMS_OUTPUT.PUT_LINE('Ten phong ban: ' || Depart_Name);

                END IF;
            END LOOP;
            CLOSE C_DEPARTMENT;
        END;

    END LOOP;
    CLOSE C_COMPANY;

END;
