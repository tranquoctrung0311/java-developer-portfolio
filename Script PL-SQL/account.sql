-- Tao bang ACCOUNT
CREATE TABLE ACCOUNT (
	accountID	NUMBER NOT NULL,
	userName	VARCHAR2(20) NOT NULL UNIQUE,
	password	VARCHAR2(50) NOT NULL,
	role	 	VARCHAR2(20) NOT NULL,
	linkimage	VARCHAR2(1000) 
);

--Khoa chinh
ALTER TABLE ACCOUNT ADD CONSTRAINT PK_ACC PRIMARY KEY (AccountID);

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
