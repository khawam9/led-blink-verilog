# led-blink-verilog
A simple Verilog project that toggles an LED based on different inputs. Created with the tutorial from Nandland.
# LED Blink (Verilog)

This is a simple Verilog project that toggles an LED based on input switches and a divided clock signal. 

## 🧠 What It Does

- Uses an input clock and divides it down
- Toggles an LED (`o_led_drive`) when `i_switch_1` or `i_switch_2` are high
- Implements a basic FSM to control output

## 🧪 Simulation Results

Simulated using **EDAPlayground** and viewed with **EPWave**.

| Waveform Screenshot |
|---------------------|
| ![Waveform of LED toggling](img/verilog_waveform.png.jpg)

## 📁 File Structure

```bash
src/
  led_blink.v        # Verilog module

tb/
  led_blink_tb.v     # Testbench with simulated inputs

img/
  waveform.png       # Screenshot of waveform output
 ```
 
## Tools Used

Verilog HDL
EDAPlayground (with Icarus Verilog or ModelSim)
EPWave for waveform visualization

# How to Run the Simulation

The simulation can be run on EDAPlayground
Simulator -> Icarus Verilog

Mahum Khawaja