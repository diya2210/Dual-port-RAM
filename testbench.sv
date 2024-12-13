// Code your testbench here
// or browse Examples
// Testbench in SystemVerilog
`timescale 1ns/1ps
module tb_dual_port_ram;

    parameter DATA_WIDTH = 8;
    parameter ADDR_WIDTH = 4;

    // Testbench Signals
    reg clk;
    reg [ADDR_WIDTH-1:0] addr_a;
    reg [ADDR_WIDTH-1:0] addr_b;
    reg [DATA_WIDTH-1:0] data_in_a;
    reg [DATA_WIDTH-1:0] data_in_b;
    reg we_a;
    reg we_b;
    wire [DATA_WIDTH-1:0] data_out_a;
    wire [DATA_WIDTH-1:0] data_out_b;

    // Instantiate the DUT
    dual_port_ram #(.DATA_WIDTH(DATA_WIDTH), .ADDR_WIDTH(ADDR_WIDTH)) dut (
        .clk(clk),
        .addr_a(addr_a),
        .addr_b(addr_b),
        .data_in_a(data_in_a),
        .data_in_b(data_in_b),
        .we_a(we_a),
        .we_b(we_b),
        .data_out_a(data_out_a),
        .data_out_b(data_out_b)
    );

    // Clock Generation
    initial clk = 0;
    always #5 clk = ~clk;

    // Test Procedure
    initial begin
        // Initialize signals
        addr_a = 0; addr_b = 0;
        data_in_a = 0; data_in_b = 0;
        we_a = 0; we_b = 0;

        // Display Header
        $display("Time | clk | we_a | addr_a | data_in_a | data_out_a | we_b | addr_b | data_in_b | data_out_b");
        $monitor("%4t |  %1b  |  %1b  |  %2h     |   %2h      |   %2h      |  %1b  |  %2h     |   %2h      |   %2h", 
                  $time, clk, we_a, addr_a, data_in_a, data_out_a, we_b, addr_b, data_in_b, data_out_b);

        // Write to Port A
        @(posedge clk);
        addr_a = 4; data_in_a = 8'hA5; we_a = 1;
        @(posedge clk);
        we_a = 0;

        // Write to Port B
        @(posedge clk);
        addr_b = 4; data_in_b = 8'h5A; we_b = 1;
        @(posedge clk);
        we_b = 0;

        // Read from Port A
        @(posedge clk);
        addr_a = 4;
        @(posedge clk);

        // Read from Port B
        @(posedge clk);
        addr_b = 4;
        @(posedge clk);

        // Finish Simulation
        @(posedge clk);
        $stop;
    end

endmodule
