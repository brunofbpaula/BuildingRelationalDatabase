CREATE TABLE T_RHSTU_PLANO_SAUDE(
    -- PRIMARY KEY
    id_plano_saude NUMERIC(5) CONSTRAINT id_plano_saude NOT NULL,
    CONSTRAINT pk_id_plano_saude PRIMARY KEY(id_plano_saude),
    -- VARIABLES
    ds_razao_social VARCHAR(70) CONSTRAINT ds_razao_social NOT NULL,
    nm_fantasia_plano_saude VARCHAR(80),
    ds_plano_saude VARCHAR(100) CONSTRAINT ds_plano_saude NOT NULL,
    nr_cnpj NUMERIC(14) CONSTRAINT nr_cnpj NOT NULL,
    nm_contato VARCHAR(30),
    ds_telefone VARCHAR(30),
    dt_inicio DATE NOT NULL,
    dt_fim DATE);

CREATE TABLE T_RHSTU_AUTENTICA(
     -- PRIMARY KEY
    id_autentica NUMERIC CONSTRAINT id_autentica NOT NULL,
    CONSTRAINT pk_id_autentica PRIMARY KEY(id_autentica),
    -- VARIABLES
    login VARCHAR(100),
    senha VARCHAR(100),
    st_login CHAR(1));

CREATE TABLE T_RHSTU_FUNCIONARIO(
     -- PRIMARY KEY
    id_funcionario NUMERIC CONSTRAINT id_funcionario NOT NULL,
    CONSTRAINT pk_funcionario PRIMARY KEY(id_funcionario),
    -- FOREIGN KEY
    id_autentica NUMERIC CONSTRAINT fk_fun_autentica 
    REFERENCES T_RHSTU_AUTENTICA(id_autentica) NOT NULL,
    -- VARIABLES
    nm_funcionario VARCHAR(255),
    fl_sexo CHAR(1),
    ds_escolaridade VARCHAR(40),
    dt_nascimento DATE);

CREATE TABLE T_RHTSU_PACIENTE(
     -- PRIMARY KEY
    id_paciente NUMERIC(9) CONSTRAINT id_paciente NOT NULL,
    CONSTRAINT pk_paciente PRIMARY KEY(id_paciente),
    -- VARIABLES
    nm_paciente VARCHAR(80) CONSTRAINT nm_paciente NOT NULL,
    nr_cpf NUMERIC(12) CONSTRAINT nr_cpf NOT NULL,
    nr_rg VARCHAR(15),
    dt_nascimento DATE CONSTRAINT dt_nascimento NOT NULL,
    fl_sexo CHAR(1) CONSTRAINT fl_sexo NOT NULL,
    ds_escolaridade VARCHAR(40) CONSTRAINT ds_escolaridade NOT NULL,
    ds_estado_civil VARCHAR(25) CONSTRAINT ds_estado_civil NOT NULL,
    tip_grupo_sanguineo VARCHAR(6) CONSTRAINT tip_grupo_sanguineo NOT NULL,
    nr_altura NUMERIC(3,2) CONSTRAINT nr_altura NOT NULL,
    nr_peso NUMERIC(4,1) CONSTRAINT nr_peso NOT NULL,
    -- FOREIGN KEY
    id_autentica NUMERIC CONSTRAINT fk_pac_autentica
    REFERENCES T_RHSTU_AUTENTICA(id_autentica) NOT NULL,
    -- UNIQUE
    CONSTRAINT uk_nr_cpf UNIQUE(nr_cpf),
    CONSTRAINT uk_nr_rg UNIQUE(nr_rg));

CREATE TABLE T_RHTSU_EMAIL_PACIENTE(
    -- PRIMARY KEY
    id_email NUMERIC(9) CONSTRAINT id_email NOT NULL,
    CONSTRAINT pk_id_email PRIMARY KEY(id_email),
    -- FOREIGN KEY
    id_paciente NUMERIC(9) CONSTRAINT fk_email_id_paciente
    REFERENCES T_RHTSU_PACIENTE(id_paciente) NOT NULL,
    -- VARIABLES
    ds_email VARCHAR(100) CONSTRAINT ds_email NOT NULL,
    tp_email VARCHAR(20) CONSTRAINT tp_email NOT NULL,
    st_email CHAR(1) CONSTRAINT st_email NOT NULL);
    
CREATE TABLE T_RHTSU_TELEFONE_PACIENTE(
    -- PRIMARY KEY
    id_telefone NUMERIC(9) CONSTRAINT id_telefone NOT NULL,
    CONSTRAINT pk_id_telefone PRIMARY KEY(id_telefone),
    -- FOREIGN KEY
    id_paciente NUMERIC(9) CONSTRAINT fk_tel_id_paciente
    REFERENCES T_RHTSU_PACIENTE(id_paciente) NOT NULL,
    -- PROMOVE FK
    -- CONSTRAINT pfk_tel_id_paciente PRIMARY KEY(id_paciente),
    -- VARIABLES
    nr_ddi NUMERIC(3) CONSTRAINT nr_ddi NOT NULL,
    nr_ddd NUMERIC(3) CONSTRAINT nr_ddd NOT NULL,
    nr_telefone NUMERIC(10) CONSTRAINT nr_telefone NOT NULL,
    tp_telefone VARCHAR(20) CONSTRAINT tp_telefone NOT NULL,
    st_telefone CHAR(1) CONSTRAINT st_telefone NOT NULL);
    
CREATE TABLE T_RHTSU_ENDERECO_PACIENTE(
    -- PRIMARY KEY
    id_endereco NUMERIC(9) CONSTRAINT id_endereco NOT NULL,
    CONSTRAINT pk_id_endereco PRIMARY KEY(id_endereco),
    -- FOREIGN KEYS
    id_paciente NUMERIC(9) CONSTRAINT fk_end_id_paciente
    REFERENCES T_RHTSU_PACIENTE(id_paciente) NOT NULL,
    -- VARIABLES
    nr_logradouro NUMERIC(7),
    ds_complemento_numero VARCHAR(30),
    ds_ponto_referencia VARCHAR(50),
    dt_inicio DATE NOT NULL,
    dt_fim DATE);
    
CREATE TABLE T_RHTSU_PACIENTE_PLANO_SAUDE(
    -- PRIMARY KEY
    id_paciente_ps NUMERIC(10) CONSTRAINT id_paciente_ps NOT NULL,
    CONSTRAINT pk_id_paciente_ps PRIMARY KEY(id_paciente_ps),
    -- FOREIGN KEYS
    id_paciente NUMERIC(9) CONSTRAINT fk_ps_id_paciente
    REFERENCES T_RHTSU_PACIENTE(id_paciente) NOT NULL,
    --
    id_plano_saude NUMERIC(5) CONSTRAINT fk_ps_id_plano_saude
    REFERENCES T_RHSTU_PLANO_SAUDE(id_plano_saude) NOT NULL,
    -- VARIABLES
    nr_carteira_ps NUMERIC(15),
    dt_inicio DATE NOT NULL,
    dt_fim DATE);
    
CREATE TABLE T_RHTSU_TIPO_CONTATO(
    -- PRIMARY KEY
    id_tipo_contato NUMERIC(5) CONSTRAINT id_tipo_contato NOT NULL,
    CONSTRAINT pk_id_tipo_contato PRIMARY KEY(id_tipo_contato),
    -- VARIABLES
    nm_tipo_contato VARCHAR(80) CONSTRAINT nm_tipo_contato NOT NULL,
    dt_inicio DATE NOT NULL,
    dt_fim DATE);
    
CREATE TABLE T_RHTSU_CONTATO_PACIENTE(
    -- PRIMARY KEY
    id_contato NUMERIC(9) CONSTRAINT id_contato NOT NULL,
    CONSTRAINT pk_id_contato PRIMARY KEY(id_contato),
    -- FOREIGN KEYS
    id_paciente NUMERIC(9) CONSTRAINT fk_cp_id_paciente
    REFERENCES T_RHTSU_PACIENTE(id_paciente) NOT NULL,
    --
    id_tipo_contato NUMERIC(5) CONSTRAINT fk_cp_id_tipo_contato
    REFERENCES T_RHTSU_TIPO_CONTATO(id_tipo_contato) NOT NULL,
    -- PROMOVE FK
    -- CONSTRAINT pfk_cp_id_paciente PRIMARY KEY(id_paciente),
    -- VARIABLES
    nm_contato VARCHAR(40) NOT NULL,
    nr_ddi NUMERIC(3),
    nr_ddd NUMERIC(3),
    nr_telefone NUMERIC(10));
    
CREATE TABLE T_RHTSU_UNID_HOSPITALAR(
    -- PRIMARY KEY
    id_unid_hospitalar NUMERIC(9) CONSTRAINT id_unid_hospitalar NOT NULL,
    CONSTRAINT pk_id_unid_hospitalar PRIMARY KEY(id_unid_hospitalar),
    -- VARIABLE
    razao_social VARCHAR(80) CONSTRAINT razao_social NOT NULL,
    nr_logradouro NUMERIC(7),
    ds_complemento_numero VARCHAR(30),
    ds_ponto_referencia VARCHAR(50),
    dt_cadastro DATE NOT NULL,
    st_unid_hospitalar VARCHAR(10));
    
CREATE TABLE T_RHTSU_CONSULTA(
    -- PRIMARY KEY
    id_consulta NUMERIC CONSTRAINT id_consulta NOT NULL,
    CONSTRAINT pk_id_consulta PRIMARY KEY(id_consulta),
    -- FOREIGN KEYS
    id_paciente NUMERIC(9) CONSTRAINT fk_co_id_paciente
    REFERENCES T_RHTSU_PACIENTE(id_paciente) NOT NULL,
    --
    id_unid_hospitalar NUMERIC(9) CONSTRAINT fk_co_id_unid_hospitalar
    REFERENCES T_RHTSU_UNID_HOSPITALAR(id_unid_hospitalar) NOT NULL,
    -- VARIABLES
    dt_hr_consulta DATE NOT NULL,
    tp_unidade VARCHAR(255) NOT NULL,
    tp_modalidade VARCHAR(255),
    tel_central VARCHAR(14));

CREATE TABLE T_RHTSU_FORMA_PAGAMENTO(
    -- PRIMARY KEY
    id_forma_pagamento NUMERIC CONSTRAINT id_forma_pagamento NOT NULL,
    CONSTRAINT pk_id_forma_pagamento PRIMARY KEY(id_forma_pagamento),   
    -- FOREIGN KEY
    id_consulta NUMERIC CONSTRAINT fk_fp_id_consulta
    REFERENCES T_RHTSU_CONSULTA(id_consulta) NOT NULL,
    -- VARIABLES
    vl_total NUMERIC CONSTRAINT vl_total NOT NULL,
    st_forma_pagamento CHAR(1) CONSTRAINT st_forma_pagamento NOT NULL);
    
CREATE TABLE T_RHTSU_FORMA_PIX(
    -- PRIMARY KEY
    id_forma_pix NUMERIC(9) CONSTRAINT id_forma_pix NOT NULL,
    CONSTRAINT pk_id_forma_pix PRIMARY KEY(id_forma_pix),
    -- FOREIGN KEY
    id_forma_pagamento NUMERIC(9) CONSTRAINT fk_fpix_id_forma_pagamento
    REFERENCES T_RHTSU_FORMA_PAGAMENTO(id_forma_pagamento) NOT NULL,
    -- VARIABLES
    nr_transacao NUMERIC(10),
    dt_transacao DATE,
    tp_chave VARCHAR(60));
    
CREATE TABLE T_RHTSU_FORMA_CONVENIO(
    -- PRIMARY KEY
    id_forma_convenio NUMERIC(9) CONSTRAINT id_forma_convenio NOT NULL,
    CONSTRAINT pk_id_forma_convenio PRIMARY KEY(id_forma_convenio),
    -- FOREIGN KEY
    id_forma_pagamento NUMERIC(9) CONSTRAINT fk_fconv_id_forma_pagamento
    REFERENCES T_RHTSU_FORMA_PAGAMENTO(id_forma_pagamento) NOT NULL,
    -- VARIABLES
    nr_carteira NUMERIC(10),
    nr_transacao NUMERIC(10),
    dt_transacao DATE,
    dt_vencimento DATE);
    
CREATE TABLE T_RHTSU_FORMA_CARTAO(
    -- PRIMARY KEY
    id_forma_cartao NUMERIC(9) CONSTRAINT id_forma_cartao NOT NULL,
    CONSTRAINT pk_id_forma_cartao PRIMARY KEY(id_forma_cartao),
    -- FOREIGN KEY
    id_forma_pagamento NUMERIC CONSTRAINT fk_fcart_id_forma_pagamento
    REFERENCES T_RHTSU_FORMA_PAGAMENTO(id_forma_pagamento) NOT NULL,
    -- VARIABLES
    nr_cartao NUMERIC(36),
    nr_transacao NUMERIC(10),
    dt_transacao DATE,
    tp_bandeira VARCHAR(60),
    dt_vencimento DATE);