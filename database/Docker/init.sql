-- Table Event
-- Relations:
--      event/ticket:   1:n
--      account/event:  1:n
--      location/event: 1:n
--      artist/event:   1:n
DROP TABLE IF EXISTS event;
CREATE TABLE event(
    -- Attribute
    event_id SERIAL PRIMARY KEY NOT NULL,
    event_title VARCHAR(200) NOT NULL,
    event_description VARCHAR(500) NOT NULL,
    event_date DATE NOT NULL,
    event_startTime TIME NOT NULL,
    event_duration TIME NOT NULL
    -- Relation
);

-- Table ticket
-- Relations:
--      event/ticket:   1:n
--      ticket/visitor: 1:1 (Strong/Weak)
DROP TABLE IF EXISTS ticket;
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
DROP TABLE IF EXISTS visitor;
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