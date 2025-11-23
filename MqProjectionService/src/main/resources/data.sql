-- MySQL initializing data, collaborate with bootstrap to work

-- venue basic (Bootstrap can overwrite)
INSERT INTO venue (venue_id, city)
VALUES ('Venue1', 'Vancouver'),
       ('Venue6', 'CinemaCity')
ON DUPLICATE KEY UPDATE city=VALUES(city);

-- Vent basic (Bootstrap can overwrite)
INSERT INTO event (event_id, venue_id, name, type, event_date)
VALUES ('Event1', 'Venue1', 'Spring Concert 2025', 'Concert', '2025-12-25'),
       ('Event6', 'Venue6', 'The Movie', 'Movie', '2025-11-10')
ON DUPLICATE KEY UPDATE name=VALUES(name),
                        type=VALUES(type),
                        event_date=VALUES(event_date);

-- Venue1: A square perimeter layout with 25 zones per side.
-- Bottom side (Zones 1-25, horizontal)
INSERT INTO zone (venue_id, zone_id, ticket_price, row_count, col_count, pos_x, pos_y)
VALUES ('Venue1', 1, 150.00, 10, 20, 110, 880),
       ('Venue1', 2, 150.00, 10, 20, 220, 880),
       ('Venue1', 3, 150.00, 10, 20, 330, 880),
       ('Venue1', 4, 150.00, 10, 20, 440, 880),
       ('Venue1', 5, 150.00, 10, 20, 550, 880),
       ('Venue1', 6, 150.00, 10, 20, 660, 880),
       ('Venue1', 7, 150.00, 10, 20, 770, 880),
       ('Venue1', 8, 150.00, 10, 20, 880, 880),
       ('Venue1', 9, 150.00, 10, 20, 990, 880),
       ('Venue1', 10, 150.00, 10, 20, 1100, 880),
       ('Venue1', 11, 150.00, 10, 20, 1210, 880),
       ('Venue1', 12, 150.00, 10, 20, 1320, 880),
       ('Venue1', 13, 150.00, 10, 20, 1430, 880),
       ('Venue1', 14, 150.00, 10, 20, 1540, 880),
       ('Venue1', 15, 150.00, 10, 20, 1650, 880),
       ('Venue1', 16, 150.00, 10, 20, 1760, 880),
       ('Venue1', 17, 150.00, 10, 20, 1870, 880),
       ('Venue1', 18, 150.00, 10, 20, 1980, 880),
       ('Venue1', 19, 150.00, 10, 20, 2090, 880),
       ('Venue1', 20, 150.00, 10, 20, 2200, 880),
       ('Venue1', 21, 150.00, 10, 20, 2310, 880),
       ('Venue1', 22, 150.00, 10, 20, 2420, 880),
       ('Venue1', 23, 150.00, 10, 20, 2530, 880),
       ('Venue1', 24, 150.00, 10, 20, 2640, 880),
       ('Venue1', 25, 150.00, 10, 20, 2750, 880)
ON DUPLICATE KEY UPDATE ticket_price=VALUES(ticket_price),
                        row_count=VALUES(row_count),
                        col_count=VALUES(col_count),
                        pos_x=VALUES(pos_x),
                        pos_y=VALUES(pos_y);

-- Right side (Zones 26-50, vertical)
INSERT INTO zone (venue_id, zone_id, ticket_price, row_count, col_count, pos_x, pos_y)
VALUES ('Venue1', 26, 150.00, 20, 10, 2860, 770),
       ('Venue1', 27, 150.00, 20, 10, 2860, 660),
       ('Venue1', 28, 150.00, 20, 10, 2860, 550),
       ('Venue1', 29, 150.00, 20, 10, 2860, 440),
       ('Venue1', 30, 150.00, 20, 10, 2860, 330),
       ('Venue1', 31, 150.00, 20, 10, 2860, 220),
       ('Venue1', 32, 150.00, 20, 10, 2860, 110),
       ('Venue1', 33, 150.00, 20, 10, 2860, 0),
       ('Venue1', 34, 150.00, 20, 10, 2860, -110),
       ('Venue1', 35, 150.00, 20, 10, 2860, -220),
       ('Venue1', 36, 150.00, 20, 10, 2860, -330),
       ('Venue1', 37, 150.00, 20, 10, 2860, -440),
       ('Venue1', 38, 150.00, 20, 10, 2860, -550),
       ('Venue1', 39, 150.00, 20, 10, 2860, -660),
       ('Venue1', 40, 150.00, 20, 10, 2860, -770),
       ('Venue1', 41, 150.00, 20, 10, 2860, -880),
       ('Venue1', 42, 150.00, 20, 10, 2860, -990),
       ('Venue1', 43, 150.00, 20, 10, 2860, -1100),
       ('Venue1', 44, 150.00, 20, 10, 2860, -1210),
       ('Venue1', 45, 150.00, 20, 10, 2860, -1320),
       ('Venue1', 46, 150.00, 20, 10, 2860, -1430),
       ('Venue1', 47, 150.00, 20, 10, 2860, -1540),
       ('Venue1', 48, 150.00, 20, 10, 2860, -1650),
       ('Venue1', 49, 150.00, 20, 10, 2860, -1760),
       ('Venue1', 50, 150.00, 20, 10, 2860, -1870)
ON DUPLICATE KEY UPDATE ticket_price=VALUES(ticket_price),
                        row_count=VALUES(row_count),
                        col_count=VALUES(col_count),
                        pos_x=VALUES(pos_x),
                        pos_y=VALUES(pos_y);

-- Top side (Zones 51-75, horizontal, right-to-left)
INSERT INTO zone (venue_id, zone_id, ticket_price, row_count, col_count, pos_x, pos_y)
VALUES ('Venue1', 51, 150.00, 10, 20, 2750, 0),
       ('Venue1', 52, 150.00, 10, 20, 2640, 0),
       ('Venue1', 53, 150.00, 10, 20, 2530, 0),
       ('Venue1', 54, 150.00, 10, 20, 2420, 0),
       ('Venue1', 55, 150.00, 10, 20, 2310, 0),
       ('Venue1', 56, 150.00, 10, 20, 2200, 0),
       ('Venue1', 57, 150.00, 10, 20, 2090, 0),
       ('Venue1', 58, 150.00, 10, 20, 1980, 0),
       ('Venue1', 59, 150.00, 10, 20, 1870, 0),
       ('Venue1', 60, 150.00, 10, 20, 1760, 0),
       ('Venue1', 61, 150.00, 10, 20, 1650, 0),
       ('Venue1', 62, 150.00, 10, 20, 1540, 0),
       ('Venue1', 63, 150.00, 10, 20, 1430, 0),
       ('Venue1', 64, 150.00, 10, 20, 1320, 0),
       ('Venue1', 65, 150.00, 10, 20, 1210, 0),
       ('Venue1', 66, 150.00, 10, 20, 1100, 0),
       ('Venue1', 67, 150.00, 10, 20, 990, 0),
       ('Venue1', 68, 150.00, 10, 20, 880, 0),
       ('Venue1', 69, 150.00, 10, 20, 770, 0),
       ('Venue1', 70, 150.00, 10, 20, 660, 0),
       ('Venue1', 71, 150.00, 10, 20, 550, 0),
       ('Venue1', 72, 150.00, 10, 20, 440, 0),
       ('Venue1', 73, 150.00, 10, 20, 330, 0),
       ('Venue1', 74, 150.00, 10, 20, 220, 0),
       ('Venue1', 75, 150.00, 10, 20, 110, 0)
ON DUPLICATE KEY UPDATE ticket_price=VALUES(ticket_price),
                        row_count=VALUES(row_count),
                        col_count=VALUES(col_count),
                        pos_x=VALUES(pos_x),
                        pos_y=VALUES(pos_y);

-- Left side (Zones 76-100, vertical, bottom-to-top)
INSERT INTO zone (venue_id, zone_id, ticket_price, row_count, col_count, pos_x, pos_y)
VALUES ('Venue1', 76, 150.00, 20, 10, 0, 770),
       ('Venue1', 77, 150.00, 20, 10, 0, 660),
       ('Venue1', 78, 150.00, 20, 10, 0, 550),
       ('Venue1', 79, 150.00, 20, 10, 0, 440),
       ('Venue1', 80, 150.00, 20, 10, 0, 330),
       ('Venue1', 81, 150.00, 20, 10, 0, 220),
       ('Venue1', 82, 150.00, 20, 10, 0, 110),
       ('Venue1', 83, 150.00, 20, 10, 0, 0),
       ('Venue1', 84, 150.00, 20, 10, 0, -110),
       ('Venue1', 85, 150.00, 20, 10, 0, -220),
       ('Venue1', 86, 150.00, 20, 10, 0, -330),
       ('Venue1', 87, 150.00, 20, 10, 0, -440),
       ('Venue1', 88, 150.00, 20, 10, 0, -550),
       ('Venue1', 89, 150.00, 20, 10, 0, -660),
       ('Venue1', 90, 150.00, 20, 10, 0, -770),
       ('Venue1', 91, 150.00, 20, 10, 0, -880),
       ('Venue1', 92, 150.00, 20, 10, 0, -990),
       ('Venue1', 93, 150.00, 20, 10, 0, -1100),
       ('Venue1', 94, 150.00, 20, 10, 0, -1210),
       ('Venue1', 95, 150.00, 20, 10, 0, -1320),
       ('Venue1', 96, 150.00, 20, 10, 0, -1430),
       ('Venue1', 97, 150.00, 20, 10, 0, -1540),
       ('Venue1', 98, 150.00, 20, 10, 0, -1650),
       ('Venue1', 99, 150.00, 20, 10, 0, -1760),
       ('Venue1', 100, 150.00, 20, 10, 0, -1870)
ON DUPLICATE KEY UPDATE ticket_price=VALUES(ticket_price),
                        row_count=VALUES(row_count),
                        col_count=VALUES(col_count),
                        pos_x=VALUES(pos_x),
                        pos_y=VALUES(pos_y);

-- Venue6: A single zone cinema layout.
INSERT INTO zone (venue_id, zone_id, ticket_price, row_count, col_count, pos_x, pos_y)
VALUES ('Venue6', 1, 50.00, 15, 30, 10, 10)
ON DUPLICATE KEY UPDATE ticket_price=VALUES(ticket_price),
                        row_count=VALUES(row_count),
                        col_count=VALUES(col_count),
                        pos_x=VALUES(pos_x),
                        pos_y=VALUES(pos_y);