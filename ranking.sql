/* Disclaimer:
This database structure is horrible, it is only for educational purposes

Context: Generic database for online game ranking
*/

CREATE TABLE division (
    id int not null auto_increment,
    name varchar(20),
    PRIMARY KEY(id)
);


CREATE TABLE genre (
    id int not null auto_increment,
    name varchar(30),
    PRIMARY KEY(id)
);

CREATE TABLE player (
    id int not null auto_increment,
    name varchar(50) not null,
    idGenre int not null,
    idDivision int not null,
    PRIMARY KEY(id),
    FOREIGN KEY(idGenre) REFERENCES genre(id),
    FOREIGN KEY(idDivision) REFERENCES division(id)
);

CREATE TABLE pro (
    id int not null auto_increment,
    name varchar(50) not null,
    idMainGenre int not null,
    idMainDivision int not null,
    idSecondaryGenre int not null,
    idSecondaryDivision int not null,
    PRIMARY KEY(id),
    FOREIGN KEY(idMainGenre) REFERENCES genre(id),
    FOREIGN KEY(idMainDivision) REFERENCES division(id),
    FOREIGN KEY(idSecondaryGenre) REFERENCES genre(id),
    FOREIGN KEY(idSecondaryDivision) REFERENCES division(id)
);

INSERT INTO division (name) VALUES 
("Bronce"),("Silver"),("Gold"),("Platinum"),("Diamond");
    
INSERT INTO genre (name) VALUES
("FPS"),("MOBA"),("RTS"),("Sports"),("BR"),("Fighthing");

INSERT INTO player (name,idGenre,idDivision) VALUES
("Mawuf",2,5),("Rush",3,3),("Taurus",1,1);

INSERT INTO pro (name,idMainGenre,idMainDivision,idSecondaryGenre,idSecondaryDivision) VALUES
("xXxNoobMasterxXx",1,5,5,4);
