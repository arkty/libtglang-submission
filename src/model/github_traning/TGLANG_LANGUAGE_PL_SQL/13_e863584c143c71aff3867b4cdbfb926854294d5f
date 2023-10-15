set serveroutput on;

-- show list of all movies 
declare
  cursor c1 is
    select * from movies;
  v_movie movies%rowtype;
begin
    open c1;
    loop
        fetch c1 into v_movie;
        exit when c1%notfound;
        dbms_output.put_line(v_movie.title);
    end loop;
    close c1;
    end;
/


-- show list of all movies with a given title
declare
  cursor c1 is
    select * from movies where title = 'The Matrix';
  v_movie movies%rowtype;
begin
    open c1;
    loop
        fetch c1 into v_movie;
        exit when c1%notfound;
        dbms_output.put_line(v_movie.title);
    end loop;
    close c1;
    end;
/

-- show list of all movies liked by a given user taking from input
declare
  cursor c1 is
    select * from movies where movieid in (select movieid from FAVORITES where userid = &userid);
  v_movie movies%rowtype;
begin
    open c1;
    loop
        fetch c1 into v_movie;
        exit when c1%notfound;
        dbms_output.put_line(v_movie.title);
    end loop;
    close c1;
    end;
/
-- show example of a nested cursor
declare
  cursor c1 is
    select * from movies;
  v_movie movies%rowtype;
  cursor c2 is
    select * from favorites where userid = &userid;
  v_favorite favorites%rowtype;
begin
    open c1;
    loop
        fetch c1 into v_movie;
        exit when c1%notfound;
        dbms_output.put_line(v_movie.title);
        open c2;
        loop
            fetch c2 into v_favorite;
            exit when c2%notfound;
            dbms_output.put_line('   ' || v_favorite.userid || ' ' || v_favorite.movieid);
        end loop;
        close c2;
    end loop;
    close c1;
    end;
/

-- show example of while loop
declare
  cursor c1 is
    select * from movies;
  v_movie movies%rowtype;
begin
    open c1;
    fetch c1 into v_movie;
    while c1%found loop
        dbms_output.put_line(v_movie.title);
        fetch c1 into v_movie;
    end loop;
    close c1;
    end;
/

-- show example of for loop
declare
  cursor c1 is
    select * from movies;
  v_movie movies%rowtype;
begin
    for v_movie in c1 loop
        dbms_output.put_line(v_movie.title);
    end loop;
    end;
/

-- show example of for loop with a nested cursor
declare
  cursor c1 is
    select * from movies;
  v_movie movies%rowtype;
begin
    for v_movie in c1 loop
        dbms_output.put_line(v_movie.title);
        for v_favorite in (select * from favorites where userid = &userid) loop
            dbms_output.put_line('   ' || v_favorite.userid || ' ' || v_favorite.movieid);
        end loop;
    end loop;
    end;
/

-- do...while loop
declare
  cursor c1 is
    select * from movies;
  v_movie movies%rowtype;
begin
    open c1;
    loop
        fetch c1 into v_movie;
        exit when c1%notfound;
        dbms_output.put_line(v_movie.title);
    end loop;
    close c1;
    end;
/

-- if..else if..else
declare
  cursor c1 is
    select * from movies;
  v_movie movies%rowtype;
begin
    open c1;
    loop
        fetch c1 into v_movie;
        exit when c1%notfound;
        if v_movie.movieid = 1 then
            dbms_output.put_line('The Matrix');
        elsif v_movie.movieid = 2 then
            dbms_output.put_line('The Matrix Reloaded');
        else
            dbms_output.put_line('Unknown');
        end if;
    end loop;
    close c1;
    end;
/

-- case
declare
  cursor c1 is
    select * from movies;
  v_movie movies%rowtype;
begin
    open c1;
    loop
        fetch c1 into v_movie;
        exit when c1%notfound;
        case v_movie.movieid
            when 1 then
                dbms_output.put_line('The Matrix');
            when 2 then
                dbms_output.put_line('The Matrix Reloaded');
            else
                dbms_output.put_line('Unknown');
        end case;
    end loop;
    close c1;
    end;
/

-- show example of a function
create or replace function get_movie_title(p_movieid in number) return varchar2 is
    v_title varchar2(100);
begin
    select title into v_title from movies where movieid = p_movieid;
    return v_title;
end;
/

-- show example of a procedure
create or replace procedure print_movie_title(p_movieid in number) is
    v_title varchar2(100);
begin
    select title into v_title from movies where movieid = p_movieid;
    dbms_output.put_line(v_title);
end;
/

-- show example of a function with a cursor
create or replace function get_movie_title(p_movieid in number) return varchar2 is
    v_title varchar2(100);
    cursor c1 is
        select title from movies where movieid = p_movieid;
begin
    open c1;
    fetch c1 into v_title;
    close c1;
    return v_title;
end;
/

-- show example of a procedure with a cursor
create or replace procedure print_movie_title(p_movieid in number) is
    v_title varchar2(100);
    cursor c1 is
        select title from movies where movieid = p_movieid;
begin
    open c1;
    fetch c1 into v_title;
    close c1;
    dbms_output.put_line(v_title);
end;
/

-- show example of a function with a cursor and a parameter
create or replace function get_movie_title(p_movieid in number) return varchar2 is
    v_title varchar2(100);
    cursor c1(p_movieid in number) is
        select title from movies where movieid = p_movieid;
begin

    open c1(p_movieid);
    fetch c1 into v_title;
    close c1;
    return v_title;
end;
/

-- show example of a procedure with a cursor and a parameter
create or replace procedure print_movie_title(p_movieid in number) is
    v_title varchar2(100);
    cursor c1(p_movieid in number) is
        select title from movies where movieid = p_movieid;
begin
    open c1(p_movieid);
    fetch c1 into v_title;
    close c1;
    dbms_output.put_line(v_title);
end;
/

-- show example of array
declare
    type t_movie_array is table of movies%rowtype;
    v_movies t_movie_array;
begin
    select * bulk collect into v_movies from movies;
    for i in 1..v_movies.count loop
        dbms_output.put_line(v_movies(i).title);
    end loop;
end;
/

-- show example of array with a cursor
declare
    type t_movie_array is table of movies%rowtype;
    v_movies t_movie_array;
    cursor c1 is
        select * from movies;
begin
    open c1;
    fetch c1 bulk collect into v_movies;
    close c1;
    for i in 1..v_movies.count loop
        dbms_output.put_line(v_movies(i).title);
    end loop;
end;
/

-- show example of array with extends()
declare
    type t_movie_array is table of movies%rowtype;
    v_movies t_movie_array;
begin
    v_movies := t_movie_array();
    v_movies.extend();
    v_movies(1).movieid := 1;
    v_movies(1).title := 'The Matrix';
    v_movies.extend();
    v_movies(2).movieid := 2;
    v_movies(2).title := 'The Matrix Reloaded';
    for i in 1..v_movies.count loop
        dbms_output.put_line(v_movies(i).title);
    end loop;
end;

