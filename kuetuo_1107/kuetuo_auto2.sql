-- auto2 tábla létrehozása
CREATE TABLE AUTO2 (
    ID           NUMBER(4,0) NOT NULL,
    RENDSZAM     CHAR(6 BYTE),
    TIPUS        VARCHAR2(30 BYTE),
    SZIN         VARCHAR2(20 BYTE),
    KOR          NUMBER(3,0),
    AR           NUMBER(10,0),
    MUSZAKI_ERV  DATE,
    CONSTRAINT AUTO2_PK PRIMARY KEY (ID)
);

-- adatok feltöltése
INSERT INTO AUTO2 (ID, RENDSZAM, TIPUS, SZIN, KOR, AR, MUSZAKI_ERV)
VALUES
    (8, 'NCO927', 'Tesla Y', 'Fehér', 3, 26000000, DATE '2024-03-12'),
    (7, 'MUX312', 'Suzuki Swift', 'Piros', 8, 1600000, DATE '2025-09-05'),
    (6, 'MNS418', 'Skoda Karoq', 'Kék', 2, 7000000, DATE '2025-11-25'),
    (5, 'RWE611', 'Ford Focus', 'Sárga', 4, 5300000, DATE '2025-12-05'),
    (3, 'PHD229', 'Skoda Scala', 'Fehér', 1, 6800000, DATE '2025-06-10'),
    (2, 'QWJ612', 'Suzuki Alto', 'Kék', 15, 500000, DATE '2024-12-03'),
    (1, 'ABC123', 'Opel Corsa', 'Piros', 6, 3200000, DATE '2024-08-05');

