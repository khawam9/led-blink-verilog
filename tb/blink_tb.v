// Code your testbench here
// or browse Examples
//`include "blink"
`timescale 1us/1ns

module blink_tb;
  reg r_CLOCK = 1'b0;
  reg r_ENABLE = 1'b0;
  reg r_SWITCH_1 = 1'b0;
  reg r_SWITCH_2 = 1'b0;
  
  wire w_LED_DRIVE;
  
  //Instantiate the Unit Under Test (UUT)
  
  blink UUT
  (
    .i_clock(r_CLOCK),
    .i_enable(r_ENABLE),
    .i_switch_1(r_SWITCH_1),
    .i_switch_2(r_SWITCH_2),
    .o_led_drive(w_LED_DRIVE)
  );
  
  
  always #20 r_CLOCK <= !r_CLOCK;
  
  initial begin
    r_ENABLE <= 1'b1;
    
    r_SWITCH_1 <= 1'b0;
    r_SWITCH_2 <= 1'b0;
    #200000  //0.2 seconds
    
    r_SWITCH_1 <= 1'b0;
    r_SWITCH_2 <= 1'b1;
    #200000  //0.2 seconds
    
    r_SWITCH_1 <= 1'b1;
    r_SWITCH_2 <= 1'b0;
    #200000  //0.2 seconds
    
    r_SWITCH_1 <= 1'b1;
    r_SWITCH_2 <= 1'b1;
    #200000  //0.2 seconds
    
    $display("Test Complete");
    
  end
  initial begin
  $dumpfile("dump.vcd");  // Creates the waveform file
  $dumpvars(0, blink_tb); // Dumps all variables
  #50000000;
  $finish;
  end
  
  
endmodule //led blinks
    
    
    

  