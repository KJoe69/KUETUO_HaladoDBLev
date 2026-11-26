-- 1. feladat
DECLARE
	x number := 15;
BEGIN
	IF x < 10 THEN dbms_output.put_line('Kisebb mint 10');
	ELSIF x < 20 THEN dbms_output.put_line('10 és 20 között');
	ELSE dbms_output.put_line('Nagyobb mint 20');
	END IF;
END;

-- 2. feladat
DECLARE
    a NUMBER := 10;
    b NUMBER := 81;
BEGIN
    CASE
        WHEN a > b THEN
            DBMS_OUTPUT.PUT_LINE('A nagyobb szám: ' || a );
        WHEN b > a THEN
            DBMS_OUTPUT.PUT_LINE('A nagyobb szám: ' || b );
        ELSE
            DBMS_OUTPUT.PUT_LINE('A két szám egyenlő (' || a || ' = ' || b || ')');
    END CASE;
END;

-- 3. feladat
DECLARE
	beosztas VARCHAR(10) := 'root';
BEGIN
	CASE
		WHEN beosztas = 'dev' THEN dbms_output.put_line('fejlesztő');
		WHEN beosztas = 'root' THEN dbms_output.put_line('rendszergazda');
		WHEN beosztas = 'coder' THEN dbms_output.put_line('programozó');
		ELSE dbms_output.put_line('egyedi munkarend');
	END CASE;
END;

-- 4. feladat
DECLARE
	n number := 10;
BEGIN
	FOR i IN 1..n LOOP
		dbms_output.put_line(TO_CHAR(i));
	END LOOP;
END;

-- 5. feladat
DECLARE
	n number := 5;
BEGIN
	FOR i IN 1..n LOOP
		dbms_output.put_line(TO_CHAR(i));
	END LOOP;
END;

/*
  TÖMB, REKORD
*/
-- 1. feladat
DECLARE
	TYPE tomb IS VARRAY(3) OF NUMBER;
	
	arak tomb := tomb(150, 220, 180);
BEGIN
	FOR i IN 1..arak.COUNT LOOP
		dbms_output.put_line(arak(i));
	END LOOP;
END;

-- 2. feladat
DECLARE
    TYPE t_nevek IS VARRAY(4) OF VARCHAR2(50);
    TYPE t_pontok IS VARRAY(4) OF NUMBER;

    v_nevek  t_nevek  := t_nevek('Nagy Anna', 'Kovács Béla', 'Szabó Csaba', 'Tóth Dóra');
    v_pontok t_pontok := t_pontok(85, 92, 74, 98);
BEGIN
    FOR i IN 1..v_nevek.COUNT LOOP
        DBMS_OUTPUT.PUT_LINE(
            'Hallgató: ' || v_nevek(i) || ' - Pontszám: ' || v_pontok(i)
        );
    END LOOP;
END;

-- 3. feladat
-- csak a kuetuo_autosql b. feladat után futtatható
DECLARE
    TYPE t_auto_rekord IS RECORD (
        rsz  AUTO1.RSZ%TYPE,
        szin AUTO1.SZIN%TYPE,
        ar   AUTO1.AR%TYPE
    );

    v_auto t_auto_rekord;
BEGIN
    SELECT RSZ, SZIN, AR
    INTO v_auto
    FROM AUTO1
    FETCH FIRST 1 ROW ONLY;

    DBMS_OUTPUT.PUT_LINE(
        'Rendszám: ' || v_auto.rsz ||
        ' | Szín: ' || TRIM(v_auto.szin) ||
        ' | Ár: ' || v_auto.ar || ' Ft'
    );
END;



