declare
    cursor get is select * from department;
    data department%ROWTYPE;
    begin
    open get;
    loop
    fetch get into data;
    exit when get%NOTFOUND;
    dbms_output.put_line(data.did || data.depname);
   end loop;
   close get;
   end;
   /
