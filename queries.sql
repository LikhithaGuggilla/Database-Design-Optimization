# 1. SQL Schema (Table Creation)
# These are the CREATE TABLE statements used to define the database structure.

# Patient Information:

    CREATE TABLE PatientInformation (
        PatientID INT PRIMARY KEY,
        FirstName VARCHAR(50),
        LastName VARCHAR(50),
        DateOfBirth DATE,
        Gender VARCHAR(10),
        Address VARCHAR(255),
        PhoneNumber VARCHAR(20),
        EmailAddress VARCHAR(100),
        InsurancePlanID INT
    );


# Insurance Information:

    CREATE TABLE InsuranceInformation (
        InsurancePlanID INT PRIMARY KEY,
        PatientID INT,
        PolicyNumber VARCHAR(50),
        PayerName VARCHAR(100),
        CoverageStartDate DATE,
        CoverageEndDate DATE,
        CoPaymentAmount DECIMAL(10, 2),
        DeductibleAmount DECIMAL(10, 2),
        OutOfPocketMaximum DECIMAL(10, 2),
        FOREIGN KEY (PatientID) REFERENCES PatientInformation(PatientID)
    );


# Provider Information:

    CREATE TABLE ProviderInfo (
        ProviderID INT PRIMARY KEY,
        ProviderName VARCHAR(100),
        ProviderType VARCHAR(50),
        ProviderNPINumber VARCHAR(20),
        TaxIDNumber VARCHAR(20),
        ProviderAddress VARCHAR(255),
        ContactInformation VARCHAR(100)
    );


# Encounter Information:

    CREATE TABLE Encounter (
        EncounterID INT PRIMARY KEY,
        PatientID INT,
        ProviderID INT,
        DateOfEncounter DATE,
        TimeOfEncounter TIME,
        ChiefComplaint VARCHAR(255),
        VisitType VARCHAR(50),
        BillingStatus VARCHAR(20),
        FOREIGN KEY (PatientID) REFERENCES PatientInformation(PatientID),
        FOREIGN KEY (ProviderID) REFERENCES ProviderInfo(ProviderID)
    );


# Claim Information:

    CREATE TABLE Claim (
        ClaimID INT PRIMARY KEY,
        EncounterID INT,
        PatientID INT,
        InsurancePlanID INT,
        DiagnosisCodes VARCHAR(255),
        ProcedureCodes VARCHAR(255),
        ClaimStatus VARCHAR(20),
        ClaimAmount DECIMAL(10, 2),
        SubmissionDate DATE,
        PaymentDate DATE,
        FOREIGN KEY (EncounterID) REFERENCES Encounter(EncounterID),
        FOREIGN KEY (PatientID) REFERENCES PatientInformation(PatientID),
        FOREIGN KEY (InsurancePlanID) REFERENCES InsuranceInformation(InsurancePlanID)
    );


# Claim-Encounter Junction Table (Many-to-Many):

    CREATE TABLE ClaimEncounter (
        ClaimID INT,
        EncounterID INT,
        PRIMARY KEY (ClaimID, EncounterID),
        FOREIGN KEY (ClaimID) REFERENCES Claim(ClaimID),
        FOREIGN KEY (EncounterID) REFERENCES Encounter(EncounterID)
    );


# Diagnosis Table
# This table links specific diagnoses to a patient encounter.

    CREATE TABLE Diagnosis (
        DiagnosisID INT PRIMARY KEY,
        EncounterID INT,
        MappedDiagnosisCode VARCHAR(20),  
        DiagnosisDescription VARCHAR(255),
        DateOfDiagnosis DATE,
        FOREIGN KEY (EncounterID) REFERENCES Encounter(EncounterID)
    );


# Procedure Table
This table links specific procedures performed during an encounter.

    CREATE TABLE ProcedureInfo (
        ProcedureID INT PRIMARY KEY,
        EncounterID INT,
        MappedProcedureCode VARCHAR(20),  
        ProcedureDescription VARCHAR(255),
        ProcedureDate DATE,
        ProcedureFee DECIMAL(10, 2),
        FOREIGN KEY (EncounterID) REFERENCES Encounter(EncounterID)
    );


# Diagnosis Codes (Lookup Table)
This is a master lookup table for all possible diagnosis codes and their descriptions.

    CREATE TABLE Diagnosiscodes (
        DiagnosisCode VARCHAR(20) PRIMARY KEY,
        DiagnosisDescription VARCHAR(255)
    );


# Procedure Codes (Lookup Table)
This is a master lookup table for all possible procedure codes and their descriptions.

    CREATE TABLE Procedurecodes (
        ProcedureCode VARCHAR(20) PRIMARY KEY,
        ProcedureDescription VARCHAR(255)
    );



# 2. SQL Analysis Queries and Indexes
# These are the queries used for analysis and the indexes created to optimize them.

# Query 1: Analyze the query execution to "Get the patient named 'John'"

    ANALYZE SELECT FirstName, LastName, InsurancePlanID
    FROM PatientInformation pi2
    WHERE FirstName LIKE "John";

    # Index created to optimize 
    CREATE INDEX last_first_Name_idx ON Claim(ClaimID);


# Query 2: Analyze the query execution to 'find insurance plans with high out-of-pocket maximums'

    ANALYZE SELECT PayerName, CoverageStartDate, CoverageEndDate, CoPaymentAmount, DeductibleAmount, OutOfPocketMaximum
    FROM InsuranceInformation ii
    JOIN PatientInformation pi2 ON ii.PatientID = pi2.PatientID
    WHERE PayerName IN ("Home PLC", "Cook Group", "SMith Inc", "Reed Group")
    AND OutOfPocketMaximum > 15000
    ORDER BY OutOfPocketMaximum;

    # Index created to optimize
    CREATE INDEX PayerName_idx ON InsuranceInformation(PayerName);


# Query 3: Analyze the query execution to 'find provider encounters that have not been billed'

    ANALYZE SELECT pi2.ProviderID, pi2.ProviderName, pi2.ProviderType, e.DateOfEncounter, e.TimeOfEncounter, e.BillingStatus
    FROM ProviderInfo pi2
    JOIN Encounter e ON e.ProviderID = pi2.ProviderID
    WHERE ProviderName IN ('Abbott Group', 'Acosta, Gomez and Bowen', 'Martin-Zimmerman')
    AND BillingStatus = 'Not Billed';

    # Index created to optimize
    CREATE INDEX ProviderName_idx ON ProviderInfo(ProviderName);