
-- 1. ������ �� 3���� ����ϴ� �͸� ����� ����� ����. (��¹� 9���� �����ؼ� ������)
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

-- 2. employees ���̺��� 201�� ����� �̸��� �̸��� �ּҸ� ����ϴ�
-- �͸� ����� ������. (������ ��Ƽ� ����ϼ���.)
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

-- 3. employees ���̺��� �����ȣ�� ���� ū ����� ã�Ƴ� �� (MAX �Լ� ���)
-- �� ��ȣ + 1������ �Ʒ��� ����� emps ���̺�
-- employee_id, last_name, email, hire_date, job_id�� �ű� �����ϴ� �͸� ����� ���弼��.
-- SELECT�� ���Ŀ� INSERT�� ����� �����մϴ�.
/*
<�����>: steaven
<�̸���>: steavenjobs
<�Ի�����>: ���ó�¥
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

























