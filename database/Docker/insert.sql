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
    (1,1,2,0,'Simply Gurus','Text','2007-02-28','23:30:00','17:39:00');