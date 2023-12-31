/* ESTE SCRIPT CONTÊM OS COMANDOS PARA A CRIAÇÃO DAS TABELAS ATUALIZADAS DO BANCO DE DADOS
DO GRUPO FIVETECH, DA 1TDSPW, PARTICIPANTE DO CHALLENGE DA PORTO SEGURO.

MEMBROS DA FIVETECH:
BRUNO FRANCISCO BRITO DE PAULA - 552226
EDWARD DE LIMA SILVA - 98676
IAN NAVAS - 550133
MIGUEL MARIO GRANITO - 99850
PEDRO HENRIQUE CHERSONI LINS - 99866 */

-- DROPANDO TODAS AS TABELAS
DROP TABLE T_POR_GUINCHO_AVISO;
DROP TABLE T_POR_AVISO_SINISTRO;
DROP TABLE T_POR_SINISTRO;
DROP TABLE T_POR_LOCAL_SINISTRO;
DROP TABLE T_POR_GUINCHO;
DROP TABLE T_POR_PRESTADOR_SERVICO;
DROP TABLE T_POR_CONTRATO;
DROP TABLE T_POR_VEICULO;
DROP TABLE T_POR_LOGIN_CLIENTE;
DROP TABLE T_POR_ENDERECO_CLIENTE;
DROP TABLE T_POR_TELEFONE_CLIENTE;
DROP TABLE T_POR_CLIENTE;


-- RECRIANDO TODAS AS TABELAS
-- CLIENTE
CREATE TABLE T_POR_CLIENTE(
    -- PRIMARY KEY
    id_cliente INT CONSTRAINT T_POR_id_cliente NOT NULL,
    CONSTRAINT T_POR_pk_cliente PRIMARY KEY(id_cliente),
    -- UNIQUE
    nr_cpf VARCHAR(15) CONSTRAINT T_POR_nr_cpf NOT NULL,
    CONSTRAINT T_POR_uk_nr_cpf UNIQUE(nr_cpf),
    -- NOT NULL
    nome_completo VARCHAR(80) CONSTRAINT T_POR_nome_completo NOT NULL,
    idade NUMBER(3,0) CONSTRAINT T_POR_idade NOT NULL,
    dt_nascimento DATE CONSTRAINT T_POR_dt_nascimento NOT NULL,
    -- NULLABLE
    genero VARCHAR(15));

-- LOGIN DO CLIENTE
CREATE TABLE T_POR_LOGIN_CLIENTE(
    -- PRIMARY KEY
    id_login_cliente INT CONSTRAINT T_POR_id_login NOT NULL,
    CONSTRAINT T_POR_pk_login PRIMARY KEY(id_login_cliente),
    -- FOREIGN KEY
    id_cliente INT CONSTRAINT T_POR_fk_log_id_cliente
    REFERENCES T_POR_CLIENTE(id_cliente) NOT NULL,
    -- NOT NULL
    email_login VARCHAR(100) CONSTRAINT T_POR_email_login NOT NULL,
    senha_login VARCHAR(25) CONSTRAINT T_POR_senha_login NOT NULL,
    -- NULLABLE
    st_login CHAR(1));
    
    
-- TELEFONE DO CLIENTE    
CREATE TABLE T_POR_TELEFONE_CLIENTE(
    --PRIMARY KEY
    id_telefone_cliente INT CONSTRAINT T_POR_id_telefone NOT NULL,
    CONSTRAINT T_POR_pk_telefone PRIMARY KEY(id_telefone_cliente),
    -- FOREIGN KEY
    id_cliente INT CONSTRAINT T_POR_fk_tel_id_cliente
    REFERENCES T_POR_CLIENTE(id_cliente) NOT NULL,
    -- NOT NULL
    nr_ddi NUMERIC(3) CONSTRAINT T_POR_nr_ddi NOT NULL,
    nr_ddd NUMERIC(3) CONSTRAINT T_POR_nr_ddd NOT NULL,
    nr_telefone NUMERIC(10) CONSTRAINT T_POR_nr_telefone NOT NULL,
    tp_telefone VARCHAR(20) CONSTRAINT T_POR_tp_telefone NOT NULL,
    st_telefone CHAR(1) CONSTRAINT T_POR_st_telefone NOT NULL);

-- ENDEREÇO DO CLIENTE    
CREATE TABLE T_POR_ENDERECO_CLIENTE(
    -- PRIMARY KEY
    id_endereco_cliente INT CONSTRAINT T_POR_id_endereco NOT NULL,
    CONSTRAINT T_POR_pk_endereco PRIMARY KEY(id_endereco_cliente),
    -- FOREIGN KEY
    id_cliente INT CONSTRAINT T_POR_fk_end_cliente
    REFERENCES T_POR_CLIENTE(id_cliente) NOT NULL,
    -- NULLABLE
    nr_casa NUMERIC(7),
    rua VARCHAR(35),
    cidade VARCHAR(30),
    estado VARCHAR(20),
    nm_cep NUMERIC(8));
     
-- VEÍCULO
CREATE TABLE T_POR_VEICULO(
    -- PRIMARY KEY
    id_veiculo INT CONSTRAINT T_POR_id_veiculo NOT NULL,
    CONSTRAINT T_POR_pk_veiculo PRIMARY KEY(id_veiculo),
    -- FOREIGN KEYS
    id_cliente INT CONSTRAINT T_POR_fk_vei_id_cliente
    REFERENCES T_POR_CLIENTE(id_cliente) NOT NULL,
    -- UNIQUE
    nm_chassi VARCHAR(17) CONSTRAINT T_POR_nm_chassi NOT NULL,
    CONSTRAINT T_POR_uk_nm_chassi UNIQUE(nm_chassi),
    -- NOT NULL
    marca VARCHAR(30) CONSTRAINT T_POR_marca NOT NULL,
    modelo VARCHAR(45) CONSTRAINT T_POR_modelo NOT NULL,
    nm_ano SMALLINT CONSTRAINT T_POR_nm_ano NOT NULL,
    nm_placa VARCHAR(7) CONSTRAINT T_POR_nm_placa NOT NULL,
    -- NULLABLE
    blindagem CHAR(1),
    tp_combustivel VARCHAR(25));
    
-- CONTRATO
CREATE TABLE T_POR_CONTRATO(
    -- PRIMARY KEY
    id_contrato INT CONSTRAINT T_POR_id_contrato NOT NULL,
    CONSTRAINT T_POR_pk_contrato PRIMARY KEY(id_contrato),
    -- FOREIGN KEY
    id_cliente INT CONSTRAINT T_POR_fk_con_id_cliente
    REFERENCES T_POR_CLIENTE(id_cliente) NOT NULL,
    --
    id_veiculo INT CONSTRAINT T_POR_fk_con_id_veiculo
    REFERENCES T_POR_VEICULO(id_veiculo) NOT NULL,
    -- NOT NULL
    nm_apolice NUMERIC(11) CONSTRAINT T_POR_nm_apolice NOT NULL,
    tp_cobertura VARCHAR(35) CONSTRAINT T_POR_tp_cobertura NOT NULL,
    vl_franquia DECIMAL(7) CONSTRAINT T_POR_vl_franquia NOT NULL,
    dt_inicio DATE CONSTRAINT T_POR_dt_inicio NOT NULL,
    dt_fim DATE CONSTRAINT T_POR_dt_fim NOT NULL,
    -- NULLABLE
    clausulas VARCHAR(65));    
    
-- PRESTADOR DE SERVIÇO
CREATE TABLE T_POR_PRESTADOR_SERVICO(
    -- PRIMARY KEY
    id_prestador_servico INT CONSTRAINT T_POR_id_prestador_servico NOT NULL,
    CONSTRAINT T_POR_pk_prestador PRIMARY KEY(id_prestador_servico),
    -- NOT NULL
    razao_social VARCHAR(120) CONSTRAINT T_POR_razao_social NOT NULL,
    nr_cnpj VARCHAR(14) CONSTRAINT T_POR_nr_cnpj NOT NULL,
    nr_telefone VARCHAR(15) CONSTRAINT T_POR_nr_telefone_prestador NOT NULL);
    
-- GUINCHO
CREATE TABLE T_POR_GUINCHO(
    -- PRIMARY KEY
    id_guincho INT CONSTRAINT T_POR_id_guincho NOT NULL,
    CONSTRAINT T_POR_pk_guincho PRIMARY KEY(id_guincho),
    -- FOREIGN KEY
    id_prestador_servico INT CONSTRAINT T_POR_fk_gui_id_prestador
    REFERENCES T_POR_PRESTADOR_SERVICO(id_prestador_servico),
    -- NOT NULL
    tp_classificacao VARCHAR(25) CONSTRAINT T_POR_tp_classificacao NOT NULL,
    tp_modal VARCHAR(60) CONSTRAINT T_POR_tp_modal NOT NULL);

-- LOCAL SINISTRO
CREATE TABLE T_POR_LOCAL_SINISTRO(
    -- PRIMARY KEY
    id_local_sinistro INT CONSTRAINT T_POR_id_local_sinistro NOT NULL,
    CONSTRAINT T_POR_pk_local_sinistro PRIMARY KEY(id_local_sinistro),
    -- NOT NULL
    nr_rua NUMERIC(7) CONSTRAINT T_POR_nr_rua_sinistro NOT NULL,
    nm_rua VARCHAR(45) CONSTRAINT T_POR_nm_rua_sinistro NOT NULL,
    sentido_rua CHAR(1) CONSTRAINT T_POR_sentido_rua NOT NULL,
    -- NULLABLE
    latitude DECIMAL(10,8),
    longitude DECIMAL(9,6));

-- SINISTRO
CREATE TABLE T_POR_SINISTRO(
    -- PRIMARY KEY
    id_sinistro INT CONSTRAINT T_POR_id_sinistro NOT NULL,
    CONSTRAINT T_POR_pk_sinistro PRIMARY KEY(id_sinistro),
    -- FOREIGN KEY
    id_local_sinistro INT CONSTRAINT T_POR_fk_id_local_sinistro
    REFERENCES T_POR_LOCAL_SINISTRO(id_local_sinistro) NOT NULL,
    -- NOT NULL
    tp_sinistro VARCHAR(25) CONSTRAINT T_POR_tp_sinistro NOT NULL,
    causa_sinistro VARCHAR(35) CONSTRAINT T_POR_causa_sinistro NOT NULL,
    -- NULLABLE
    descricao_sinistro VARCHAR(70));
    
-- AVISO SINISTRO
CREATE TABLE T_POR_AVISO_SINISTRO(
    -- PRIMARY KEY
    id_aviso_sinistro INT CONSTRAINT T_POR_id_aviso NOT NULL,
    CONSTRAINT T_POR_pk_aviso PRIMARY KEY(id_aviso_sinistro),
    -- FOREIGN KEYS
    id_cliente INT CONSTRAINT T_POR_fk_avi_id_cliente
    REFERENCES T_POR_CLIENTE(id_cliente) NOT NULL,
    --
    id_sinistro INT CONSTRAINT T_POR_fk_avi_id_sinistro
    REFERENCES T_POR_SINISTRO(id_sinistro) NOT NULL,
    --
    id_veiculo INT CONSTRAINT T_POR_fk_avi_id_veiculo
    REFERENCES T_POR_VEICULO(id_veiculo) NOT NULL,
    -- NOT NULL
    dt_hr_aviso TIMESTAMP CONSTRAINT T_POR_dt_hr_aviso NOT NULL);
    
-- GUINCHO(S) DO AVISO - TABELA ASSOCIATIVA
CREATE TABLE T_POR_GUINCHO_AVISO(
    -- PRIMARY KEY
    id_guincho_aviso INT CONSTRAINT T_POR_id_guincho_aviso NOT NULL,
    CONSTRAINT T_POR_pk_guincho_aviso PRIMARY KEY(id_guincho_aviso),
    -- FOREIGN KEYS
    id_guincho INT CONSTRAINT T_POR_fk_gav_id_guincho
    REFERENCES T_POR_GUINCHO(id_guincho) NOT NULL,
    --
    id_aviso_sinistro INT CONSTRAINT T_POR_fk_gav_id_aviso_sinistro
    REFERENCES T_POR_AVISO_SINISTRO(id_aviso_sinistro) NOT NULL);

-- CRIANDOS SEQUENCES
-- TABELAS COM DADOS
CREATE SEQUENCE T_POR_CLIENTE_seq START WITH 10 INCREMENT BY 1;
CREATE SEQUENCE T_POR_CONTRATO_seq START WITH 10 INCREMENT BY 1;
CREATE SEQUENCE T_POR_VEICULO_seq START WITH 10 INCREMENT BY 1;
-- TABELAS SEM DADOS
CREATE SEQUENCE T_POR_TELEFONE_CLIENTE_seq START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE T_POR_ENDERECO_CLIENTE_seq START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE T_POR_LOGIN_CLIENTE_seq START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE T_POR_LOCAL_SINISTRO_seq START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE T_POR_AVISO_SINISTRO_seq START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE T_POR_SINISTRO_seq START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE T_POR_GUINCHO_seq START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE T_POR_GUINCHO_AVISO_seq START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE T_POR_PRESTADOR_SERVICO_seq START WITH 1 INCREMENT BY 1;
