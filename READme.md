# 🏥 MediConnect - Clinic Booking System

## 📖 Description

**MediConnect** is a relational database system designed to manage operations of a clinic or small hospital. It supports:

- Doctor and patient record management
- Department assignments
- Appointment bookings
- Prescription documentation
- Medication tracking

The database was built entirely using **MySQL**, and it demonstrates key concepts like table design, normalization, and relationship modeling.

---

## 🚀 How to Run / Set Up the Project

To run MediConnect in **MySQL Workbench**:

1. Clone or download this repository.
2. Open `mediconnect.sql` in MySQL Workbench.
3. Select all content and execute it to create the database and its tables.
4. Refresh the schemas pane and locate the `mediconnect` schema.
5. Start running queries, inserting data, or testing relationships.

---

## 🧱 Tables Overview

| Table Name              | Description                                                  |
|------------------------|--------------------------------------------------------------|
| `department`           | Stores department info like Pediatrics, Cardiology, etc.     |
| `doctor`               | Stores doctor profiles and links to departments              |
| `patient`              | Stores patient records with gender, contact, and birth info  |
| `appointment`          | Links patients and doctors with scheduled time/date          |
| `prescription`         | One-to-one with appointments, stores diagnosis and notes     |
| `medication`           | List of medications with descriptions                        |
| `appointment_medication` | Many-to-many between appointments and medications          |

---

## 🔗 Relationships Summary

- **One-to-Many**: `department` → `doctor`
- **One-to-Many**: `patient` → `appointment`
- **One-to-Many**: `doctor` → `appointment`
- **One-to-One**: `appointment` → `prescription`
- **Many-to-Many**: `appointment` ↔ `medication` (via `appointment_medication`)

---

## 🖼️ ERD (Entity Relationship Diagram)

> 📌 ![alt text](<clinical ERD.png>)

```markdown
![ERD](A_digital_diagram_displays_an_Entity-Relationship_.png)
