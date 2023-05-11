create table aluno_Nota(
    id int generated always as identity,
	nome varchar (400) not null,
    Nota float not null,
	primary key (id)
);

create table alterar_nota(
	id int generated always as identity,
	aluno_id int not null,
	nota varchar (400) not null,
	changed_on timestamp(6) not null
);

create or replace function log_notas_changes()
returns trigger
language plpgsql
as
$$
begin
   if new.nota <> old.nota then
   insert into alterar_nota(aluno_id,nota,changed_on)
   values(old.id,old.nota,now());
   end if;
   return new;
   end;
   $$
   
   
   
create trigger notas_changes
before update
on aluno_Nota
for each row
execute procedure log_notas_changes();

insert into aluno_Nota(nome, nota)
values ('Uelberti',10.0);

insert into aluno_Nota (nome, nota)
values ('Bruno', 9.0);

insert into aluno_Nota (nome, nota)
values ('Fernado', 6.0);

insert into aluno_Nota (nome, nota)
values ('Alice', 4.0);

insert into aluno_Nota (nome, nota)
values ('Amanda', 5.0);

insert into aluno_Nota (nome, nota)
values ('Pedro', 7.0);

update aluno_nota set nota = 9.0 where id = 6;

select * from aluno_nota

select * from alterar_nota