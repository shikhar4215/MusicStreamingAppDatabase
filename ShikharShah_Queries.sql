-- Q-1 Showing all genres and how many songs by each genre.
SELECT g.name AS Genres, COUNT(s.songName) AS "Number of songs"
FROM songs s 
JOIN genres g 
ON s.genres_idgenres1=g.idgenres 
GROUP BY g.name
ORDER BY COUNT(s.songName);

-- Q-2 Most album released by singer in a year.
SELECT Year(a.releaseDate) AS "Release year", s.name AS "Singer's name", COUNT(a.releaseDate) AS "Number of album"
FROM albums a 
JOIN singers s 
JOIN albums_has_singers ahs 
ON a.idalbums = ahs.albums_idalbums AND s.idsingers = ahs.singers_idsingers
GROUP BY s.name, YEAR(releaseDate) 
ORDER BY COUNT(*) DESC LIMIT 1;

-- Q-3 Most popular membership.
SELECT m.type AS "Membership type", COUNT(*) AS "Total users"
FROM membershiptype m JOIN users_has_membershiptype um
ON um.memberShipType_idmemberShipType = m.idmemberShipType
GROUP BY um.memberShipType_idmemberShipType
HAVING COUNT(*) = (
	SELECT MAX(Number) 
	FROM (
			SELECT memberShipType_idmemberShipType,COUNT(*) AS Number 
            FROM users_has_membershiptype 
            GROUP BY memberShipType_idmemberShipType
		 ) u
);

-- Q-4 Country with most subscriber.
SELECT co.countryName, COUNT(*) AS "Total people from one country"
FROM users u 
JOIN countries co
ON u.countries_idcountries = co.idcountries
GROUP BY countryName
ORDER BY COUNT(*) DESC LIMIT 1;

-- Q-5 Which gender has purchase most number of membership?
DROP PROCEDURE IF EXISTS genderWithMembership;
DELIMITER //
CREATE PROCEDURE genderWithMembership()
BEGIN
DECLARE countfemale INT;
DECLARE countmale INT;
 	SELECT COUNT(*) INTO countfemale FROM users WHERE gender='F';
 	SELECT COUNT(*) INTO countmale FROM users WHERE gender='M';
    
    IF countfemale > countmale THEN 
		SELECT "Female have most number of subscriber with" AS "MOST SUBSCRIBERS",countfemale AS COUNT;
	ELSE
		SELECT "Male have most number of subscriber with" AS "MOST SUBSCRIBERS",countmale AS COUNT;
	END IF;
END //

DELIMITER ;
CALL my_db.genderWithMembership();

-- Q-6 List how many users the system has by location (Country, Province, and City), and then sort them.
SELECT c.cityName, p.provinceName, co.countryName, COUNT(*) AS "Total people from one city"
FROM users u JOIN cities c
ON u.cities_idcities = c.idcities
JOIN provinces p
ON p.idProvinces = c.Provinces_idProvinces
JOIN countries co
ON p.countries_idcountries = co.idcountries
GROUP BY countryName, provinceName,cityName
ORDER BY COUNT(*);

-- Q-7 List how many distinct albums each singer has.
SELECT name , COUNT(*) as "Number of Albums" 
FROM singers 
JOIN albums_has_singers ON singers.idsingers=albums_has_singers.singers_idsingers 
GROUP BY singers_idsingers 
ORDER BY COUNT(*) DESC;

-- Q-8 Which Membership is most popular by age? 
SELECT type AS "Membership_Type",YEAR(CURDATE()) - AGE AS Age 
FROM 
(
	SELECT u.first_name, m.idmemberShipType,m.type,YEAR(u.dateOfBirth) AS AGE
	FROM users u 
	JOIN users_has_membershiptype uhm 
	JOIN membershiptype m 
	ON u.idusers=uhm.users_idusers 
	AND m.idmemberShipType=uhm.memberShipType_idmemberShipType
    ) T
GROUP BY AGE 
ORDER BY idmemberShipType DESC LIMIT 1;

-- Q-9 Top 5 most listened songs.
SELECT songName,COUNT(*) AS "Time Played" 
FROM songs s
JOIN songs_listen_by_users sl 
ON s.idsongs = sl.songs_idsongs
GROUP BY sl.songs_idsongs
ORDER BY COUNT(*) DESC LIMIT 5;

-- Q-10 Most and less popular payment method and how many times they were used?
DROP PROCEDURE IF EXISTS paymethodUsed;
DELIMITER //
CREATE PROCEDURE paymethodUsed()
BEGIN
	DECLARE leastMethodUsed VARCHAR(105);
	DECLARE maxMethodUsed VARCHAR(105);
    SELECT CONCAT(MethodType ," Method is  Least Popular With ", NUMBER ," Time Used") INTO leastMethodUsed 
	FROM (SELECT MethodType,COUNT(*) AS NUMBER FROM paymentmethod
		  GROUP BY MethodType
         )t WHERE NUMBER = (SELECT MIN(NUM) 
					FROM (SELECT COUNT(*) AS NUM FROM paymentmethod
					GROUP BY MethodType) x);    
	SELECT CONCAT(MethodType ," Method is  Most Popular With ", NUMBER ," Time Used") INTO maxMethodUsed 
	FROM (SELECT MethodType,COUNT(*) AS NUMBER FROM paymentmethod
		  GROUP BY MethodType 
		 )t WHERE NUMBER = (SELECT MAX(NUM) 
					FROM (SELECT COUNT(*) AS NUM FROM paymentmethod
					GROUP BY MethodType) x);
    SELECT maxMethodUsed AS "Most Popular Payment Method" ,  leastMethodUsed AS "Least Popular Payment Method";
END//
DELIMITER ;
CALL my_db.paymethodUsed();

-- Q-11 Top 3 singers with least number of songs. 
SELECT s.name AS "Singer's name", COUNT(so.idsongs) AS "Number of songs" 
FROM singers s 
JOIN songs so 
ON s.idsingers=so.singers_idsingers 
GROUP BY s.name 
ORDER BY COUNT(so.idsongs) ASC LIMIT 3;