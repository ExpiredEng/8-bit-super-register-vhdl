# 8-bit Super Register (VHDL)

## 📌 Project Overview
This project implements an **8-bit Super Register** using **VHDL**.
It was developed as part of the **Digital Systems Design Lab** course.

The register supports multiple operations such as storage, shifting,
rotation, and counting, all controlled by a 3-bit control signal.

---

## ⚙️ Features
- 8-bit synchronous register
- Rising-edge clock operation
- Parallel load
- Shift left / shift right
- Rotate left / rotate right
- Up counter / Down counter
- Flag output for boundary detection

---

## 🎛 Control Operations

| Control Code | Operation |
|-------------|----------|
| 000 | Hold |
| 001 | Parallel Load |
| 010 | Shift Right |
| 011 | Shift Left |
| 100 | Rotate Right |
| 101 | Rotate Left |
| 110 | Count Up |
| 111 | Count Down |

---

## 🚩 Flag Logic
The `flag` output is asserted when:
- Register value = `00000000`
- Register value = `11111111`

This is useful for detecting overflow and underflow conditions.

---

## 📁 Project Structure
- src/ → VHDL source code
- report/ → Project documentation

---

---

## 🧪 Verification
All operations were verified using simulation.
Waveforms confirm correct behavior for each control signal.

---

## 👨‍💻 Team Members
- Elsayed Ashraf Bakry  
- Mohamed Ayman Elsaygh  
- Ahmed Bassem AboKila  
- Omar Ibrahim Elsagan  
- Mohamed Yasser Samak  

---

## 🏫 Course Information
**Course:** Digital Systems Design  
**Faculty:** Engineering – Alexandria University  
**Academic Year:** 2025–2026
