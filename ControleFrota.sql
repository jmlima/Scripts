CREATE TABLE abastecimeto (
  id serial NOT NULL,
  combustivel_contratado_id INTEGER  NOT NULL,
  veiculo_id INTEGER  NOT NULL,
  data_abastecimento DATE NULL,
  hora_abastecimento TIME NULL,
  qtd_litros FLOAT NULL,
  quilometragem FLOAT NULL,
  valor_litro DECIMAL NULL,
  valor_total DECIMAL NULL,
  CONSTRAINT abastecimento_PKey PRIMARY KEY (id ),
  CONSTRAINT combustivel_contratado_FKey FOREIGN KEY (combustivel_contratado_id)
      REFERENCES combustivel_contratado (id) MATCH SIMPLE ON UPDATE NO ACTION ON DELETE NO ACTION
  CONSTRAINT veiculo_FKey FOREIGN KEY (veiculo_id)
      REFERENCES veiculo(id) MATCH SIMPLE ON UPDATE NO ACTION ON DELETE NO ACTION
);

CREATE TABLE combustivel_contratado (
  id serial NOT NULL,
  contrato_id INTEGER  NOT NULL,
  tipo VARCHAR(80) NULL,
  distribuidora VARCHAR(100) NULL,
  qtd_contratada INTEGER  NULL,
  CONSTRAINT combustivel_contratado_PKey PRIMARY KEY (id ),
  CONSTRAINT contrato_FKey FOREIGN KEY (contrato_id)
      REFERENCES contrato (id) MATCH SIMPLE ON UPDATE NO ACTION ON DELETE NO ACTION
);

CREATE TABLE contrato (
  id serial NOT NULL,
  num_contrato VARCHAR(80) NULL,
  data_vigencia_inicial DATE NULL,
  data_vigencia_final DATE NULL,
  PRIMARY KEY(id)
);

CREATE TABLE manutencao (
  id serial NOT NULL,
  status_vtr_id INTEGER  NOT NULL,
  registro_preventivo_id INTEGER  NULL,
  veiculo_id INTEGER  NOT NULL,
  data_inicial DATE NULL,
  hora_inicial TIME NULL,
  data_final DATE NULL,
  hora_final TIME NULL,
  observacao TEXT NULL,
  CONSTRAINT manutencao_PKey PRIMARY KEY (id ),
  CONSTRAINT veiculo_FKey FOREIGN KEY (veiculo_id)
      REFERENCES veiculo (id) MATCH SIMPLE ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT registro_preventivo_FKey FOREIGN KEY (registro_preventivo_id)
      REFERENCES registro_preventivo (id) MATCH SIMPLE ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT status_vtr_FKey FOREIGN KEY (status_vtr_id)
      REFERENCES status_vtr (id) MATCH SIMPLE ON UPDATE NO ACTION ON DELETE NO ACTION
);

CREATE TABLE modelo_vtr (
  id serial NOT NULL,
  montadora_vtr_id INTEGER  NOT NULL,
  nome VARCHAR(80) NULL,
  PRIMARY KEY(id),
  CONSTRAINT montadora_vtr_FKey FOREIGN KEY (montadora_vtr_id)
      REFERENCES montadora_vtr (id) MATCH SIMPLE ON UPDATE NO ACTION ON DELETE NO ACTION
);

CREATE TABLE montadora_vtr (
  id serial NOT NULL,
  nome VARCHAR(80) NULL,
  PRIMARY KEY(id)
);

CREATE TABLE registro_preventivo (
  id serial NOT NULL,
  veiculo_id INTEGER  NOT NULL,
  tipo_preventivo VARCHAR(100) NULL,
  periodo VARCHAR(80) NULL,
  km_prevencao FLOAT NULL,
  PRIMARY KEY(id),
  CONSTRAINT veiculo_FKey FOREIGN KEY (veiculo_id)
      REFERENCES veiculo (id) MATCH SIMPLE ON UPDATE NO ACTION ON DELETE NO ACTION
 
);

CREATE TABLE status_vtr (
  id serial NOT NULL,
  tipo VARCHAR(80) NULL,
  PRIMARY KEY(id)
);

CREATE TABLE veiculo (
  id serial NOT NULL,
  montadora_vtr_id INTEGER  NOT NULL,
  status_vtr_id INTEGER  NOT NULL,
  placa VARCHAR(50) NULL,
  chassi VARCHAR(50) NULL,
  codigo INTEGER  NULL,
  PRIMARY KEY(id),
  CONSTRAINT status_vtr_FKey FOREIGN KEY (status_vtr_id)
      REFERENCES status_vtr (id) MATCH SIMPLE ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT montadora_vtr_FKey FOREIGN KEY (montadora_vtr_id)
      REFERENCES montadora_vtr (id) MATCH SIMPLE ON UPDATE NO ACTION ON DELETE NO ACTION
);

CREATE TABLE veiculo_complementos (
  id serial NOT NULL,
  veiculo_id INTEGER  NOT NULL,
  ano INTEGER  NULL,
  ano_fabricado INTEGER  NULL,
  portas INTEGER  NULL,
  cor VARCHAR(50) NULL,
  num_renavam INTEGER  NULL,
  num_motor INTEGER  NULL,
  cilindradas INTEGER  NULL,
  num_cilindros INTEGER  NULL,
  potencia INTEGER  NULL,
  tipo_cambio VARCHAR(80) NULL,
  observacao TEXT NULL,
  capacidade_tanque FLOAT NULL,
  adicionais VARCHAR(80) NULL,
  media_consumo FLOAT NULL,
  tipo_combustivel VARCHAR(80) NULL,
  PRIMARY KEY(id),
  CONSTRAINT veiculo_FKey FOREIGN KEY (veiculo_id)
      REFERENCES veiculo (id) MATCH SIMPLE ON UPDATE NO ACTION ON DELETE NO ACTION
);


