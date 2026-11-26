-- 1. feladat
DECLARE
	t varchar(20) := 'Koncz József';
BEGIN
	dbms_output.put_line(t);
END;

-- 2. feladat
DECLARE
	n number;
BEGIN
    SELECT 3+2 INTO n FROM dual;
	dbms_output.put_line(n);
END;

-- 3. feladat
DECLARE
	n number;
    n1 number := 3;
    n2 number := 2;
BEGIN
    SELECT n1 * n2 INTO n FROM dual;
	dbms_output.put_line(n);
END;

-- 4. feladat
DECLARE
	t varchar(20) := 'Koncz József';
BEGIN
	SELECT UPPER(t) into t FROM dual;
	dbms_output.put_line((t));
	
	SELECT LOWER(t) into t FROM dual;
	dbms_output.put_line((t));
	
	SELECT INITCAP(t) into t FROM dual;
	dbms_output.put_line((t));
END;

-- 5. feladat
DECLARE
    n1 VARCHAR2(20) := 'Koncz';
    n2 VARCHAR2(20) := 'József';
    n1k VARCHAR2(20);
    n2k VARCHAR2(20);
    n3k VARCHAR2(20);
BEGIN
    SELECT UPPER(n1 || ' ' || n2) INTO n1k FROM dual;
    
    SELECT LOWER(n1 || ' ' || n2) INTO n2k FROM dual;
    
    SELECT INITCAP(n1 || ' ' || n2) INTO n3k FROM dual;
    dbms_output.put_line(n1k || '; ' || n2k || '; ' || n3k);
END;

-- 6. feladat
DECLARE
	d DATE;
BEGIN
	SELECT SYSDATE INTO d FROM dual;
	dbms_output.put_line(d);
END



