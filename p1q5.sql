/*EJERCICIO 5*/
DECLARE
V_ID CENTROS.ID%TYPE:=1;
V_PROV CENTROS.PROVINCIA%TYPE:='�LAVA';
BEGIN 
  UPDATE CENTROS
    SET PROVINCIA=INITCAP(V_PROV)
    WHERE ID=V_ID;
  IF SQL%FOUND
  THEN DBMS_OUTPUT.PUT_LINE('Actualizado el centro ' || to_char(V_ID));
  COMMIT;
  
  ELSE
  DBMS_OUTPUT.PUT_LINE('No existe el centro ' || to_char(V_ID));
  END IF;
END;

SELECT * FROM CENTROS;