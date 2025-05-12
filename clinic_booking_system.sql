-- ================================================
-- Clinic Booking System Database - MediConnect
-- Author: [Your Name]
-- Description: Relational database for managing
-- clinic operations - patients, doctors, appointments, prescriptions
-- ================================================

-- Drop existing database and create fresh
DROP DATABASE IF EXISTS mediconnect;
CREATE DATABASE mediconnect;
USE mediconnect;

-- ============================
-- Table: Department
-- ============================
CREATE TABLE Department (
    department_id INT NOT NULL AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL UNIQUE,
    PRIMARY KEY (department_id)
);

-- ============================
-- Table: Doctor
-- ============================
CREATE TABLE Doctor (
    doctor_id INT NOT NULL AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    specialization VARCHAR(100),
    email VARCHAR(100) UNIQUE,
    phone VARCHAR(15),
    department_id INT,
    PRIMARY KEY (doctor_id),
    FOREIGN KEY (department_id) REFERENCES Department(department_id)
);

-- ============================
-- Table: Patient
-- ============================
CREATE TABLE Patient (
    patient_id INT NOT NULL AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    gender ENUM('Male', 'Female', 'Other') NOT NULL,
    dob DATE NOT NULL,
    phone VARCHAR(15) NOT NULL UNIQUE,
    email VARCHAR(100) UNIQUE,
    PRIMARY KEY (patient_id)
);

-- ============================
-- Table: Appointment
-- ============================
CREATE TABLE Appointment (
    appointment_id INT NOT NULL AUTO_INCREMENT,
    patient_id INT NOT NULL,
    doctor_id INT NOT NULL,
    appointment_date DATE NOT NULL,
    appointment_time TIME NOT NULL,
    reason TEXT,
    PRIMARY KEY (appointment_id),
    FOREIGN KEY (patient_id) REFERENCES Patient(patient_id),
    FOREIGN KEY (doctor_id) REFERENCES Doctor(doctor_id)
);

-- ============================
-- Table: Prescription
-- ============================
CREATE TABLE Prescription (
    prescription_id INT NOT NULL AUTO_INCREMENT,
    appointment_id INT UNIQUE,
    diagnosis TEXT NOT NULL,
    notes TEXT,
    PRIMARY KEY (prescription_id),
    FOREIGN KEY (appointment_id) REFERENCES Appointment(appointment_id)
);

-- ============================
-- Table: Medication
-- ============================
CREATE TABLE Medication (
    medication_id INT NOT NULL AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL UNIQUE,
    description TEXT,
    PRIMARY KEY (medication_id)
);

-- =====================================
-- Table: Appointment_Medication (M:N)
-- =====================================
CREATE TABLE Appointment_Medication (
    appointment_id INT NOT NULL,
    medication_id INT NOT NULL,
    dosage VARCHAR(50),
    duration VARCHAR(50),
    PRIMARY KEY (appointment_id, medication_id),
    FOREIGN KEY (appointment_id) REFERENCES Appointment(appointment_id),
    FOREIGN KEY (medication_id) REFERENCES Medication(medication_id)
);
