CREATE TABLE Employee (
    EmployeeID INTEGER PRIMARY KEY,
    Name VARCHAR(100) NOT NULL,
    Email VARCHAR(100) NOT NULL UNIQUE
);

CREATE TABLE Project_Status (
    ProjectStatusID INTEGER PRIMARY KEY,
    Status VARCHAR(20) NOT NULL UNIQUE CHECK (Status IN ('open', 'closed'))
);

CREATE TABLE Project (
    ProjectID INTEGER PRIMARY KEY,
    ProjectName VARCHAR(100) NOT NULL,
    DateOfCreation DATE NOT NULL,
    DateOfClosure DATE,
    ProjectStatusID INTEGER NOT NULL,
    FOREIGN KEY (ProjectStatusID) REFERENCES Project_Status(ProjectStatusID)
);


CREATE TABLE Position (
    PositionID INTEGER PRIMARY KEY,
    PositionName VARCHAR(50) NOT NULL UNIQUE
);

CREATE TABLE Project_Employee (
    ProjectEmployeeID INTEGER PRIMARY KEY,
    ProjectID INTEGER NOT NULL,
    EmployeeID INTEGER NOT NULL,
    PositionID INTEGER NOT NULL,
    FOREIGN KEY (ProjectID) REFERENCES Project(ProjectID),
    FOREIGN KEY (EmployeeID) REFERENCES Employee(EmployeeID),
    FOREIGN KEY (PositionID) REFERENCES Position(PositionID)
);

CREATE TABLE Task_Status (
    TaskStatusID INTEGER PRIMARY KEY,
    Status VARCHAR(20) NOT NULL UNIQUE CHECK (Status IN ('open', 'completed', 'requires revision', 'accepted'))
);

CREATE TABLE Task (
    TaskID INTEGER PRIMARY KEY,
    ProjectID INTEGER NOT NULL,
    AssignedEmployeeID INTEGER NOT NULL,
    Deadline DATE NOT NULL,
    TaskStatusID INTEGER NOT NULL,
    StatusChangeDate DATE NOT NULL,
    FOREIGN KEY (ProjectID) REFERENCES Project(ProjectID),
    FOREIGN KEY (AssignedEmployeeID) REFERENCES Employee(EmployeeID),
    FOREIGN KEY (TaskStatusID) REFERENCES Task_Status(TaskStatusID)
);
