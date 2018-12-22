CREATE OR REPLACE FORCE VIEW "KBD2A08"."OPER_BANK_VIEW" (
    "NAZWA_NADAWCY", 
    "NR_KONTA_NADAWCY", 
    "NR_KONTA_ODBIORCY", 
    "KWOTA", 
    "TYTUL", 
    "DATA_OPERACJI"
) AS 
SELECT 
    knd.NAZWA AS NAZWA_NADAWCY, 
    knd.NR_KONTA AS NR_KONTA_NADAWCY, 
    ko.NR_KONTA AS NR_KONTA_ODBIORCY, 
    o.KWOTA, 
    o.TYTUL, 
    o.DATA_OPERACJI 
FROM OPERACJE_BANKOWE o
JOIN KONTA ko ON ko.ID_KONTA = o.ID_KONTA_ODBIORCY
JOIN (
    SELECT k.ID_KONTA, d.NAZWA, k.NR_KONTA
    FROM KONTA k
    JOIN DARCZYNCY d ON k.ID_DARCZYNCY = d.ID_DARCZYNCY
    ) knd
ON knd.ID_KONTA = o.ID_KONTA_NADAWCY;
/

CREATE OR REPLACE VIEW DAROWIZNY_DLA_PODOP_VIEW (
    "DATA OPERACJI",
    TYTUL,
    KWOTA,
    PODOPIECZNY
) AS
SELECT O.DATA_OPERACJI, O.TYTUL, O.KWOTA, NVL2(O.ID_PODOP, P.IMIE||' '||P.NAZWISKO, 'brak przypisania')
FROM OPERACJE_BANKOWE O
LEFT JOIN PODOPIECZNI P ON O.ID_PODOP = P.ID_PODOP;
/
