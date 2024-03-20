CREATE TABLE tb_projetos(
cod_projeto	INTEGER,
nm_projeto	VARCHAR(40),

CONSTRAINT pk_cod_projeto PRIMARY KEY(cod_projeto)
);

CREATE TABLE tb_departamentos(
sigla_dep	VARCHAR(3),
nm_dep 		VARCHAR(20),
ramal_dep	INTEGER,

CONSTRAINT pk_sigla_dep PRIMARY KEY(sigla_dep)
);

DROP TABLE tb_funcionario CASCADE;

CREATE TABLE tb_funcionario(
matricula_func	INTEGER,
sigla_dep		VARCHAR(3) CONSTRAINT nn_tb_func_sigla_dep NOT NULL,
nm_func			VARCHAR(40),
dt_adms_func	DATE,
dt_nasc_func	DATE,
dt_lotacao		DATE,
	
CONSTRAINT pk_mat_fun PRIMARY KEY(matricula_func),
CONSTRAINT fk_sigla_dep FOREIGN KEY(sigla_dep)
	REFERENCES tb_departamentos(sigla_dep)
);

CREATE TABLE tb_alocado(
cod_proj_aloc	INTEGER,
mat_func_aloc	INTEGER,
dt_aloc			DATE,
	
CONSTRAINT pk_cod_proj_aloc_mat_func_aloc PRIMARY KEY(cod_proj_aloc, mat_func_aloc),
CONSTRAINT fk_cod_proj_aloc FOREIGN KEY(cod_proj_aloc)
	REFERENCES tb_projetos(cod_projeto),
CONSTRAINT fk_mat_func_aloc FOREIGN KEY(mat_func_aloc)
	REFERENCES tb_funcionario(matricula_func)
);
