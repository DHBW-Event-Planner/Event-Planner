-- Accounts
TRUNCATE account CASCADE;
INSERT INTO account(account_id, account_username, account_email, account_salt, account_passhash, account_type)
values
    (0, 'cus_01','test1.database@gmail.com','salt','ONeTrANtIckSH','CUSTOMER'),
    (1, 'cus_02','test2.database@gmail.com','salt','ONeTrANtIckSH','CUSTOMER'),
    (2, 'cus_03','test3.database@gmail.com','salt','ONeTrANtIckSH','CUSTOMER'),
    (3, 'cus_04','test4.database@gmail.com','salt','ONeTrANtIckSH','CUSTOMER'),
    (4, 'cus_05','test5.database@gmail.com','salt','ONeTrANtIckSH','CUSTOMER'),
    (5, 'cus_06','test6.database@gmail.com','salt','ONeTrANtIckSH','CUSTOMER'),
    (6, 'cus_07','test7.database@gmail.com','salt','ONeTrANtIckSH','CUSTOMER'),
    (7, 'emp_01','test8.database@gmail.com','salt','ONeTrANtIckSH','EMPLOYEE'),
    (8, 'adm_01','test9.database@gmail.com','salt','ONeTrANtIckSH','ADMIN'),
    (9, 'adm_02','test10.database@gmail.com','salt','ONeTrANtIckSH','ADMIN');

-- Location
TRUNCATE location CASCADE;
INSERT INTO location(location_id, location_name, location_street, location_housenumber, location_postcode, location_city, location_country,location_maxticket)
VALUES
    (0,'Lanxess Arena', 'Willy-Brandt-Platz','3','50679','Köln','Deutschland', 18000),
    (1,'Lokschuppen', 'Stadtheider Straße','11','33609','Bielefeld','Deutschland', 1000),
    (2,'SoFi Stadium', 'South Prairie Avenue','1000','90301','Inglewood','USA', 100000),
    (3,'Carl Benz Arena', 'Mercedesstraße','73D','70372','Stuttgart','Deutschland', 2000),
    (4,'Merck-Stadion am Böllenfalltor', 'Nieder-Ramstädter Str.','170','64285','Darmstadt','Deutschland', 17000),
    (5,'The Rungrado 1st of May Stadium Pyongyang', '2QXG+R48','1','497335','Pyongyang','Nordkorea', 114000),
    (6,'Narendra Modi Stadium', 'Stadium Road','1','38005','Ahmedabad','Indien', 132000),
    (7,'Circus Maximus', 'Via del Circo Massimo','1','00186 ','Rom','Italien', 150000),
    (8,'KONFERENZRAUM O4', 'Business Center O4','4','68161','Mannheim','Deutschland', 8);

-- Artist
TRUNCATE artist CASCADE;
INSERT INTO artist(artist_bandname, artist_membersize, artist_founddate)
VALUES
    ('The Beach Boys',3,'1966-01-01'),
    ('The Beatles',5, '1966-01-01'),
    ('Bob Dylan',1, '1965-01-01'),
    ('Marvin Gaye',1, '1971-01-01'),
    ('The Rolling Stones',7,'1972-01-01');

-- Event
TRUNCATE event CASCADE;
INSERT INTO event(artist_id, location_id, account_id, event_id, event_title, event_description, event_date, event_starttime, event_duration)
VALUES
    (1,1,2,0,'Simply Gurus','Text','2007-02-28','23:30:00','17:39:00'),
    (2,2,3,1,'Manage Paradise','Text','2023-08-09','19:14:00','10:02:00'),
    (3,3,4,2,'Silver Concourse Mountain','2008-09-14','20:00:00','23:16:00'),
    (4,4,0,3,'Celebrate Flying Reasons','2018-01-08','23:15:00','23:07:00'),
    (5,5,5,4,'Strategic Come Attainment','2004-12-11','23:08:00','09:15:00'),
    (1,6,6,5,'Brilliant Gals','2002-08-27','22:29:00','08:00:00'),
    (2,7,7,6,'Jade Party','2023-10-09','18:53:00','00:17:00'),
    (3,8,8,7,'Nine Details','2014-06-27','00:25:00','10:37:00'),
    (4,0,9,8,'Little Details','2007-02-26','21:02:00','09:43:00'),
    (5,1,1,9,'Amalgamated Scenarios','2001-08-02','23:30:00','18:05:00'),
    (1,2,0,10,'Evermore Paradise','2021-03-18','17:38:00','11:20:00'),
    (2,3,2,11,'Make Surge Spring','2006-07-07','19:04:00','01:58:00'),
    (3,4,3,12,'Classy Planning','2001-10-12','00:18:00','17:49:00'),
    (4,5,4,13,'Oh How New Star','2013-04-24','23:56:00','02:55:00'),
    (5,6,5,14,'Party Group','2017-07-26','00:26:00','04:04:00'),
    (1,7,6,15,'Dreams Big Factor','2011-03-15','23:40:00','05:22:00'),
    (2,8,7,16.'Event Time','2019-03-29','00:35:00','09:21:00'),
    (3,0,8,17,'Roads Times','2001-12-07','21:43:00','19:25:00'),
    (4,1,9,18,'Main Creations','2017-07-11','19:34:00','00:55:00'),
    (5,2,0,19,'Creative Blue Perfection','2015-05-30','19:29:00','21:14:00'),
    (1,3,1,20,'Six Celebrations','2013-10-21','23:52:00','00:51:00'),
    (2,4,2,21,'Fourplan Event InStyle','2019-04-02','22:55:00','00:13:00'),
    (3,5,3,22,'Little Green Day','2014-08-31','17:45:00','12:12:00');
