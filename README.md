This repsitory contains the code for up-down counter, running on the 7 segment display of the spartan 7 FPGA board.

The design code consists of the following-

1. Clock Divider module (clock_divider)    :    Spartan 7 has an inbuilt clock of a very high frequency of 50Mhz. A counter running on that speed, is impossible to be observed by a human eye. 
                                                So we generate an out clock of frequency 1Hz, which is easy on human eyes, to observe the counter.

2. Up Down Counter module (up_down_counter):    As the name suggests, this module is there to implement the up counter and down counter. When mode is 1, up counter runs, when the mode is 0, down counter runs.

3. 7 segment module (top_7seg)             :    This module is the core logic of how the data is being displayed on the 7 segment display. The 7 segment display has four digits, this module designs the logic for 
                                                which digit is supposed to be on, which digits are supposed to be off. And most importantly, the drivier for the 7 segment display, telling us exactly which of the 
                                                seven segments will be turned on , on the digit.

4. Top module (top_mod)                    :    This module integrated all the above mentioned modules.


The testbench helps in the verification of the correctness of design. 


