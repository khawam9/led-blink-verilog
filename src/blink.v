// Code your design here
module blink
  (
  i_clock,
  i_enable,
  i_switch_1,
  i_switch_2,
  o_led_drive
  );
  
  input i_enable;
  input i_switch_1;
  input i_switch_2;
  input i_clock;
  output o_led_drive;
  
  
  //create constants called parameter for frequency value
  
  parameter c_CNT_100HZ = 125;
  parameter c_CNT_50HZ = 250;
  parameter c_CNT_10HZ = 1250;
  parameter c_CNT_1HZ = 12500;
  
  //THE SIGNALS WILL BE COUNTERS
  // These signals will be the counters:
  reg [31:0] r_CNT_100HZ = 0;
  reg [31:0] r_CNT_50HZ = 0;
  reg [31:0] r_CNT_10HZ = 0;
  reg [31:0] r_CNT_1HZ = 0;
  
  //these signals will toggle at the frequencies needed:
  
  reg		r_TOGGLE_100HZ = 1'b0;
  reg		r_TOGGLE_50HZ = 1'b0;
  reg		r_TOGGLE_10HZ = 1'b0;
  reg		r_TOGGLE_1HZ = 1'b0;
  
  //one bit select
  
  reg		r_LED_SELECT;
  wire 		w_LED_SELECT;
  
 
   //creating always blocks that run continuosly even if //frequency is not selected
    
    always @ (posedge i_clock)
      begin
        if (r_CNT_100HZ == c_CNT_100HZ-1)
          begin
            r_TOGGLE_100HZ <= !r_TOGGLE_100HZ;
            r_CNT_100HZ <= 0;
          end
        else
          r_CNT_100HZ <= r_CNT_100HZ+1;
      end
    
    always @ (posedge i_clock)
      begin
        if (r_CNT_50HZ == c_CNT_50HZ -1)
          begin
            r_TOGGLE_50HZ <= !r_TOGGLE_50HZ;
            r_CNT_50HZ <= 0;
          end
        else
          r_CNT_50HZ <= r_CNT_50HZ+1; //incrementing the count
      end
    
    always @ (posedge i_clock)
      begin
        if (r_CNT_10HZ == c_CNT_10HZ -1)
          begin
            r_TOGGLE_10HZ <= !r_TOGGLE_10HZ;
            r_CNT_10HZ <= 0;
          end
        else
          r_CNT_10HZ <= r_CNT_10HZ+1; //incrementing the count
      end
   
    always @ (posedge i_clock)
      begin
        if (r_CNT_1HZ == c_CNT_1HZ -1)
          begin
            r_TOGGLE_1HZ <= !r_TOGGLE_1HZ;
            r_CNT_1HZ <= 0;
          end
        else
          r_CNT_1HZ <= r_CNT_1HZ+1; //incrementing the count
      end
    
    //create a multiplexor based on switch inputs
    always @ (*)
    begin 
       case ({i_switch_1, i_switch_2}) //{} concatantion operator
         2'b11 : r_LED_SELECT <= r_TOGGLE_1HZ;
         2'b10 : r_LED_SELECT <= r_TOGGLE_10HZ;
         2'b01 : r_LED_SELECT <= r_TOGGLE_50HZ;
         2'b00 : r_LED_SELECT <= r_TOGGLE_100HZ;
          
       endcase
    end
    assign o_led_drive = r_LED_SELECT & i_enable;
          
endmodule
          
         
        
          
    
    
            
            