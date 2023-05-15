create table estacionamento (
	id serial primary key,
	placa_do_carro varchar(20)not null,
	horario_entrada timestamp not null,
	horario_saida timestamp,
	status varchar (20) not null
);

CREATE OR REPLACE FUNCTION update_horario_saida()
RETURNS TRIGGER AS $$
BEGIN
    IF NEW.status = 'finalizado' AND OLD.status <> 'finalizado' THEN
        NEW.horario_saida := NOW();
    END IF;
    
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER update_horario_saida_trigger
BEFORE UPDATE ON estacionamento
FOR EACH ROW
EXECUTE FUNCTION update_horario_saida();

INSERT INTO estacionamento (placa_do_carro, horario_entrada, status)
VALUES ('ABC1234', '2023-05-15 10:00:00', 'estacionado');


INSERT INTO estacionamento (placa_do_carro, horario_entrada, status)
VALUES ('AmC1l34', '2023-05-15 11:00:00', 'estacionado');

select * from estacionamento

update estacionamento
set status = 'finalizado'
where id = 1;