-- ENUMERATIONS
DROP TYPE account_type_enum CASCADE;
CREATE TYPE account_type_enum AS ENUM ('CUSTOMER', 'ADMIN', 'EMPLOYEE');
DROP TYPE ticket_type_enum CASCADE;
CREATE TYPE ticket_type_enum AS ENUM ('General admission', 'VIP', 'Reserved seating','Multi-day pass','One-day pass','Early bird discount','Coded discount','Tickets at the door');

-- Table location
-- Relations:
--      location/event:   1:n
DROP TABLE IF EXISTS account CASCADE;
CREATE TABLE account(
    -- Foreign Keys
    event_id INT,
    -- Attribute
    account_id SERIAL PRIMARY KEY NOT NULL,
    account_userName VARCHAR(100) NOT NULL,
    account_email VARCHAR(100) NOT NULL,
    account_salt varchar NOT NULL,
    account_passHash varchar NOT NULL,
    account_type account_type_enum NOT NULL,
    -- Relation
    FOREIGN KEY (event_id) REFERENCES event(event_id) ON UPDATE CASCADE
);

-- Table artist
-- Relations:
--      artist/event:   1:n
DROP TABLE IF EXISTS artist CASCADE;
CREATE TABLE artist(
    -- Attribute
    artist_id SERIAL PRIMARY KEY NOT NULL,
    artist_bandName VARCHAR(100) NOT NULL,
    artist_memberSize INT NOT NULL,
    artist_foundDate DATE NOT NULL
    -- Relation
);

-- Table location
-- Relations:
--      location/event:   1:n
DROP TABLE IF EXISTS location CASCADE;
CREATE TABLE location(
    -- Attribute
    location_id SERIAL PRIMARY KEY NOT NULL,
    location_name VARCHAR(100) NOT NULL,
    location_street VARCHAR(100) NOT NULL,
    location_houseNumber VARCHAR(10) NOT NULL,
    location_postCode VARCHAR(10) NOT NULL,
    location_city VARCHAR(100) NOT NULL,
    location_country VARCHAR(100) NOT NULL,
    location_maxTicket INT NOT NULL
    -- Relation
);

-- Table Event
-- Relations:
--      event/ticket:   1:n
--      account/event:  1:n
--      location/event: 1:n
--      artist/event:   1:n
DROP TABLE IF EXISTS event CASCADE;
CREATE TABLE event(
        -- Foreign Keys
    artist_id INT NOT NULL,
    location_id INT NOT NULL,
    account_id INT NOT NULL,
    -- Attribute
    event_id SERIAL PRIMARY KEY NOT NULL,
    event_title VARCHAR(200) NOT NULL,
    event_description VARCHAR(500) NOT NULL,
    event_date DATE NOT NULL,
    event_startTime TIME NOT NULL,
    event_duration TIME NOT NULL,
    -- Relation
    FOREIGN KEY (artist_id) REFERENCES artist(artist_id) ON DELETE CASCADE,
    FOREIGN KEY (location_id) REFERENCES location(location_id) ON DELETE CASCADE,
    FOREIGN KEY (account_id) REFERENCES account(account_id) ON UPDATE CASCADE
);

-- Table ticket
-- Relations:
--      event/ticket:   1:n
--      ticket/visitor: 1:1 (Strong/Weak)
DROP TABLE IF EXISTS ticket CASCADE;
CREATE TABLE ticket(
    -- Attribute
    event_id INT NOT NULL,
    ticket_id SERIAL PRIMARY KEY NOT NULL,
    ticket_price DECIMAL NOT NULL,
    ticket_seatNumber VARCHAR(5),
    ticket_type VARCHAR(500) NOT NULL,
    -- Relation
    FOREIGN KEY (event_id) REFERENCES event(event_id) ON DELETE CASCADE
);

-- Table visitor
-- Relations:
--      ticket/visitor: 1:1 (Strong/Weak)
DROP TABLE IF EXISTS visitor CASCADE;
CREATE TABLE visitor(
    -- Relation
    ticket_id INT NOT NULL,
    CONSTRAINT fk_ticket_id FOREIGN KEY (ticket_id) REFERENCES ticket(ticket_id),
    -- Attribute
    visitor_firstName VARCHAR(100) NOT NULL,
    visitor_middleName VARCHAR(100),
    visitor_lastName VARCHAR(100) NOT NULL,
    visitor_birthDate DATE NOT NULL,
    visitor_street VARCHAR(100) NOT NULL,
    visitor_houseNumber VARCHAR(5) NOT NULL,
    visitor_postCode VARCHAR(5) NOT NULL,
    visitor_city VARCHAR(100) NOT NULL
);