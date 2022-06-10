-- Definition of Enumerations
CREATE TYPE ticket_type_enum AS ENUM ('General admission tickets', 'VIP event tickets', 'Reserved seating tickets','Multi-day pass', 'One-day pass','Early bird discount','Coded discount');
-- Tables
CREATE TABLE event(
    ID_event SERIAL PRIMARY KEY NOT NULL,
    title VARCHAR(200) NOT NULL,
    description VARCHAR(500) NOT NULL,
    dateTime DATE NOT NULL,
    startTime TIME NOT NULL,
    duration TIME NOT NULL
);
-- Strong Entity Ticket for Visitor
CREATE TABLE ticket(
    ID_ticket SERIAL PRIMARY KEY NOT NULL,
    ticket_price DECIMAL NOT NULL,
    ticket_SeatNumber INT,
    ticket_type ticket_type_enum NOT NULL,
    FOREIGN KEY (event_id) REFERENCES event(ID_event)
);

-- Weak Entity Visitor from Ticket
CREATE TABLE visitor(
    FOREIGN KEY (ticket_id) REFERENCES ticket(ID_ticket),
    PRIMARY KEY (ticket_id),
    visitor_firstName VARCHAR(100) NOT NULL,
    visitor_middleName VARCHAR(100) NOT NULL,
    visitor_lastName VARCHAR(100) NOT NULL,
    visitor_birthdate DATE NOT NULL,
    visitor_Street VARCHAR(100) NOT NULL,
    visitor_HouseNumber VARCHAR(5) NOT NULL,
    visitor_PostCode VARCHAR(5) NOT NULL,
    visitor_City VARCHAR(100) NOT NULL
);