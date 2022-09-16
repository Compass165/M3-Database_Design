CREATE DATABASE QuanLyBanHang;

USE QuanLyBanHang;

CREATE TABLE Customer
(
	cID				INT				NOT NULL AUTO_INCREMENT PRIMARY KEY,
    cName			VARCHAR(50)		NOT NULL,
    cAge			TINYINT			NOT NULL CHECK ( cAge >= 6 )
);

CREATE TABLE Orderr
(
	oID				INT				NOT NULL AUTO_INCREMENT PRIMARY KEY,
    cID				INT				NOT NULL UNIQUE,
    oDate			DATETIME		NOT NULL,
    oTotalPrice		FLOAT			NOT NULL DEFAULT 0,
    FOREIGN KEY (cID)	REFERENCES Customer	(cID)
);

CREATE TABLE Product
(
	pID				INT				NOT NULL AUTO_INCREMENT PRIMARY KEY,
    pName			VARCHAR(50)		NOT NULL,
    pPrice			INT				NOT NULL DEFAULT 0
);

CREATE TABLE OrderDetail
(
	oID				INT				NOT NULL,
    pID				INT				NOT NULL,
    odQTY			INT				NOT NULL,
    PRIMARY KEY (oID, pID),
    FOREIGN KEY	(oID)	REFERENCES	Orderr	(oID),
    FOREIGN KEY	(pID)	REFERENCES	Product	(pID)
);
