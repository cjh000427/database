
-- 1. 구구단 중 3단을 출력하는 익명 블록을 만들어 보자. (출력문 9개를 복사해서 쓰세요)
DECLARE
    nums NUMBER;
BEGIN
    nums := 3;
    DBMS_output.put_line('3 * 1' || ' = ' || nums *1); 
    DBMS_output.put_line('3 * 2' || ' = ' || nums *2); 
    DBMS_output.put_line('3 * 3' || ' = ' || nums *3); 
    DBMS_output.put_line('3 * 4' || ' = ' || nums *4); 
    DBMS_output.put_line('3 * 5' || ' = ' || nums *5); 
    DBMS_output.put_line('3 * 6' || ' = ' || nums *6); 
    DBMS_output.put_line('3 * 7' || ' = ' || nums *7); 
    DBMS_output.put_line('3 * 8' || ' = ' || nums *8); 
    DBMS_output.put_line('3 * 9' || ' = ' || nums *9); 
    
END;

-- 2. employees 테이블에서 201번 사원의 이름과 이메일 주소를 출력하는
-- 익명 블록을 만들어보자. (변수에 담아서 출력하세요.)
DECLARE
    emp_name VARCHAR(30);
    emp_email VARCHAR(50);
BEGIN
    SELECT 
        first_name, email
    INTO 
        emp_name, emp_email
    FROM employees
    WHERE employee_id = 201;
    
    DBMS_output.put_line(emp_name || ' - ' || emp_email);
END;

-- 3. employees 테이블에서 사원번호가 제일 큰 사원을 찾아낸 뒤 (MAX 함수 사용)
-- 이 번호 + 1번으로 아래의 사원을 emps 테이블에
-- employee_id, last_name, email, hire_date, job_id를 신규 삽입하는 익명 블록을 만드세요.
-- SELECT절 이후에 INSERT문 사용이 가능합니다.
/*
<사원명>: steaven
<이메일>: steavenjobs
<입사일자>: 오늘날짜
<JOB_ID>: CEO
*/
DECLARE
    emp_id employees.employee_id%TYPE;
BEGIN
    SELECT MAX(employee_id)
    INTO 
        emp_id
    FROM employees;
    
    INSERT INTO emps
        (employee_id, last_name, email, hire_date, job_id)
    VALUES
        (emp_id+1,'steaven', 'steavenjobs', sysdate, 'CEO');

    COMMIT;
END;

SELECT * FROM emps;



DROP TABLE emps;
CREATE TABLE emps AS (SELECT * FROM employees WHERE 1=2);

























