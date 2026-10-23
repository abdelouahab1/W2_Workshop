DROP SCHEMA IF exists lana_dog_walking;
CREATE SCHEMA lana_dog_walking;
USE lana_dog_walking;

-- 1. Customers table 
CREATE TABLE customers ( customer_id INT AUTO_INCREMENT PRIMARY KEY, first_name VARCHAR(50) NOT NULL, last_name VARCHAR(50) NOT NULL, phone VARCHAR(20), email VARCHAR(100), address VARCHAR(255) ); 

-- 2. Dogs table 
CREATE TABLE dogs ( dog_id INT AUTO_INCREMENT PRIMARY KEY, dog_name VARCHAR(100) NOT NULL, breed VARCHAR(100), age INT, care_instructions TEXT, customer_id INT NOT NULL, 

CONSTRAINT fk_dogs_customers 
    FOREIGN KEY (customer_id) 
    REFERENCES customers(customer_id), 
 
CONSTRAINT chk_dog_age 
    CHECK (age IS NULL OR age >= 0) 
  

); 

-- 3. Dog walkers table 
CREATE TABLE dog_walkers ( walker_id INT AUTO_INCREMENT PRIMARY KEY, first_name VARCHAR(50) NOT NULL, last_name VARCHAR(50) NOT NULL, phone VARCHAR(20), email VARCHAR(100) ); 

-- 4. Walks table 
CREATE TABLE walks ( walk_id INT AUTO_INCREMENT PRIMARY KEY, dog_id INT NOT NULL, walker_id INT NOT NULL, scheduled_date DATE NOT NULL, start_time TIME NOT NULL, duration_minutes INT NOT NULL, status VARCHAR(20) NOT NULL DEFAULT 'Scheduled', 

CONSTRAINT fk_walks_dogs 
    FOREIGN KEY (dog_id) 
    REFERENCES dogs(dog_id), 
 
CONSTRAINT fk_walks_dog_walkers 
    FOREIGN KEY (walker_id) 
    REFERENCES dog_walkers(walker_id), 
 
CONSTRAINT chk_walk_duration 
    CHECK (duration_minutes > 0), 
 
CONSTRAINT chk_walk_status 
    CHECK (status IN ('Scheduled', 'Completed', 'Canceled')) 
  

); 

SHOW TABLES;