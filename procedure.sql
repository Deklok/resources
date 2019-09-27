DELIMITER //
CREATE FUNCTION getIdGenre(
    genre VARCHAR(30)
) RETURNS INT
BEGIN
    DECLARE result INT;
    SELECT id INTO result FROM genre WHERE name = genre;
    RETURN result;
END//

CREATE FUNCTION getGenre(
    num INT
)
RETURNS VARCHAR(30)
BEGIN
    DECLARE result VARCHAR(30);
    SELECT name INTO result FROM genre WHERE id = num LIMIT 1;
    RETURN result;
END//

CREATE FUNCTION getDivision(
    num INT
)
RETURNS VARCHAR(30)
BEGIN
    DECLARE result VARCHAR(30);
    SELECT name INTO result FROM division WHERE id = num LIMIT 1;
    RETURN result;
END//

CREATE PROCEDURE insertPlayer (
    IN nameP VARCHAR(50),
    IN genre INT,
    IN division INT,
    OUT result INT   
)
BEGIN
    SET @exists = 0;
    SELECT id INTO @exists FROM player WHERE name = nameP;
    IF @exists <= 0 THEN
        INSERT INTO player (name,idGenre,idDivision) VALUES
        (nameP,genre,division);
        SET result = 1;
    ELSE
       IF division < 2 THEN
        DELETE FROM player WHERE name = nameP;
        SET result = 2;
       ELSEIF division >= 4 THEN
        SET @mainGenre = "";
        SET @mainDivision = "";
        SELECT idGenre, idDivision INTO @mainGenre,@mainDivision FROM player WHERE name = nameP;
        IF @mainDivision > division THEN
            UPDATE player SET idDivision = division, idGenre = genre WHERE name = nameP;
        END IF;
        INSERT INTO pro (name,idMainGenre,idMainDivision,idSecondaryGenre,idSecondaryDivision) VALUES (nameP,@mainGenre,@mainDivision,genre,division);
        SET result = 3;
       ELSE
        SELECT name, getGenre(idGenre), getDivision(idDivision) FROM player WHERE name = nameP;
        SET result = 4;
       END IF;
    END IF;
END//

