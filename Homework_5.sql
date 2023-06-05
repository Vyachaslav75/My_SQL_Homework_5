DROP DATABASE IF EXISTS lesson_5;
CREATE DATABASE lesson_5;
USE lesson_5;

-- создаем таблицу для заданий 1, 2, 3
DROP TABLE IF EXISTS cars;
CREATE TABLE cars
(
	id INT NOT NULL PRIMARY KEY,
    name VARCHAR(45),
    cost INT
);

-- проверяем
DESCRIBE cars;

-- заполняем
INSERT cars
VALUES
	(1, "Audi", 52642),
    (2, "Mercedes", 57127 ),
    (3, "Skoda", 9000 ),
    (4, "Volvo", 29000),
	(5, "Bentley", 350000),
    (6, "Citroen ", 21000 ), 
    (7, "Hummer", 41400), 
    (8, "Volkswagen ", 21600);

-- проверяем
SELECT *
  FROM cars;

-- создаем представление задание 1
DROP VIEW IF EXISTS cheap_cars;
CREATE VIEW cheap_cars (id, name, cost)
  AS SELECT * 
	  FROM cars
		WHERE cost < 25000;

-- проверяем
SELECT *
  FROM cheap_cars;
  
-- меняем представление задание 2
ALTER VIEW cheap_cars (id, name, cost)
  AS SELECT * 
	  FROM cars
		WHERE cost < 30000;

-- проверяем
SELECT *
  FROM cheap_cars;

-- создаем представление задание 3  
DROP VIEW IF EXISTS cars_2;
CREATE VIEW cars_2 (id, name, cost)
  AS SELECT * 
	  FROM cars
		WHERE name IN ('Skoda', 'Audi');

-- проверяем
SELECT *
  FROM cars_2;

-- создаем таблицу для задания 4  
DROP TABLE IF EXISTS trains;
CREATE TABLE trains
(
	train_id INT NOT NULL,
    station VARCHAR(20),
    station_time TIME
);

-- заполняем
INSERT trains
VALUES
	(110, "San Francisco", "10:00:00"),
    (110, "Redwood City", "10:54:00" ),
    (110, "Palo Alto", "11:02:00" ),
	(110, "San Jose", "12:35:00"),
    (120, "San Francisco", "11:00:00" ), 
    (120, "Palo Alto", "12:49:00"), 
    (120, "San Jose", "13:30:00");

-- проверяем
SELECT *
  FROM trains;

-- создаем запрос для задания 4   
SELECT *,
   SUBTIME(LEAD (station_time) OVER (PARTITION BY train_id ORDER BY station_time) , station_time) 
      AS time_to_next_station
FROM trains;