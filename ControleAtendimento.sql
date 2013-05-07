CREATE TABLE tipo_atendimento (
  id serial NOT NULL,
  codigo VARCHAR(80) NULL,
  descricao TEXT NULL,
  PRIMARY KEY(id)  
);

CREATE TABLE atend_proced(
  procedimento_id INTEGER,
  tipo_atendimento_id INTEGER,
  CONSTRAINT procedimento_FKey FOREIGN KEY (procedimento_id)
      REFERENCES procedimento (id) MATCH SIMPLE ON UPDATE NO ACTION ON DELETE NO ACTION,
	  CONSTRAINT tipo_atendimento_FKey FOREIGN KEY (tipo_atendimento_id)
      REFERENCES tipo_atendimento (id) MATCH SIMPLE ON UPDATE NO ACTION ON DELETE NO ACTION
);

CREATE TABLE atendimento (
  id serial NOT NULL,
  tipo_atendimento_id INTEGER NOT NULL,
  numero_atendimento INTEGER NULL,
  data_inicial_atendimento DATE NULL,
  hora_inicial_atendimento VARCHAR(20) NULL,
  data_final_atendimento DATE NULL,
  hora_final_atendimento VARCHAR(20) NULL,
  bairro VARCHAR(80) NULL,
  complemento VARCHAR(255) NULL,
  descricao TEXT NULL,
  status INTEGER NULL,
  logradouro VARCHAR(80) NULL,
  cidade VARCHAR(80) NULL,
  estado VARCHAR(2) NULL,
  PRIMARY KEY(id),
 CONSTRAINT tipo_atendimento_FKey FOREIGN KEY (tipo_atendimento_id)
      REFERENCES tipo_atendimento (id) MATCH SIMPLE ON UPDATE NO ACTION ON DELETE NO ACTION
);

CREATE TABLE procedimento (
  id serial NOT NULL,
  codigo VARCHAR(80)  NULL,
  descricao TEXT NULL,
  PRIMARY KEY(id)
);


