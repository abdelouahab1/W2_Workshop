# Requirements and Conceptual Model

Group members:
- Abdelouahab bendanoune
- Ezekiel 
- Adriyon

## 2. Business Requirements

Lana owns a dog-walking business and needs a database to organize customer information, dog information, dog walkers, and scheduled walks.

The database should allow Lana to:

1. Store each customer's contact information.
    
2. Store information about each dog, including its name, breed, age, and special care instructions.
    
3. Associate each dog with its owner.
    
4. Store information about each dog walker, including their name, phone number, and email address.
    
5. Schedule walks for individual dogs.
    
6. Assign a dog walker to each scheduled walk.
    
7. Record the date, start time, duration, and status of each walk.
    
8. Identify which dogs are scheduled for walks and which walkers are assigned to those walks.
    
9. Keep customer, dog, and walker information organized without unnecessarily repeating data.
    

## 3. Assumptions

To keep the database to four tables, we make the following assumptions:

1. Each customer can own one or more dogs.
    
2. Each dog belongs to one customer.
    
3. Each dog can have multiple walks over time.
    
4. Each walk is for one dog and is assigned to one dog walker.
    
5. Each dog walker can be assigned to multiple walks.
    
6. Each customer, dog, walker, and walk has a unique ID.
    
7. Walk status can be recorded as Scheduled, Completed, or Canceled.
    
8. Each walk has a scheduled date, start time, and duration.
    

These assumptions keep the design simple. If Lana allows multiple dogs in one walk or multiple walkers on the same walk, the database may need additional tables.

## 4. Logical Data Model

### Table 1: Customers

|Column|Key|Description|
|---|---|---|
|customer_id|PK|Unique customer identifier|
|first_name||Customer's first name|
|last_name||Customer's last name|
|phone||Customer's phone number|
|email||Customer's email address|
|address||Customer's address|

**Primary key:** `customer_id`

This table stores each customer's contact information. Customer details are stored once rather than repeated for every walk.

### Table 2: Dogs

|Column|Key|Description|
|---|---|---|
|dog_id|PK|Unique dog identifier|
|dog_name||Dog's name|
|breed||Dog's breed|
|age||Dog's age|
|care_instructions||Special care requirements|
|customer_id|FK|Identifies the dog's owner|

**Primary key:** `dog_id`

**Foreign key:** `customer_id` references `Customers.customer_id`.

This table stores information about each dog and connects each dog to its owner.

### Table 3: Dog Walkers

|Column|Key|Description|
|---|---|---|
|walker_id|PK|Unique dog walker identifier|
|first_name||Walker's first name|
|last_name||Walker's last name|
|phone||Walker's phone number|
|email||Walker's email address|

**Primary key:** `walker_id`

This table stores each dog walker's information independently from the walks they perform.

### Table 4: Walks

|Column|Key|Description|
|---|---|---|
|walk_id|PK|Unique walk identifier|
|dog_id|FK|Identifies the dog being walked|
|walker_id|FK|Identifies the assigned dog walker|
|scheduled_date||Date of the walk|
|start_time||Scheduled starting time|
|duration_minutes||Planned duration of the walk|
|status||Scheduled, Completed, or Canceled|

**Primary key:** `walk_id`

**Foreign keys:**

- `dog_id` references `Dogs.dog_id`.
    
- `walker_id` references `Dog Walkers.walker_id`.
    

This table records each walk, the dog involved, the assigned walker, and the scheduling details.

## 5. Relationships Between the Tables

### Relationship 1: Customers and Dogs

- One customer can own many dogs.
    
- Each dog belongs to one customer.
    
- Relationship: One-to-many (1).
    
- Foreign key: `Dogs.customer_id`.
    

### Relationship 2: Dogs and Walks

- One dog can have many walks over time.
    
- Each walk is for one dog.
    
- Relationship: One-to-many (1).
    
- Foreign key: `Walks.dog_id`.
    

### Relationship 3: Dog Walkers and Walks

- One dog walker can perform many walks.
    
- Each walk is assigned to one dog walker.
    
- Relationship: One-to-many (1).
    
- Foreign key: `Walks.walker_id`.
    

## 6. Conceptual Model Summary

The database has four entities: Customers, Dogs, Dog Walkers, and Walks.

Customers are connected to Dogs because customers own dogs. Dogs are connected to Walks because a dog can be walked multiple times. Dog Walkers are connected to Walks because a walker can perform multiple walks.

The Walks table connects the dog and the assigned walker for each scheduled walk. Primary keys identify individual records, while foreign keys establish relationships between the tables.

## 7. Individual ERD Design

The Entity Relationship Diagram (ERD) should include the following four entities:

1. Customers
    
2. Dogs
    
3. Dog Walkers
    
4. Walks