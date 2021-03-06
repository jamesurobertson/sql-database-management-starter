-- In this file, you will create some tables for the aa_times database

-- Set the role to the aa_times user so the tables will be owned by that user
SET ROLE aa_times;


-- The "people" table
-- | Column name | Type         | Constraints |
-- |-------------|--------------|-------------|
-- | id          | SERIAL       | PRIMARY KEY |
-- | first_name  | VARCHAR(50)  | NOT NULL    |
-- | last_name   | VARCHAR(50)  | NOT NULL    |
-- | email       | VARCHAR(100) | NOT NULL    |

create table people (
  id serial,
  first_name varchar(50) not null,
  last_name varchar(50) not null,
  email varchar(100) not null,
  primary key(id)
);

-- The "sections" table
-- | Column name | Type         | Constraints |
-- |-------------|--------------|-------------|
-- | id          | SERIAL       | PRIMARY KEY |
-- | name        | VARCHAR(150) | NOT NULL    |

create table sections (
  id serial,
  name varchar(150) not null,
  primary key(id)
);


-- The "stories" table
-- | Column name | Type    | Constraints                             |
-- |-------------|---------|-----------------------------------------|
-- | id          | SERIAL  | PRIMARY KEY                             |
-- | author_id   | INTEGER | FOREIGN KEY to people table, NOT NULL   |
-- | content     | TEXT    | NOT NULL                                |
-- | section_id  | INTEGER | FOREIGN KEY to sections table, NOT NULL |

create table stories (
  id serial,
  author_id integer not null,
  content text not null,
  section_id integer not null,
  primary key(id),
  foreign key(author_id) references people(id),
  foreign key(section_id) references sections(id)
);
