--Write a plsql block using explicity cursor to calculate the gross salary for every employee from emp table using following formular.

--Gross_Salary=salary+(DA+HRA+TA)-TAX.

SET SERVEROUTPUT ON

DECLARE
 
--Declare the cursor name as well as the variables to store the values from the emp table.

CURSOR C3 IS SELECT empno,empname,sal,da,hra,ta,tax,gs from emp;

vempno emp.empno%type;
vempname emp.empname%type;
vsal emp.sal%type;
vda emp.da%type;
vhra emp.hra%type;
vta emp.ta%type;
vtax emp.tax%type;
vgs emp.gs%type;

BEGIN
	OPEN C3;
		LOOP
--Fetch the values from the created cursor to the created variables.
 
			FETCH C3 INTO vempno,vempname,vsal,vda,vhra,vta,vtax,vgs;
			EXIT WHEN C3%NOTFOUND;

--create an new emp2 table where we insert the values from emp and after you update them.

			INSERT INTO EMP2 VALUES(vempno,vempname,vsal,vda,vhra,vta,vtax,vgs);


--The code used to update the new emp2 table successfully.
			UPDATE EMP2 SET GS = SAL+((DA+HRA+TA))-TAX;

		END LOOP;

EXCEPTION
	WHEN OTHERS THEN

		DBMS_OUTPUT.PUT_LINE('There is a certain error in your code ');


END;
/

				
