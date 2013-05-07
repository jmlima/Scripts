CREATE TABLE operador (
  id serial NOT NULL,
  nome VARCHAR(80) NULL,
  matricula VARCHAR(60) NULL,
  habilitacao VARCHAR(20) NOT NULL,
  categoria VARCHAR(10) NOT NULL,
  dt_vencimento_hab DATE NOT NULL,
  tipo_sanguineo VARCHAR(10) NOT NULL,
  logradouro VARCHAR(80),
  bairro VARCHAR(80),
  numero VARCHAR(20),
  complemento VARCHAR(80),
  cidade VARCHAR(80),
  estado VARCHAR(80),
  tel_celular VARCHAR(20),
  tel_residencia VARCHAR(20),
  status INTEGER  NULL,
  data_cadastro DATE NULL,
  observacao TEXT NULL,
  foto BLOB  NULL,
  PRIMARY KEY(id)  
);

CREATE TABLE alocacao (
  id serial NOT NULL,
  veiculo_id INTEGER  NOT NULL,
  dt_inicio_alocacao DATE NULL,
  hora_inicio_alocacao TIME NULL,
  km_inicial FLOAT NULL,
  roteiro VARCHAR(255) NULL,
  km_rodados FLOAT NULL,
  data_final_alocacao DATE NULL,
  hora_final_alocacao TIME NULL,
  status INTEGER  NULL,
  km_final FLOAT NULL,
  PRIMARY KEY(id),
  CONSTRAINT veiculo_FKey FOREIGN KEY (veiculo_id)
      REFERENCES veiculo (id) MATCH SIMPLE ON UPDATE NO ACTION ON DELETE NO ACTION
);

CREATE TABLE alocacao_atendimento (
  id serial NOT NULL,
  atendimento_id INTEGER  NOT NULL,
  alocacao_id INTEGER  NOT NULL,
  PRIMARY KEY(id),
  CONSTRAINT alocacao_FKey FOREIGN KEY (alocacao_id)
      REFERENCES alocacao (id) MATCH SIMPLE ON UPDATE NO ACTION ON DELETE NO ACTION,
 CONSTRAINT atendimento_FKey FOREIGN KEY (atendimento_id)
      REFERENCES atendimento (id) MATCH SIMPLE ON UPDATE NO ACTION ON DELETE NO ACTION
);

CREATE TABLE operador_alocacao (
  id serial NOT NULL,
  alocacao_id INTEGER  NOT NULL,
  operador_id INTEGER  NOT NULL,
  PRIMARY KEY(id),
  CONSTRAINT alocacao_FKey FOREIGN KEY (alocacao_id)
      REFERENCES alocacao (id) MATCH SIMPLE ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT operador_FKey FOREIGN KEY (operador_id)
      REFERENCES operador (id) MATCH SIMPLE ON UPDATE NO ACTION ON DELETE NO ACTION,
);


