CREATE TABLE Users (
    nom TEXT PRIMARY KEY,
    hashmdp TEXT NOT NULL
);

CREATE TABLE Tokens (
    tokenid         TEXT PRIMARY KEY,
    username        TEXT REFERENCES Users(nom),
    expiration_date DATE NOT NULL
);

CREATE TABLE Portfolio (
    id SERIAL PRIMARY KEY,
    username TEXT REFERENCES Users(nom),

    nom TEXT,
    descr TEXT,
    email TEXT,
    phone TEXT,
    img TEXT
);

CREATE TABLE Projet (
    id SERIAL PRIMARY KEY,
    nom TEXT NOT NULL,
    descr TEXT,
    img TEXT,
    folio INT REFERENCES Portfolio(id)
);

CREATE TABLE Competence (
    id SERIAL PRIMARY KEY,
    nom TEXT NOT NULL,
    descr TEXT
    folio INT REFERENCES Portfolio(id)
);

CREATE TABLE CompetencesProjets (
    idComp INT REFERENCES Portfolio(id),
    idProj INT REFERENCES Competence(id),
    PRIMARY KEY(idComp, idProj)
);

