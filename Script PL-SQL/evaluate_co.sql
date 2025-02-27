--Tao bang EVALUATE_CO 
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

--Khoa chinh
ALTER TABLE EVALUATE_CO ADD CONSTRAINT PK_EVALUATE_CO PRIMARY KEY (companyNo, applicantNo,interviewScheduleNo);

--Khoa ngoai
ALTER TABLE EVALUATE_CO ADD CONSTRAINT FK1_EVALUATE_CO FOREIGN KEY (companyNo) REFERENCES COMPANY (companyNo);
ALTER TABLE EVALUATE_CO ADD CONSTRAINT FK2_EVALUATE_CO FOREIGN KEY (applicantNo) REFERENCES APPLICANT (applicantNo);
ALTER TABLE EVALUATE_CO ADD CONSTRAINT FK3_EVALUATE_CO FOREIGN KEY (interviewScheduleNo) REFERENCES INTERVIEW_SCHEDULE (interviewScheduleNo);

--Du lieu
Insert into EVALUATE_CO (COMPANYNO,APPLICANTNO,INTERVIEWSCHEDULENO,MARK_CO,COMMENT_CO) values (6,5,5,4,'Công ty uy tín');
Insert into EVALUATE_CO (COMPANYNO,APPLICANTNO,INTERVIEWSCHEDULENO,MARK_CO,COMMENT_CO) values (1,6,5,3,'Công ty hỏi đúng trọng tâm công việc nhưng còn hơi sơ sài');
Insert into EVALUATE_CO (COMPANYNO,APPLICANTNO,INTERVIEWSCHEDULENO,MARK_CO,COMMENT_CO) values (2,5,5,5,'Thông tin công việc đầy đủ');
Insert into EVALUATE_CO (COMPANYNO,APPLICANTNO,INTERVIEWSCHEDULENO,MARK_CO,COMMENT_CO) values (3,3,2,5,'Công ty uy tín, đáng để làm việc');
Insert into EVALUATE_CO (COMPANYNO,APPLICANTNO,INTERVIEWSCHEDULENO,MARK_CO,COMMENT_CO) values (4,5,2,4,'Tuyệt vời');
