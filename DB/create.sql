CREATE TABLE Users (
    nom TEXT PRIMARY KEY,
    hashmdp TEXT NOT NULL
);

CREATE TABLE Tokens (
    tokenid TEXT PRIMARY KEY,
    username TEXT REFERENCES Users(nom),
    expiration_date DATE NOT NULL
);