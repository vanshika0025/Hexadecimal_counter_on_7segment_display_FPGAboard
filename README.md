# Up-Down Counter on Spartan-7 FPGA using 7-Segment Display

This repository contains the code for an up-down counter running on the 7-segment display of the Spartan-7 FPGA board.

## Design Modules

The design code consists of the following:

### 1. Clock Divider Module (`clock_divider`)

Spartan-7 has an inbuilt clock of a very high frequency of 50 MHz. A counter running at that speed is impossible to be observed by a human eye.

So, we generate an output clock of frequency 1 Hz, which is easy for human eyes to observe the counter.

### 2. Up-Down Counter Module (`up_down_counter`)

As the name suggests, this module is there to implement the up counter and down counter.

- When `mode = 1`, the up counter runs.
- When `mode = 0`, the down counter runs.

### 3. 7-Segment Module (`top_7seg`)

This module is the core logic of how the data is displayed on the 7-segment display.

The 7-segment display has four digits. This module designs the logic for:

- Which digit is supposed to be ON
- Which digits are supposed to be OFF
- The driver for the 7-segment display, telling us exactly which of the seven segments will be turned on for the digit

### 4. Top Module (`top_mod`)

This module integrates all the above-mentioned modules.

---

## Schematic

<p align="center">
  <img width="1108" height="421" alt="image" src="https://github.com/user-attachments/assets/20a03b3e-0de6-47d8-96f4-a6fee94287f4" />
</p>

<p align="center">
  <img width="1053" height="448" alt="image" src="https://github.com/user-attachments/assets/c3836e68-e493-40ab-b678-c4b2d3d0c790" />
</p>

<p align="center">
  <img width="626" height="270" alt="image" src="https://github.com/user-attachments/assets/b226a813-034c-41fe-8c66-cdbd7e7bd552" />
</p>

<p align="center">
  <img width="958" height="304" alt="image" src="https://github.com/user-attachments/assets/38f8f870-fd63-4dd0-9bcf-57f8a6d1dc39" />
</p>

---

## Testbench

The testbench helps in the verification of the correctness of the design.

The testbench written for the above design prints the values of:

- Clock
- Reset
- Mode
- Counter
- Digit (active high)
- Seven-segment display (active low)

Below are the images of the waveform and simulation log.

### Waveform

<p align="center">
  <img width="1254" height="236" alt="image" src="https://github.com/user-attachments/assets/b43ddffa-b619-49aa-b5d2-3cd49f82305b" />
</p>

### Simulation Log

<p align="center">
  <img width="892" height="423" alt="image" src="https://github.com/user-attachments/assets/8736da55-40ca-4016-b8ee-08d7e5b6737a" />
</p>

---

## Constraints File

The constraint file connects the ports created in the design with the actual pins of the FPGA board.
