/*=======================================================================================================================================================*/
/*									TRIGGER									 	 */
/*=======================================================================================================================================================*/
--------------------------------------------------------
--  Trigger CANCEL_SCHEDULE
--------------------------------------------------------

CREATE OR REPLACE TRIGGER "CANCEL_SCHEDULE" 
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

--------------------------------------------------------
--  Trigger INTERVIEW_SLOT
--------------------------------------------------------

CREATE OR REPLACE TRIGGER "INTERVIEW_SLOT" 
BEFORE INSERT OR UPDATE
ON INTERVIEW_SCHEDULE
FOR EACH ROW
BEGIN    
    IF (:NEW.slot > 20)
    THEN
        RAISE_APPLICATION_ERROR(-20000, 'MOT LICH CHI CO TOI DA 20 UNG VIEN');
    END IF;
END;

--------------------------------------------------------
--  Trigger REGISTINTERVIEW_CHECKDATE
--------------------------------------------------------

CREATE OR REPLACE TRIGGER "REGISTINTERVIEW_CHECKDATE" 
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

--------------------------------------------------------
--  Trigger REGISTINTERVIEW_CHECKPOINT
--------------------------------------------------------

CREATE OR REPLACE TRIGGER "REGISTINTERVIEW_CHECKPOINT" 
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

--------------------------------------------------------
--  Trigger TRIGGER_INTERVIEW_TIME_INTERVIEWSHCEDULE
--------------------------------------------------------

CREATE OR REPLACE TRIGGER "TRIGGER_INTERVIEW_TIME_INTERVIEWSHCEDULE" 
AFTER INSERT OR UPDATE
ON INTERVIEW_SCHEDULE
FOR EACH ROW
BEGIN
	IF ((:NEW.ENDTIME - :NEW.STARTTIME)/365 < 0) THEN
        Raise_Application_Error(-20011, 'THOI GIAN KET THUC KHONG THE BE HON THOI GIAN BAT DAU');
    END IF;
END;

--------------------------------------------------------
--  Trigger TRIGGER_MINUS_REGIS_SLOT
--------------------------------------------------------

CREATE OR REPLACE TRIGGER "TRIGGER_MINUS_REGIS_SLOT" 
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

--------------------------------------------------------
--  Trigger TRIGGER_SCHEDULE_NOTSAME_INTERVIEWSCHEDULE
--------------------------------------------------------

CREATE OR REPLACE TRIGGER "TRIGGER_SCHEDULE_NOTSAME_INTERVIEWSCHEDULE" 
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

--------------------------------------------------------
--  Trigger trigger_status_register
--------------------------------------------------------

CREATE OR REPLACE TRIGGER "trigger_status_register" 
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
