
-- WHILE��

DECLARE
    v_num NUMBER := 3;
    v_count NUMBER := 1;
BEGIN
    WHILE v_count <= 10
    LOOP
        dbms_output.put_line(v_num);
        v_count := v_count + 1;
    END LOOP;
    
END;

-- Ż�⹮
DECLARE
    v_num NUMBER := 3;
    v_count NUMBER := 1;
BEGIN
    WHILE v_count <= 10
    LOOP
        dbms_output.put_line(v_num);
        EXIT WHEN v_count =5;
        v_count := v_count + 1;
    END LOOP;
    
END;

-- FOR��
DECLARE
    v_num NUMBER := 3;
BEGIN

    FOR i IN 1..9 -- .�� �� �� �ۼ��ؼ� ������ ǥ��.
    LOOP
        dbms_output.put_line(v_num || 'X' || i || '=' || v_num*i);
    END LOOP;

END;

-- CONTINUE��
DECLARE
    v_num NUMBER := 3;
BEGIN

    FOR i IN 1..9 -- .�� �� �� �ۼ��ؼ� ������ ǥ��.
    LOOP
        CONTINUE WHEN i = 5;
        dbms_output.put_line(v_num || 'X' || i || '=' || v_num*i);
    END LOOP;

END;


-- 1. ��� �������� ����ϴ� �͸� ����� ���弼��. (2��~9��)
DECLARE
    v_num NUMBER := 2;
    v_count NUMBER := 1;
BEGIN
    FOR i IN v_num..9
    LOOP
        FOR i IN 1..9
        LOOP
            dbms_output.put_line(v_num || 'X' || i || '='  ||v_num * i);
        END LOOP;
        v_num := v_num +1;
    END LOOP;
END;

-- 2. INSERT�� 300�� �����ϴ� �͸� ����� ó���ϼ���.
-- board��� �̸��� ���̺��� ���弼��. (bno, writer, title �÷��� �����մϴ�.)
-- bno�� SEQUENCE�� �÷��ֽð�, writer�� title�� ��ȣ�� �ٿ��� INSERT ������ �ּ���.
-- ex) 1, test1, title1 -> 2 test2 title2 ......

    
SELECT board_seq.CURRVAL FROM dual;
SELECT * FROM board
ORDER BY bno DESC;
DROP SEQUENCE board_seq;
DROP TABLE board;

CREATE TABLE board (
    bno NUMBER,
    writer VARCHAR2(50),
    title VARCHAR2(50)
);

CREATE SEQUENCE board_seq
    START WITH 1
    INCREMENT BY 1
    MAXVALUE 300
    MINVALUE 1
    NOCACHE
    NOCYCLE;


DECLARE
    v_num NUMBER := 1;
BEGIN
--    WHILE v_num <= 300
--    LOOP
--        INSERT INTO board
--        VALUES(board_seq.nextval, 'test'||v_num, 'title'||v_num);
--        v_num := v_num + 1;
--    END LOOP;


    FOR i IN 1..300
    LOOP
        INSERT INTO board
        VALUES(board_seq.nextval, 'test'||i, 'title'||i);
    END LOOP;
    
END;



















