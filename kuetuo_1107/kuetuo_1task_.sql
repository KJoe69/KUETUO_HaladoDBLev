/*
  1. task SQL utasításai
*/

-- a
CREATE TABLE KOROK (
    SUGAR    NUMBER(4,0) NOT NULL,
    KERULET  NUMBER,
    TERULET  NUMBER,
    CONSTRAINT KOROK_PK PRIMARY KEY (SUGAR)
);

-- b
DESCRIBE KOROK;

-- c
SELECT 2 * 1 * ACOS(-1) AS KERULET
FROM DUAL;

-- d
CREATE OR REPLACE FUNCTION PI
RETURN NUMBER
IS
BEGIN
    RETURN ACOS(-1);
END;

-- e
SELECT 2 * 1 * PI() AS KERULET
FROM DUAL;

-- f
DECLARE
    v_sugar   NUMBER := 1;
    v_kerulet NUMBER;
    v_terulet NUMBER;
BEGIN
    v_kerulet := 2 * v_sugar * PI();
    v_terulet := POWER(v_sugar, 2) * PI();

    DBMS_OUTPUT.PUT_LINE('Sugár: ' || v_sugar);
    DBMS_OUTPUT.PUT_LINE('Kerület: ' || ROUND(v_kerulet, 2));
    DBMS_OUTPUT.PUT_LINE('Terület: ' || ROUND(v_terulet, 2));
END;

-- g
DECLARE
    v_kerulet NUMBER;
BEGIN
    FOR x IN 1..5 LOOP
        v_kerulet := 2 * x * PI();
        DBMS_OUTPUT.PUT_LINE('Sugár = ' || x || ';  Kerület = ' || ROUND(v_kerulet, 2));
    END LOOP;
END;

-- h
CREATE OR REPLACE PROCEDURE KOR_KERULET (p_sugar IN NUMBER)
IS
    v_kerulet NUMBER;
BEGIN
    v_kerulet := 2 * p_sugar * PI();
    DBMS_OUTPUT.PUT_LINE('Sugár: ' || p_sugar || ';  Kerület: ' || ROUND(v_kerulet, 2));
END;

BEGIN
    KOR_KERULET(1);
END;

-- i
CREATE OR REPLACE PROCEDURE KOR_ADATOK (p_sugar IN NUMBER)
IS
    v_kerulet NUMBER;
    v_terulet NUMBER;
BEGIN
    v_kerulet := 2 * p_sugar * PI();
    v_terulet := POWER(p_sugar, 2) * PI();

    DBMS_OUTPUT.PUT_LINE(
        'Sugár: ' || p_sugar ||
        '; Kerület: ' || ROUND(v_kerulet, 2) ||
        '; Terület: ' || ROUND(v_terulet, 2)
    );
END;

BEGIN
    KOR_ADATOK(1);
END;

-- j
CREATE OR REPLACE PROCEDURE KOR_BESZURAS (p_sugar IN NUMBER)
IS
    v_kerulet NUMBER;
    v_terulet NUMBER;
BEGIN
    v_kerulet := 2 * p_sugar * PI();
    v_terulet := POWER(p_sugar, 2) * PI();

    INSERT INTO KOROK (SUGAR, KERULET, TERULET)
        VALUES (p_sugar, ROUND(v_kerulet, 2), ROUND(v_terulet, 2));
    
    COMMIT;
END;

BEGIN
    FOR x IN 1..5 LOOP
        KOR_BESZURAS(x);
    END LOOP;
END;

SELECT * FROM KOROK;
