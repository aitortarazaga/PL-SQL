CREATE OR REPLACE PROCEDURE insert_centro
  (P_PROVINCIA IN VARCHAR2,
  P_NOMBRE IN VARCHAR2)
IS
  E_NOM_EXIST EXCEPTION;
BEGIN  
  declare 
    V_NOMBRE CENTROS.NOMBRE%TYPE;
    
  begin 
  
    SELECT NOMBRE INTO V_NOMBRE
          FROM CENTROS
          WHERE UPPER(NOMBRE)=UPPER(P_NOMBRE);
          
    IF SQL%FOUND THEN
       RAISE E_NOM_EXIST;
    END IF;
    exception
      WHEN NO_DATA_FOUND THEN
         NULL;
      WHEN TOO_MANY_ROWS THEN
         RAISE_APPLICATION_ERROR('-20002', 'Error '|| SQLERRM );
    end;
  
  INSERT INTO CENTROS(NOMBRE, PROVINCIA) VALUES(P_NOMBRE,P_PROVINCIA);
  IF SQL%FOUND
  THEN
      commit;
  END IF;
  EXCEPTION
  WHEN E_NOM_EXIST THEN
      RAISE_APPLICATION_ERROR('-20001', 'Error Ya hay un centro con ese nombre');
  WHEN OTHERS THEN
      RAISE_APPLICATION_ERROR('-20003', 'Error '|| SQLERRM);
END;





