
-- lower(�ҹ���), initcap(�ձ��ڸ� �빮��), upper(�빮��)

SELECT * FROM dual;

/*
dual�̶�� ���̺��� sys�� �����ϴ� ����Ŭ�� ǥ�� ���̺�μ�,
���� �� �࿡ �� �÷��� ��� �ִ� dummy ���̺� �Դϴ�.
�Ͻ����� ��� �����̳� ��¥ ���� � �ַ� ����մϴ�.
��� ����ڰ� ������ �� �ֽ��ϴ�.
*/
SELECT 
    'abcDEF', lower('abcDEF'), upper('abcDEF')
FROM
    dual;
    
SELECT last_name, LOWER(last_name), INITCAP(last_name), UPPER(last_name)
FROM employees;

SELECT last_name FROM employees
WHERE LOWER(last_name) = 'austin';
    
-- length(����), instr(���� ã��, ������ 0�� ��ȯ, ������ �ε��� �� ��ȯ)
SELECT
    'abcdef', LENGTH('abcdef'), INSTR('abcdef', 'a')
FROM dual;
    
SELECT 
    first_name, LENGTH(first_name), INSTR(first_name, 'a')
FROM employees;
    
-- substr(���ڿ� �ڸ���), concat(���� ����) 1���� ����.
SELECT 
    'abcdef' AS ex,
    SUBSTR('abcdef', 1, 4),
    CONCAT('abc', 'def')
FROM dual;

SELECT
    first_name,
    SUBSTR(first_name, 1, 3),
    CONCAT(first_name, last_name)
FROM employees;

-- LPAD, RPAD (��, ���� �������ڿ��� ä���)
SELECT
    LPAD('abc', 10, '*'),
    RPAD('abc', 10, '*')
FROM dual;

-- LTRIM(), RTRIM(), TRIM() ���� ����
-- LTRIM(param1, param2) -> param2�� ���� param1���� ã�Ƽ� ����. (���ʺ���)
-- RTRIM(param1, param2) -> param2�� ���� param1���� ã�Ƽ� ����. (�����ʺ���)

SELECT LTRIM('javascript_java', 'java') FROM dual;
SELECT LTRIM('    javascript_java    abc') FROM dual; -- param2 ���� ���� �� ���� ����
SELECT RTRIM('javascript_java', 'java') FROM dual;
SELECT TRIM('    java    ') FROM dual;

-- replace()
SELECT 
    REPLACE('MY dream is a president', 'president', 'programmer')
FROM dual;

SELECT 
    REPLACE('MY dream is a president', ' ', '')
FROM dual;

SELECT 
    REPLACE(REPLACE('MY dream is a president', 'president', 'programmer'), ' ', '')
FROM dual;

SELECT
    REPLACE(CONCAT('hello', ' world!'), '!', '?')
FROM dual;

/*
���� 1.
EMPLOYEES ���̺� ���� �̸�, �Ի����� �÷����� �����ؼ� �̸������� �������� ��� �մϴ�.
���� 1) �̸� �÷��� first_name, last_name�� �ٿ��� ����մϴ�.
���� 2) �Ի����� �÷��� xx/xx/xx�� ����Ǿ� �ֽ��ϴ�. xxxxxx���·� �����ؼ� ����մϴ�.
*/
SELECT * FROM employees;

SELECT 
    CONCAT(first_name, last_name) AS �̸�,
    REPLACE(hire_date, '/', '') AS �Ի�����
FROM employees
ORDER BY �̸� ASC;

/*
���� 2.
EMPLOYEES ���̺� ���� phone_numbe�÷��� ###.###.####���·� ����Ǿ� �ִ�
���⼭ ó�� �� �ڸ� ���� ��� ���� ������ȣ (02)�� �ٿ� 
��ȭ ��ȣ�� ����ϵ��� ������ �ۼ��ϼ���
*/
SELECT
    REPLACE(phone_number, SUBSTR(phone_number, 1, 4), '(02)') AS ��ȭ��ȣ
FROM employees;

SELECT
   CONCAT('(02)', SUBSTR(phone_number, 5, LENGTH(phone_number)))
FROM employees;

/*
���� 3. 
EMPLOYEES ���̺��� JOB_ID�� it_prog�� ����� �̸�(first_name)�� �޿�(salary)�� ����ϼ���.
���� 1) ���ϱ� ���� ���� �ҹ��ڷ� �Է��ؾ� �մϴ�.(��Ʈ : lower �̿�)
���� 2) �̸��� �� 3���ڱ��� ����ϰ� �������� *�� ����մϴ�. 
�� ���� �� ��Ī�� name�Դϴ�.(��Ʈ : rpad�� substr �Ǵ� substr �׸��� length �̿�)
���� 3) �޿��� ��ü 10�ڸ��� ����ϵ� ������ �ڸ��� *�� ����մϴ�. 
�� ���� �� ��Ī�� salary�Դϴ�.(��Ʈ : lpad �̿�)
*/
SELECT
    RPAD(SUBSTR(first_name, 1, 3), LENGTH(first_name) ,'*') AS name,
    LPAD(salary, 10, '*') AS salary
FROM employees
WHERE LOWER(job_id) IN ('it_prog');

SELECT
    RPAD(SUBSTR(first_name, 1, 3), LENGTH(first_name) ,'*') AS name,
    LPAD(salary, 10, '*') AS salary
FROM employees
WHERE LOWER(job_id) = 'it_prog';

















    