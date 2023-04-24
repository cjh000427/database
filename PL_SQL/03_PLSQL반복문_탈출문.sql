
-- WHILE문

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

-- 탈출문
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

-- FOR문
DECLARE
    v_num NUMBER := 3;
BEGIN

    FOR i IN 1..9 -- .을 두 개 작성해서 범위를 표현.
    LOOP
        dbms_output.put_line(v_num || 'X' || i || '=' || v_num*i);
    END LOOP;

END;

-- CONTINUE문
DECLARE
    v_num NUMBER := 3;
BEGIN

    FOR i IN 1..9 -- .을 두 개 작성해서 범위를 표현.
    LOOP
        CONTINUE WHEN i = 5;
        dbms_output.put_line(v_num || 'X' || i || '=' || v_num*i);
    END LOOP;

END;


-- 1. 모든 구구단을 출력하는 익명 블록을 만드세요. (2단~9단)
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

-- 2. INSERT를 300번 실행하는 익명 블록을 처리하세요.
-- board라는 이름의 테이블을 만드세요. (bno, writer, title 컬럼이 존재합니다.)
-- bno는 SEQUENCE로 올려주시고, writer와 title에 번호를 붙여서 INSERT 진행해 주세요.
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



















