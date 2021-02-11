drop table teachers;
drop table managers;
drop table centers;
drop table students;
drop table aux;
drop table subjects;
drop table meetings;
drop table info;
drop table info2;
drop table pers;
drop sequence teacher_id_seq;
drop sequence center_id_seq;
drop sequence subject_id_seq;
drop sequence meeting_id_seq;
drop sequence student_id_seq;
drop sequence manager_id_seq;

CREATE TABLE MANAGERS(
    MANAGER_ID NUMBER(3),
    first_name varchar2(20),
    last_name  varchar2(30),
    phone_number varchar(12),
    email varchar(30),
    PRIMARY KEY (MANAGER_ID)
    );

create table centers(
    center_id number(2),
    postal_code number(7),
    city varchar2(30) ,
    street varchar2(30),
    manager_id number(2),
    primary key (center_id),
    foreign key (manager_id) references managers(manager_id)
    );
    
    

create table students(
    student_id number(3),
    first_name varchar2(20),
    last_name  varchar2(30),
    phone_number varchar(12),
    email varchar(30),
    primary key (student_id)
    );
    

create table teachers(
    teacher_id number(3),
    first_name varchar2(20),
    last_name  varchar2(30),
    phone_number varchar(12),
    email varchar(30),
    hire_date date,
    center_id number(3),
    primary key (teacher_id),
    FOREIGN KEY (center_id) REFERENCES centers(center_id)
                     );
   
create table subjects(
    subject_id number(2),
    subject_name varchar2(30),
    meeting_price number(2),
    primary key (subject_id)
    );
    

create table aux(
    day varchar2(11),
    primary key (day)
    );
    
create table meetings(
    meeting_id number(3),
    subject_id number(2),
    student_id number(3),
    teacher_id number(3),
    day varchar(11),
    start_at varchar(5), 
    FOREIGN KEY (student_id) REFERENCES students(student_id),
    FOREIGN KEY (teacher_id) REFERENCES teachers(teacher_id),
    FOREIGN KEY (subject_id) REFERENCES subjects(subject_id),
    FOREIGN KEY (day) references aux(day)
    );


CREATE SEQUENCE teacher_id_seq START WITH 1 increment by 1;
CREATE SEQUENCE center_id_seq START WITH 1 increment by 1;
create sequence meeting_id_seq start with 1 increment by 1;
create sequence subject_id_seq start with 1 increment by 1;
create sequence student_id_seq start with 1 increment by 1;
CREATE SEQUENCE MANAGER_ID_SEQ START WITH 1 INCREMENT BY 1;


INSERT INTO MANAGERS VALUES (MANAGER_ID_SEQ.NEXTVAL,'CLAIRE','BROOK','0785395410','clairebrook@email.com');
INSERT INTO MANAGERS VALUES (MANAGER_ID_SEQ.NEXTVAL,'JOHN','BROWN','0745892012','johnbrown@email.com');
INSERT INTO MANAGERS VALUES (MANAGER_ID_SEQ.NEXTVAL,'THERESA','MUND','0762010365','theresamund@email.com');
INSERT INTO MANAGERS VALUES (MANAGER_ID_SEQ.NEXTVAL,'MELINDA','WALTER','0748901202','melindawalter@email.com');
INSERT INTO MANAGERS VALUES (MANAGER_ID_SEQ.NEXTVAL,'ROBERT','ZANE','0785223658','robertzane@email.com');
INSERT INTO MANAGERS VALUES (MANAGER_ID_SEQ.NEXTVAL,'Kate','Peralta','0778545668','kateperalta@email.com');

select * from managers;

insert into centers values (center_id_seq.nextval,127324,'New York','Maiden Lane',1);
insert into centers values (center_id_seq.nextval,124856,'Chicago','Prairie Avenue',2);
insert into centers values (center_id_seq.nextval,138453,'Los Angeles','Sunset Boulevard',3);
insert into centers values (center_id_seq.nextval,178513,'Miami','Montgomery Street',4);
insert into centers values (center_id_seq.nextval,178963,'Seattle','First Avenue',5);
insert into centers values (center_id_seq.nextval,134532,'San Francisco','Lombard Street',6);

select * from centers;

insert into teachers values (teacher_id_seq.nextval,'Susan','Connor','0761714909','susanconnor@email.com',to_date('2018-02-23','yyyy-mm-dd'),1);   
insert into teachers values (teacher_id_seq.nextval,'Margaret','Adelman','0765466544','margaretadelman@email.com',to_date('2018-07-13','yyyy-mm-dd'),1);
insert into teachers values (teacher_id_seq.nextval,'Christinne','Novak','0762321239','christinnenovak@email.com',to_date('2017-05-21','yyyy-mm-dd'),5);
insert into teachers values (teacher_id_seq.nextval,'Jeff','Johnsonn','0752354100','jeffjohnsonn@email.com',to_date('2019-03-23','yyyy-mm-dd'),3);
insert into teachers values (teacher_id_seq.nextval,'Melvis','Forbin','0754213200','melvisforbin@email.com',to_date('2020-08-23','yyyy-mm-dd'),4);
insert into teachers values (teacher_id_seq.nextval,'Mike','James','0754254330','mikejames@email.com','23-JUN-20',2);
insert into teachers values (teacher_id_seq.nextval,'Elena','Miller','0758525850','elenamiller@email.com','23-JAN-19',6);        

select * from teachers; 
insert into subjects values (subject_id_seq.nextval,'English',20);
insert into subjects values (subject_id_seq.nextval,'Mathematics',25);
insert into subjects values (subject_id_seq.nextval,'Chemistry',25);
insert into subjects values (subject_id_seq.nextval,'Economics',25);

select * from subjects;

insert into aux values('Monday');
insert into aux values('Tuesday');
insert into aux values('Wednesday');
insert into aux values('Thursday');
insert into aux values('Friday');
insert into aux values('Saturday');
insert into aux values('Sunday');

select * from aux;

insert into students values(student_id_seq.nextval,'Nicole','Green','0741258962','nicolegreen@email.com');
insert into students values(student_id_seq.nextval,'Lena','Smith','075896325','lenasmith@email.com');
insert into students values(student_id_seq.nextval,'Paul','Miller','0786523698','paulmiller@email.com');
insert into students values(student_id_seq.nextval,'David','King','0784210025','davidking@email.com');
insert into students values(student_id_seq.nextval,'Emma','Jones','0725002510','emmajones@email.com');
insert into students values(student_id_seq.nextval,'Ashley','HILL','0727852150','ashleyhill@email.com');
insert into students values(student_id_seq.nextval,'BETTY','GRACE','0728521422','bettygrace@email.com');

select * from students;

insert into meetings values(meeting_id_seq.nextval,1,3,1,'Monday','14:00');
insert into meetings values(meeting_id_seq.nextval,2,1,3,'Wednesday','14:00');
insert into meetings values(meeting_id_seq.nextval,2,2,2,'Monday','13:30');
insert into meetings values(meeting_id_seq.nextval,3,3,4,'Tuesday','15:00');
insert into meetings values(meeting_id_seq.nextval,3,4,1,'Sunday','11:00');
insert into meetings values(meeting_id_seq.nextval,4,4,1,'Tuesday','09:00');
insert into meetings values(meeting_id_seq.nextval,1,2,2,'Friday','09:30');
insert into meetings values(meeting_id_seq.nextval,4,1,3,'Thursday','16:30');
insert into meetings values(meeting_id_seq.nextval,2,6,7,'Thursday','16:00');
insert into meetings values(meeting_id_seq.nextval,2,7,7,'Thursday','12:00');


  
select * from managers;
select * from centers;
select * from teachers;    
select * from students;
select * from subjects;
select * from aux;
select * from meetings;

       

create table info2(
    "Numar sedinte" number(3),
    eroare varchar(60)
    );



create table info(
    "Numar elevi" number(3),
    eroare varchar(60)
    );




--Functions:


set serveroutput on;
--6 
create or replace FUNCTION f6_anb (
    oras centers.city%TYPE
) RETURN NUMBER AS
    numar NUMBER;
    oras_inexistent EXCEPTION;
    elevi_inexistenti EXCEPTION;
BEGIN
    SELECT
        COUNT(city)
    INTO numar
    FROM
        centers
    WHERE
        city = oras;

    IF numar = 0 THEN
        RAISE  oras_inexistent;
    END IF;
    SELECT
        COUNT(s.last_name)
    INTO numar
    FROM
        students   s
        JOIN meetings   m ON ( s.student_id = m.student_id )
        JOIN teachers   t ON ( m.teacher_id = t.teacher_id )
        JOIN centers    c ON ( t.center_id = c.center_id )
    WHERE
        c.city = oras;
    IF ( numar = 0 ) THEN
        RAISE elevi_inexistenti;
    END IF;
    SELECT 
        count(distinct s.last_name)
    INTO numar
    FROM
        students   s
        JOIN meetings   m ON ( s.student_id = m.student_id )
        JOIN teachers   t ON ( m.teacher_id = t.teacher_id )
        JOIN centers    c ON ( t.center_id = c.center_id )
    WHERE
        city = oras
        AND (
            SELECT
                COUNT(meeting_id)
            FROM
                meetings mm
            WHERE
                mm.student_id = s.student_id
        ) >= 2;

    INSERT INTO info VALUES (
        numar,
        NULL
    );

    RETURN numar;
EXCEPTION
    WHEN oras_inexistent THEN
        INSERT INTO info VALUES (
            0,
            'Nu exista orasul dat'
        );

        COMMIT;
        raise_application_error(-20000, 'There is no center in this city');
    WHEN elevi_inexistenti THEN
        INSERT INTO info VALUES (
            0, 
            'Nu exista elevi in orasul dat'
        );

        COMMIT;
        raise_application_error(-20001, 'There are no students in this city');
    WHEN OTHERS THEN
        INSERT INTO info VALUES (
            0,
            'Alta eroare'
        );

        COMMIT;
        raise_application_error(-20002, 'Another error');
END;
/

begin
    DBMS_OUTPUT.PUT_LINE(f6_ANB('New York'));
end;
/

begin
    DBMS_OUTPUT.PUT_LINE(f6_ANB('Oxford'));
end;
/


begin
    DBMS_OUTPUT.PUT_LINE(f6_ANB('Miami'));
end;
/

select * from
info;

delete from info;

--7 
CREATE OR REPLACE PROCEDURE p7_ANB(v_day aux.day%type)
IS
    CURSOR meeting IS
        SELECT meeting_id, student_id, m.teacher_id, subject_id, c.center_id
        FROM meetings m join teachers t on (m.teacher_id = t.teacher_id)
                        join centers  c on (t.center_id  = c.center_id) 
        Where v_day = m.day;
         nr number(2);
         nicio_sedinta EXCEPTION;
         zi_inexistenta EXCEPTION;
 

         
BEGIN
        nr:=0;
        SELECT COUNT(v_day)
         INTO nr
        FROM aux
        WHERE v_day = day;
        
        if nr = 0 then
            raise zi_inexistenta;
        end if;
        nr:=0;
        FOR i in meeting LOOP
            DBMS_OUTPUT.PUT_LINE('Meeting id: ' || i.meeting_id);
            DBMS_OUTPUT.PUT_LINE('Teacher: ' || i.teacher_id );
            DBMS_OUTPUT.PUT_LINE('Student: ' || i.student_id );
            DBMS_OUTPUT.PUT_LINE('Subject: ' ||i.subject_id);
            DBMS_OUTPUT.PUT_LINE('Center: ' || i.center_id);
            DBMS_OUTPUT.NEW_LINE();
            nr:=nr+1;
        END LOOP;
        if nr = 0 then
            raise nicio_sedinta;
        end if;
        
        EXCEPTION
    WHEN nicio_sedinta THEN
            raise_application_error(-20003, 'No meetings on this day');
    WHEN zi_inexistenta THEN
            raise_application_error(-20004, 'This day does not exist');
    WHEN OTHERS THEN
        raise_application_error(-20005, 'Another error');
        
END;
/

begin
    p7_ANB('Luni');
end;
/
begin
    p7_ANB('Monday');
end;
/
begin
    p7_ANB('Saturday');
end;
/

set serveroutput on;


--8


create or replace function f8_ANB(id teachers.teacher_id%type)
    RETURN number AS
    numar NUMBER;
    profesor_inexistent EXCEPTION;
    elevi_inexistenti EXCEPTION;
BEGIN
    select count(teacher_id)
    into numar 
    from teachers
    where teacher_id = id;
    
    if numar = 0 then
        raise profesor_inexistent;
    end if;

    select count(distinct s.student_id)
    into numar
    from students s 
    join meetings m on (s.student_id = m.student_id)
    join teachers t on (t.teacher_id = m.teacher_id)
    where t.teacher_id = id;
    
    if numar = 0 then
        raise elevi_inexistenti;
    end if;
    insert into info2 values ( numar,NULL);
    commit;    
    return numar;
    
    EXCEPTION
    WHEN profesor_inexistent THEN
        INSERT INTO info2 VALUES (
            0,
            'Nu exista profesorul cu id-ul dat'
        );
        COMMIT;
        raise_application_error(-20006, 'This teacher doesn''t exist');
    WHEN elevi_inexistenti THEN
        INSERT INTO info2 VALUES (
            0, 
            'Profesorul nu are sedinte'
        );

        COMMIT;
        raise_application_error(-20007, 'This teacher has no meetings');
    WHEN OTHERS THEN
        INSERT INTO info2 VALUES (
            0,
            'Alta eroare'
        );
        COMMIT;
        raise_application_error(-20008, 'Another error');
END;
/
    
   

begin
    DBMS_OUTPUT.PUT_LINE(f8_ANB(1));
end;
/

begin
    DBMS_OUTPUT.PUT_LINE(f8_ANB(8));
end;
/
begin
    DBMS_OUTPUT.PUT_LINE(f8_ANB(5));
end;
/

select * from info2;



--9

set serveroutput on;

create or replace procedure p9_ANB(v_id managers.manager_id%type, v_day aux.day%type)
IS
    CURSOR meets IS
        SELECT meeting_id, (ss.first_name ||' ' || ss.last_name) as Student,(t.first_name ||' '||t.last_name) as Teacher,s.subject_name,m.subject_id
        FROM meetings m join teachers t on (m.teacher_id = t.teacher_id)
                        join centers  c on (t.center_id  = c.center_id)
                        join managers mg on (c.manager_id = mg.manager_id)
                        join subjects s on (s.subject_id = m.subject_id)
                        join students ss on (m.student_id = ss.student_id)
                        
        Where v_day = m.day and mg.manager_id = v_id;
        nr number(2);
        nicio_sedinta EXCEPTION;
        manager_inexistent EXCEPTION;
        zi_inexistenta  EXCEPTION;
BEGIN      
        SELECT COUNT(v_day)
        INTO nr
        FROM aux
        WHERE v_day = day;
        
        
        
        if nr = 0 then
            raise zi_inexistenta;
        end if;
        
        SELECT COUNT(manager_id)
        into nr
        from managers
        where manager_id = v_id;
        
        if nr = 0 then
            raise manager_inexistent;
        end if;
        
        nr:=0;
        for i in meets loop 
            DBMS_OUTPUT.PUT_LINE('Meeting id: ' || i.meeting_id);
            DBMS_OUTPUT.PUT_LINE('Teacher: ' || i.Student );
            DBMS_OUTPUT.PUT_LINE('Student: ' || i.Teacher );
            DBMS_OUTPUT.PUT_LINE('Subject: ' ||i.subject_name);
            DBMS_OUTPUT.NEW_LINE();
            nr:=nr+1;
        END LOOP;
        
        if nr = 0 then
            raise nicio_sedinta;
        end if;
            
        Exception
        WHEN nicio_sedinta THEN
            raise_application_error(-20009, 'No meetings found');
        WHEN zi_inexistenta THEN
            raise_application_error(-20010, 'This day does not exist');
        WHEN manager_inexistent then
            raise_application_error(-20011,'No manager has this id');
        WHEN OTHERS THEN
            raise_application_error(-20012, 'Another error');

END;
/

BEGIN
    p9_ANB(2,'Sunday');
end;
/

BEGIN
    p9_ANB(1,'Monday');
end;
/

BEGIN
    p9_ANB(8,'Friday');
end;
/

BEGIN
    p9_ANB(2,'Vineri');
end;
/


--10

CREATE OR REPLACE TRIGGER trig10
 BEFORE INSERT OR UPDATE OR DELETE ON meetings
BEGIN
IF (TO_CHAR(SYSDATE,'D') = 1)
 OR (TO_CHAR(sysdate,'D') = 5)
 OR (TO_CHAR(SYSDATE,'HH24') NOT BETWEEN 8 AND 20)
THEN
RAISE_APPLICATION_ERROR(-20013,'Can''t update this table now');
END IF;
END;
/
DROP TRIGGER trig10;

insert into meetings 
values(meeting_id_seq.nextval,2,7,7,'Thursday','12:00');



--11

CREATE OR REPLACE TRIGGER trig11
 BEFORE UPDATE OF start_at ON meetings
 FOR EACH ROW
BEGIN
 IF (to_char(:NEW.start_at) < '08:00') then
        RAISE_APPLICATION_ERROR(-20012,'Meeting can''t start at this time');        
END IF;

 IF (to_char(:NEW.start_at) > '18:00') then
        RAISE_APPLICATION_ERROR(-20013,'Meeting can''t start at this time');        
END IF;
END;
/

UPDATE MEETINGS
SET START_AT = '00:00'
WHERE MEETING_ID = 8;

DROP TRIGGER trig11;

--12

CREATE OR REPLACE TRIGGER trig12
BEFORE ALTER OR CREATE OR DROP ON schema
BEGIN
IF USER <> UPPER('manager') THEN
    RAISE_APPLICATION_ERROR(-20014,'You  don''t have the right to  modify, create or delete tables');
end if;
END;
/

drop trigger trig12;

create table ex(nr number);







--13



CREATE OR REPLACE PACKAGE package13 AS
    FUNCTION f6 (
        oras centers.city%TYPE
    ) RETURN NUMBER;

    PROCEDURE p7 (
        v_day aux.day%TYPE
    );

    FUNCTION f8 (
        id teachers.teacher_id%TYPE
    ) RETURN NUMBER;

    PROCEDURE p9 (
        v_id    managers.manager_id%TYPE,
        v_day   aux.day%TYPE
    );
END package13;
/

CREATE OR REPLACE PACKAGE BODY package13 as
    FUNCTION f6 (
        oras centers.city%TYPE
    ) RETURN NUMBER AS
        numar NUMBER;
        oras_inexistent EXCEPTION;
        elevi_inexistenti EXCEPTION;
    BEGIN
        SELECT
            COUNT(city)
        INTO numar
        FROM
            centers
        WHERE
            city = oras;

        IF numar = 0 THEN
            RAISE oras_inexistent;
        END IF;
        SELECT
            COUNT(s.last_name)
        INTO numar
        FROM
            students   s
            JOIN meetings   m ON ( s.student_id = m.student_id )
            JOIN teachers   t ON ( m.teacher_id = t.teacher_id )
            JOIN centers    c ON ( t.center_id = c.center_id )
        WHERE
            c.city = oras;

        IF ( numar = 0 ) THEN
            RAISE elevi_inexistenti;
        END IF;
        SELECT
            COUNT(DISTINCT s.last_name)
        INTO numar
        FROM
            students   s
            JOIN meetings   m ON ( s.student_id = m.student_id )
            JOIN teachers   t ON ( m.teacher_id = t.teacher_id )
            JOIN centers    c ON ( t.center_id = c.center_id )
        WHERE
            city = oras
            AND (
                SELECT
                    COUNT(meeting_id)
                FROM
                    meetings mm
                WHERE
                    mm.student_id = s.student_id
            ) >= 2;

        INSERT INTO info VALUES (
            numar,
            NULL
        );

        RETURN numar;
    EXCEPTION
        WHEN oras_inexistent THEN
            INSERT INTO info VALUES (
                0,
                'Nu exista orasul dat'
            );

            COMMIT;
            raise_application_error(-20000, 'There is no center in this city');
        WHEN elevi_inexistenti THEN
            INSERT INTO info VALUES (
                0,
                'Nu exista elevi in orasul dat'
            );

            COMMIT;
            raise_application_error(-20001, 'There are no students in this city');
        WHEN OTHERS THEN
            INSERT INTO info VALUES (
                0,
                'Alta eroare'
            );

            COMMIT;
            raise_application_error(-20002, 'Another error');
    END f6;

    PROCEDURE p7 (
        v_day aux.day%TYPE
    ) IS

        CURSOR meeting IS
        SELECT
            meeting_id,
            student_id,
            m.teacher_id,
            subject_id,
            c.center_id
        FROM
            meetings   m
            JOIN teachers   t ON ( m.teacher_id = t.teacher_id )
            JOIN centers    c ON ( t.center_id = c.center_id )
        WHERE
            v_day = m.day;

        nr NUMBER(2);
        nicio_sedinta EXCEPTION;
        zi_inexistenta EXCEPTION;
    BEGIN
        nr := 0;
        SELECT
            COUNT(v_day)
        INTO nr
        FROM
            aux
        WHERE
            v_day = day;

        IF nr = 0 THEN
            RAISE zi_inexistenta;
        END IF;
        nr := 0;
        FOR i IN meeting LOOP
            dbms_output.put_line('Meeting id: ' || i.meeting_id);
            dbms_output.put_line('Teacher: ' || i.teacher_id);
            dbms_output.put_line('Student: ' || i.student_id);
            dbms_output.put_line('Subject: ' || i.subject_id);
            dbms_output.put_line('Center: ' || i.center_id);
            dbms_output.new_line();
            nr := nr + 1;
        END LOOP;

        IF nr = 0 THEN
            RAISE nicio_sedinta;
        END IF;
    EXCEPTION
        WHEN nicio_sedinta THEN
            raise_application_error(-20003, 'No meetings on this day');
        WHEN zi_inexistenta THEN
            raise_application_error(-20004, 'This day does not exist');
        WHEN OTHERS THEN
            raise_application_error(-20005, 'Another error');
    END p7;

    FUNCTION f8 (
        id teachers.teacher_id%TYPE
    ) RETURN NUMBER AS
        numar NUMBER;
        profesor_inexistent EXCEPTION;
        elevi_inexistenti EXCEPTION;
    BEGIN
        SELECT
            COUNT(teacher_id)
        INTO numar
        FROM
            teachers
        WHERE
            teacher_id = id;

        IF numar = 0 THEN
            RAISE profesor_inexistent;
        END IF;
        SELECT
            COUNT(DISTINCT s.student_id)
        INTO numar
        FROM
            students   s
            JOIN meetings   m ON ( s.student_id = m.student_id )
            JOIN teachers   t ON ( t.teacher_id = m.teacher_id )
        WHERE
            t.teacher_id = id;

        IF numar = 0 THEN
            RAISE elevi_inexistenti;
        END IF;
        INSERT INTO info2 VALUES (
            numar,
            NULL
        );

        COMMIT;
        RETURN numar;
    EXCEPTION
        WHEN profesor_inexistent THEN
            INSERT INTO info2 VALUES (
                0,
                'Nu exista profesorul cu id-ul dat'
            );

            COMMIT;
            raise_application_error(-20006, 'This teacher doesn''t exist');
        WHEN elevi_inexistenti THEN
            INSERT INTO info2 VALUES (
                0,
                'Profesorul nu are sedinte'
            );

            COMMIT;
            raise_application_error(-20007, 'This teacher has no meetings');
        WHEN OTHERS THEN
            INSERT INTO info2 VALUES (
                0,
                'Alta eroare'
            );

            COMMIT;
            raise_application_error(-20008, 'Another error');
    END f8;

    PROCEDURE p9(
        v_id    managers.manager_id%TYPE,
        v_day   aux.day%TYPE
    ) IS

        CURSOR meets IS
        SELECT
            meeting_id,
            student_id,
            m.teacher_id,
            subject_name,
            s.subject_id
        FROM
            meetings   m
            JOIN teachers   t ON ( m.teacher_id = t.teacher_id )
            JOIN centers    c ON ( t.center_id = c.center_id )
            JOIN managers   mg ON ( c.manager_id = mg.manager_id )
            JOIN subjects   s ON ( s.subject_id = m.subject_id )
        WHERE
            v_day = m.day
            AND mg.manager_id = v_id;

        nr NUMBER(2);
        nicio_sedinta EXCEPTION;
        manager_inexistent EXCEPTION;
        zi_inexistenta EXCEPTION;
    BEGIN
        SELECT
            COUNT(v_day)
        INTO nr
        FROM
            aux
        WHERE
            v_day = day;

        IF nr = 0 THEN
            RAISE zi_inexistenta;
        END IF;
        SELECT
            COUNT(manager_id)
        INTO nr
        FROM
            managers
        WHERE
            manager_id = v_id;

        IF nr = 0 THEN
            RAISE manager_inexistent;
        END IF;
        nr := 0;
        FOR i IN meets LOOP
            dbms_output.put_line('Meeting id: ' || i.meeting_id);
            dbms_output.put_line('Teacher id: ' || i.teacher_id);
            dbms_output.put_line('Student id: ' || i.student_id);
            dbms_output.put_line('Subject : ' || i.subject_name);
            dbms_output.new_line();
            nr := nr + 1;
        END LOOP;

        IF nr = 0 THEN
            RAISE nicio_sedinta;
        END IF;
    EXCEPTION
        WHEN nicio_sedinta THEN
            raise_application_error(-20009, 'No meetings found');
        WHEN zi_inexistenta THEN
            raise_application_error(-20010, 'This day does not exist');
        WHEN manager_inexistent THEN
            raise_application_error(-20011, 'No manager has this id');
        WHEN OTHERS THEN
            raise_application_error(-20012, 'Another error');
    END p9;
 

 END package13;
 /

set serveroutput on;
begin
    DBMS_OUTPUT.PUT_LINE(package13.f6('New York'));
end;
/

begin
    package13.p7('Luni');
end;
/


begin
    package13.p7('Monday');
end;
/
