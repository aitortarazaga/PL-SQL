/*EJERCICIO 4*/
DECLARE
V_ID CENTROS.ID%TYPE;
V_NOMBRE CENTROS.NOMBRE%TYPE;
BEGIN
SELECT NOMBRE INTO V_NOMBRE
        FROM CENTROS
        WHERE UPPER(NOMBRE)='ABRERA';
IF SQL%FOUND THEN DBMS_OUTPUT.PUT_LINE('Ya hay un centro con ese nombre');
END IF;
EXCEPTION
  WHEN NO_DATA_FOUND THEN
  INSERT INTO CENTROS(NOMBRE) VALUES('ABRERA');
  IF SQL%NOTFOUND
  THEN
      DBMS_OUTPUT.PUT_LINE('Ningun registro');
  ELSE
      DBMS_OUTPUT.PUT_LINE('Insertado el centro');
      commit;
  END IF;
WHEN TOO_MANY_ROWS THEN
      DBMS_OUTPUT.PUT_LINE('Hay m�s de un centro con ese nombre');
END;

SELECT * FROM CENTROS WHERE UPPER(NOMBRE)='ABRERA'; --Comprobamos antes
