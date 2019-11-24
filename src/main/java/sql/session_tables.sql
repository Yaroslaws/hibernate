create table students (
    id serial primary key,
    first_name character varying(50) not null,
    last_name varchar(50) not null,
    unique(first_name, last_name)
);
create table account (
      id serial primary key,
      akk_number character varying(16) not null unique ,
      creation_date timestamp not null default current_date
);
-- правила один к одному
alter table students add column account_id integer;
alter table students alter column account_id set not null;
alter table students add constraint account_id_unique unique(account_id);
alter table students add constraint account_id_ref foreign key (account_id) references account(id);


create table mentors(
    id serial primary key,
    last_name varchar(50) not null ,
    first_name varchar(50) not null ,
    unique (first_name,last_name)
);

-- правило один ко многим
alter table students add column mentor_id integer not null;
alter table students add constraint student_mentors_ref foreign key (mentor_id) references mentors(id);
insert into mentors (last_name, first_name) values ('Иван', 'Сидоров');
insert into mentors (last_name, first_name) values ('Елена', 'Петрова');
insert into mentors (last_name, first_name) values ('Валерий', 'Сюткин');
insert into account (akk_number) values ('123457');

insert into students(first_name, last_name,mentor_id,account_id) values ('yar', 'senko','1','1');
insert into students(first_name, last_name,mentor_id,account_id) values ('ivan', 'senko','2','2');

ALTER TABLE students
    ADD CONSTRAINT FK_CONSTRAINTNAME
        FOREIGN KEY (account_id)
            REFERENCES account
                (id)
            ON DELETE CASCADE;


-- правило многие ко многим
create table courses (
    id serial primary key ,
    course_name varchar(40) not null unique
);

insert into courses (id,course_name) values ('1','java_rush');
insert into courses (id,course_name) values ('2','pyton');
insert into courses (id,course_name) values ('3','ruby');

create table students_courses_union(
     student_id integer references students(id) not null ,
     course_id integer references courses(id) not null ,
     primary key (student_id, course_id)
);

insert into students_courses_union (student_id, course_id) values (1,1);
insert into students_courses_union (student_id, course_id) values (2,2);


alter table students add column mentor_id integer not null;
delete from students where id ='1';
select * from students;

select  s.id, s.first_name, a.akk_number, s.last_name, m.first_name as name_mentor  from students s
    left join  mentors m on s.mentor_id = m.id
    left join  account a on s.account_id = a.id
    order by s.id;

select s.id, s.first_name, s.last_name, c.course_name
    from students s
    left join students_courses_union sc on s.id = sc.student_id
    inner join courses c on c.id =sc.course_id;



