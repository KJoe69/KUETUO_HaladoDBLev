-- a. feladat
CREATE TABLE AUTO1 (
    RSZ   CHAR(6) NOT NULL,
    TIPUS CHAR(30),
    SZIN  CHAR(20),
    KOR   NUMBER(3),
    AR    NUMBER(10)
);

-- b. feladat
INSERT INTO AUTO1 (RSZ, TIPUS, SZIN, KOR, AR) VALUES 
('ABC500', 'Opel Corsa', 'piros', 8, 1939639),
('MCC325', 'Opel Insignia', 'fekete', 2, 6800000),
('BBM104', 'Suzuki Swift', 'piros', 5, 3636824),
('CHR411', 'Renault Twingo', 'piros', 12, 1697185),
('JRZ932', 'BMW M3', 'fekete', 5, 4500000),
('JEG113', 'Opel Corsa', 'piros', 7, 2182094),
('DER842', 'Seat Ibiza', 'szürke', 14, 605000),
('BAB422', 'Lada 1300S', 'fehér', 28, 220000),
('UFF666', 'Audi TT', 'fekete', 4, 7500000);

SELECT * FROM AUTO1;

-- c. feladat
BEGIN
    UPDATE AUTO1
    SET AR = ROUND(AR * 0.9)
    WHERE KOR > 7;

    DBMS_OUTPUT.PUT_LINE('Módosított sorok száma: ' || SQL%ROWCOUNT);
    COMMIT;
END;

SELECT * FROM AUTO1;

-- d. feladat
DECLARE
    v_atlagar AUTO1.AR%TYPE;
BEGIN
    SELECT ROUND(AVG(AR))
    INTO v_atlagar
    FROM AUTO1;

    DBMS_OUTPUT.PUT_LINE('Az autók átlagára: ' || v_atlagar || ' Ft');
END;

-- e. feladat
DECLARE
    v_darab NUMBER;
BEGIN
    SELECT COUNT(*) INTO v_darab FROM AUTO1;

    DBMS_OUTPUT.PUT_LINE('Autók száma: ' || v_darab);
END;

-- f. feladat
DECLARE
    v_auto AUTO1%ROWTYPE;
BEGIN
    SELECT * INTO v_auto FROM AUTO1
    WHERE RSZ = 'ABC500';

    DBMS_OUTPUT.PUT_LINE('Az ABC500 rendszámú autó ára: ' || v_auto.AR || ' Ft');
END;

-- g. feladat
DECLARE
    v_rsz   AUTO1.RSZ%TYPE   := 'XYZ987';
    v_tipus AUTO1.TIPUS%TYPE := 'Ford Focus';
    v_szin  AUTO1.SZIN%TYPE  := 'kék';
    v_kor   AUTO1.KOR%TYPE   := 6;
    v_ar    AUTO1.AR%TYPE    := 3200000;
BEGIN
    INSERT INTO AUTO1 (RSZ, TIPUS, SZIN, KOR, AR) VALUES (v_rsz, v_tipus, v_szin, v_kor, v_ar);

    COMMIT;
    DBMS_OUTPUT.PUT_LINE('Az új rekord sikeresen beszúrva (' || v_rsz || ').');
END;

-- h. feladat
BEGIN
    DELETE FROM AUTO1
    WHERE KOR = :autokora;

    DBMS_OUTPUT.PUT_LINE('Törölt sorok száma: ' || SQL%ROWCOUNT);
    COMMIT;
END;