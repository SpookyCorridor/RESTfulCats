CREATE TABLE fonts;

\c restfulfonts

CREATE TABLE fonts (id SERIAL PRIMARY KEY, name VARCHAR(255), weight VARCHAR(255), serif BOOLEAN);
