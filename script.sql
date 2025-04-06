CREATE TABLE medico(
	id SERIAL PRIMARY KEY,
	nome VARCHAR(100) NOT NULL,
	email VARCHAR(50) NOT NULL,
	telefone VARCHAR(11) NOT NULL,
	crm VARCHAR(20) UNIQUE NOT NULL,
	especialidade VARCHAR(35) NOT NULL CHECK (especialidade IN ('Ortopedia', 'Cardiologia', 'Ginecologista', 'Dermatologia')),
	logradouro VARCHAR(100) NOT NULL,
	numero VARCHAR (10),
	complemento VARCHAR(100),
	bairro VARCHAR(100) NOT NULL,
	ativo BOOLEAN DEFAULT TRUE
);

CREATE TABLE paciente(
	id SERIAL PRIMARY KEY,
	nome VARCHAR(100) NOT NULL,
	email VARCHAR(50) NOT NULL,
	telefone VARCHAR(11) NOT NULL,
	cpf VARCHAR (11) UNIQUE NOT NULL,
	logradouro VARCHAR(100) NOT NULL,
	numero VARCHAR (10) NOT NULL,
	complemento VARCHAR(100),
	bairro VARCHAR(100) NOT NULL,
	cidade VARCHAR(100) NOT NULL,
	uf VARCHAR(9) NOT NULL,
	cep VARCHAR(9) NOT NULL,
	ativo BOOLEAN DEFAULT TRUE
);

CREATE TABLE consulta (
    id SERIAL PRIMARY KEY,
    paciente_id INT NOT NULL,
    medico_id INT NOT NULL,
    data_hora TIMESTAMP NOT NULL,
    motivo_cancelamento VARCHAR(50),
    cancelada BOOLEAN DEFAULT FALSE,
    FOREIGN KEY (paciente_id) REFERENCES paciente(id),
    FOREIGN KEY (medico_id) REFERENCES medico(id)
);
