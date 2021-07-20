-- CREATE TABLE Accounts(
--   id VARCHAR(255) NOT NULL primary key comment 'primary key',
--   createdAt DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT 'create time',
--   updatedAt DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'update time',
--   name varchar(255) NOT NULL comment 'Users given name',
--   email varchar(255) NOT NULL comment 'Auth Email',
--   picture varchar(255) NOT NULL comment 'Picture URL'
-- ) default charset utf8 comment '';


CREATE TABLE vacation(
 id int NOT NULL PRIMARY KEY AUTO_INCREMENT comment 'vacation id',
  name VARCHAR(255) COMMENT 'vacation name',
  attendees VARCHAR(255) comment 'trip attendees',
  groupSize int NOT NULL comment 'group size',
  departing DATETIME NOT NULL COMMENT 'departing date',
  returning DATETIME NOT NULL COMMENT  'returning date',
  createdAt DATETIME DEFAULT CURRENT_TIMESTAMP comment 'create time',
  updatedAt DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP comment 'update time',
  creatorId VARCHAR(255) NOT NULL COMMENT 'FK: Account Id',
  FOREIGN KEY(creatorId) REFERENCES Accounts(id) ON DELETE CASCADE
) default charset utf8 comment '';

-- DROP TABLE vacation;


CREATE TABLE trip(
 id int NOT NULL PRIMARY KEY AUTO_INCREMENT comment 'trip id',
  createdAt DATETIME DEFAULT CURRENT_TIMESTAMP comment 'create time',
  updatedAt DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP comment 'update time',
  startingLocation VARCHAR(255)  comment 'starting location',
  vacationId int NOT NULL comment 'FK: vacation',
FOREIGN KEY(vacationId) REFERENCES vacation(id) ON DELETE CASCADE
  
) default charset utf8 comment '';

-- DROP TABLE trip;


CREATE Table cruise(
id int NOT NULL PRIMARY KEY AUTO_INCREMENT comment 'cruise id', 
createdAt DATETIME DEFAULT CURRENT_TIMESTAMP comment 'create time',
  updatedAt DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP comment 'update time',  
  shipName VARCHAR(255) NOT NULL COMMENT 'ship name',
  cruiseDuration int NOT NULL comment 'cruise duration',
  vacationId int NOT NULL comment 'FK: vacation',
  FOREIGN KEY(vacationId) REFERENCES vacation(id) ON DELETE CASCADE

)default charset utf8 comment '';


-- DROP TABLE cruise;

 SELECT 
                v.*,
                t.*,
                c*,
                FROM vacations v
                JOIN  trip t ON vacation.id = trip.vacationId
                JOIN cruise c ON trip.id = cruise.vacationId;