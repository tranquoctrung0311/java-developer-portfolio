/*=======================================================================================================================================================*/
/*									PROCEDURE								 	 */
/*=======================================================================================================================================================*/
--------------------------------------------------------
--  Procedure FIND_APPLICANT
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
--  Procedure FIND_COMPANY
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
--  Procedure FIND_EVALUATE_APPLICANT
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
--  Procedure FIND_EVALUATE_COMPANY
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
--  Procedure FIND_INTERVIEWER
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
--  Procedure HUY_LICH
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
--  Procedure PROC_APPLICANT_SKILL
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
--  Procedure PROC_COMPANY_RECRUIT
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
--  Procedure PROC_DELETE_ACCOUNT
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
--  Procedure PROC_DELETE_APPLICANT
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
--  Procedure PROC_DELETE_COMP
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
--  Procedure PROC_DELETE_DEP
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
--  Procedure PROC_DELETE_DEPARTMENT_OF_RECRUIT
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
--  Procedure PROC_DELETE_EVALUATE_APL
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
--  Procedure PROC_DELETE_EVALUATE_CO
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
--  Procedure PROC_DELETE_HAVE
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
--  Procedure PROC_DELETE_INTERVIEWER
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
--  Procedure PROC_DELETE_INTERVIEW_SCHEDULE
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
--  Procedure PROC_DELETE_POSITION
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
--  Procedure PROC_DELETE_POSITION_OF_RECRUIT
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
--  Procedure PROC_DELETE_RECRUIT
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
--  Procedure PROC_DELETE_REGISTER
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
--  Procedure PROC_DELETE_REQUIRE
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
--  Procedure PROC_DELETE_REQUIREMENT
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
--  Procedure PROC_DELETE_SKILL
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
--  Procedure PROC_DELETE_SKILLT
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
--  Procedure PROC_INSERT_ACCOUNT
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
--  Procedure PROC_INSERT_APPLICANT
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
--  Procedure PROC_INSERT_BELONG
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
--  Procedure PROC_INSERT_COMP
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
--  Procedure PROC_INSERT_DEP
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
--  Procedure PROC_INSERT_DEPARTMENT_OF_RECRUIT
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
--  Procedure PROC_INSERT_EVALUATE_APL
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
--  Procedure PROC_INSERT_EVALUATE_CO
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
--  Procedure PROC_INSERT_HAVE
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
--  Procedure PROC_INSERT_INTERVIEWER
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
--  Procedure PROC_INSERT_INTERVIEW_SCHEDULE
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
--  Procedure PROC_INSERT_POSITION
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
--  Procedure PROC_INSERT_POSITION_OF_RECRUIT
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
--  Procedure PROC_INSERT_RECRUIT
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
--  Procedure PROC_INSERT_REGISTER
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
--  Procedure PROC_INSERT_REQUIRE
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
--  Procedure PROC_INSERT_REQUIREMENT
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
--  Procedure PROC_INSERT_SKILL
--------------------------------------------------------
set define off;

  CREATE OR REPLACE NONEDITIONABLE PROCEDURE "PROC_INSERT_SKILL" (v_skillName SKILL.skillName%TYPE)
AS
BEGIN
    INSERT INTO SKILL VALUES (seq_skillid.nextval, v_skillName);
    COMMIT;
END;
--------------------------------------------------------
--  Procedure PROC_UPDATE_ACCOUNT
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
--  Procedure PROC_UPDATE_APPLICANT
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
--  Procedure PROC_UPDATE_BELONG
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
--  Procedure PROC_UPDATE_COMP
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
--  Procedure PROC_UPDATE_DEP
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
--  Procedure PROC_UPDATE_EVALUATE_APL
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
--  Procedure PROC_UPDATE_EVALUATE_CO
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
--  Procedure PROC_UPDATE_HAVE
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
--  Procedure PROC_UPDATE_INTERVIEWER
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
--  Procedure PROC_UPDATE_INTERVIEW_SCHEDULE
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
--  Procedure PROC_UPDATE_POSITION
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
--  Procedure PROC_UPDATE_POSITION_OF_RECRUIT
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
--  Procedure PROC_UPDATE_RECRUIT
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
--  Procedure PROC_UPDATE_REGISTER
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
--  Procedure PROC_UPDATE_REQUIRE
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
--  Procedure PROC_UPDATE_REQUIREMENT
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
--  Procedure PROC_UPDATE_SKILL
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
--  Procedure PRO_BELONG_COMPANY
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
