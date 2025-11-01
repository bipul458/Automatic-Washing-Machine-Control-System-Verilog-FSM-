# Automatic-Washing-Machine-Control-System-Verilog-FSM-
# 🧺 Automatic Washing Machine Control System (Verilog HDL)

This project simulates an **Automatic Washing Machine** using a **Finite State Machine (FSM)** written in Verilog HDL and tested in **Xilinx Vivado**.

---

## ⚙️ Features

- Implements sequential FSM for automatic washing process  
- States: Check Door → Fill Water → Add Detergent → Cycle → Drain → Spin → Done  
- Control Outputs:
  - `fill_valve` – Water inlet control  
  - `motor_on` – Washing motor control  
  - `drain_valve` – Drain control  
  - `door_lock` – Door lock mechanism  
  - `done` – Cycle completion signal  

---

## 🧠 FSM Flow Chart
![FSM Flow Chart](https://www.figma.com/board/Pljb7fuEZjoz68vIUGzotI/Automatic-Washing-Machine-FSM?node-id=0-1&t=PeIbcGiCJrjlBcIK-1)

---

## 🧾 Files

| File | Description |
|------|--------------|
| `washing_machine_easy.v` | Main FSM Verilog module |
| `wm_tb.v` | Testbench for simulation |
| `waveform.png` | Vivado simulation output |
| `flowchart.png` | FSM flow diagram |

---

## 🧪 Simulation Steps (Vivado)

1. Open Vivado → Create a new project (RTL Project)  
2. Add `washing_machine_easy.v` and `wm_tb.v`  
3. Set `wm_tb.v` as the simulation top file  
4. Run **Behavioral Simulation**  
5. Observe waveform transitions across all FSM states  

---

## 🧰 Tools Used
- Xilinx Vivado 2020.2+
- Verilog HDL
- FSM-based design methodology

---


**BIPUL**  
(2025)

