# 🔐 AES-GCM Encryption Engine with Integrated Authentication Tag

This project implements a hardware-based AES-GCM encryption engine in Verilog with integrated authentication tag generation for secure data transmission. The design ensures *data confidentiality* and *integrity* in a single pass, making it highly efficient for real-time and high-security applications.

## 🔍 Project Overview

AES-GCM (Advanced Encryption Standard in Galois/Counter Mode) is a widely adopted cryptographic standard for authenticated encryption. This project involves the design, simulation, and verification of an AES-GCM engine that supports both *encryption* and *authentication tag generation* in hardware.

---

## ✨ Key Highlights

- . *AES-GCM Mode:* Combines AES encryption with Galois field multiplication for authentication.
- . *Integrated Tag Generation:* Ensures both data confidentiality and integrity in one operation.
- . *Efficient Hardware Implementation:* Optimized for minimal resource usage and high throughput.
- . *Developed in Verilog* and *simulated using ModelSim*.

---

## 🖥 Tools & Technologies

| Tool       | Purpose                        |
|------------|--------------------------------|
| Verilog HDL| RTL Design of AES-GCM Engine   |
| ModelSim   | Functional Simulation & Debug  |

---

## 🛠 System Architecture

1. *AES Core (128-bit key):* Performs block-wise encryption in CTR mode.
2. *Galois Field Multiplier (GF(2^128)):* Authenticates ciphertext using GHASH.
3. *Tag Generator:* Produces a unique authentication tag for each message.
4. *Controller FSM:* Orchestrates data flow and state transitions for parallel processing.

---

