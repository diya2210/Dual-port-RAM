# Dual-port-RAM
I have designed the dual-port RAM in Verilog and created a SystemVerilog testbench to verify its functionality. The testbench includes basic write and read operations for both ports.
Analysis of the Output:
Initialization (Time = 0 ns):

All inputs are initialized to zero, and the output ports (data_out_a, data_out_b) show xx because the RAM contents are undefined initially.
Write Operation on Port A (Time = 10 ns to 15 ns):

At 10 ns, addr_a = 4, data_in_a = A5, and we_a = 1. This writes the value A5 to address 4 using Port A.
At 15 ns, we_a = 0, disabling the write operation. The value A5 is now stored at address 4 and is readable through data_out_a.
Write Operation on Port B (Time = 30 ns to 35 ns):

At 30 ns, addr_b = 4, data_in_b = 5A, and we_b = 1. This writes the value 5A to address 4 using Port B.
At 35 ns, we_b = 0, disabling the write operation. The value 5A is now stored at address 4 and is readable through data_out_b.
Read Operation on Port A (Time = 20 ns, 50 ns, etc.):

During subsequent clock cycles, addr_a = 4, and data_out_a reflects the last written value to that address (5A).
Read Operation on Port B (Time = 40 ns, 60 ns, etc.):

Similarly, when addr_b = 4, data_out_b reflects the value stored at that address (5A).
Key Observations:
Data Consistency: The RAM behaves as expected—both ports correctly reflect the written values when reading from the same address.
Clock-Driven Operations: All operations (read/write) are synchronized with the clock's positive edge.
Conclusion:
The output indicates the dual-port RAM and the testbench are functioning correctly. If you have additional scenarios or edge cases you want to test (e.g., simultaneous reads/writes on both ports), let me know, and I can guide you further!






