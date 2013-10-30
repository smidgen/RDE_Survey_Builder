insert into Survey (Name) values ('Sample Survey');
insert into Question (Question, Survey_id, Type_id) values ('Name?', 1, 1);
insert into Question (Question, Survey_id, Type_id) values ('Gender?', 1, 2);
insert into Question (Question, Survey_id, Type_id) values ('Age?', 1, 1);
insert into Question (Question, Survey_id, Type_id) values ('Location', 1, 1);
insert into Options (Question_id, Option_text) values (2, 'male');
insert into Options (Question_id, Option_text) values (2, 'female');
insert into Type (Name) values ('textbox');
insert into Type (Name) values ('radio');