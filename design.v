module clock_divider #(parameter LIMIT = 24999999) (
    input clk_in,    
    input rstn,     
    output reg clk_out 
);
    reg [24:0] counter;

    always @(posedge clk_in or negedge rstn) begin
        if (!rstn) begin
            counter <= 0;
            clk_out <= 0;
        end else begin
            if (counter >= LIMIT) begin
                clk_out <= ~clk_out; 
                counter <= 0;
            end else begin
                counter <= counter + 1;
            end
        end
    end
endmodule

module up_down_counter(
    input clk,       
    input rstn,     
    input mode,      
    output reg [3:0] count
);
    always @(posedge clk or negedge rstn) begin
        if (!rstn)
            count <= 4'b0000;
        else begin
            if (mode) count <= count + 1;
            else      count <= count - 1;
        end
    end
endmodule


module top_7seg(
    input clk,
    input rstn,               
    input [15:0] data_in,    
    output reg [3:0] digit,  
    output reg [7:0] sseg    
);
 
    reg [17:0] refresh_counter; 
    wire [1:0] active_digit = refresh_counter[17:16];
    reg [3:0] bcd_val;


    always @(posedge clk or negedge rstn) begin
        if (!rstn) refresh_counter <= 0;
        else refresh_counter <= refresh_counter + 1;
    end

    always @(*) begin
        case(active_digit)
            2'b00: begin digit = 4'b1110; bcd_val = data_in[3:0];   end
            2'b01: begin digit = 4'b1101; bcd_val = data_in[7:4];   end
            2'b10: begin digit = 4'b1011; bcd_val = data_in[11:8];  end
            2'b11: begin digit = 4'b0111; bcd_val = data_in[15:12]; end
            default: begin digit = 4'b1111; bcd_val = 4'h0;        end
        endcase
    end

    
    always @(*) begin
        case(bcd_val)
            4'h0: sseg = 8'hc0; 4'h1: sseg = 8'hf9; 4'h2: sseg = 8'ha4; 4'h3: sseg = 8'hb0;
            4'h4: sseg = 8'h99; 4'h5: sseg = 8'h92; 4'h6: sseg = 8'h82; 4'h7: sseg = 8'hf8;
            4'h8: sseg = 8'h80; 4'h9: sseg = 8'h90; 4'hA: sseg = 8'h88; 4'hB: sseg = 8'h83;
            4'hC: sseg = 8'hc6; 4'hD: sseg = 8'ha1; 4'hE: sseg = 8'h86; 4'hF: sseg = 8'h8e;
            default: sseg = 8'hff;
        endcase
    end
endmodule


module top_mod #(parameter DIV_LIMIT = 24999999) (
    input clk,
    input rstn,
    input mode,
    output [3:0] digit,
    output [7:0] sseg
);
    wire clk_1hz;
    wire [3:0] count_val;

    clock_divider #(DIV_LIMIT) cd (
        .clk_in(clk), 
        .rstn(rstn), 
        .clk_out(clk_1hz)
    );

    up_down_counter udc (
        .clk(clk_1hz), 
        .rstn(rstn), 
        .mode(mode), 
        .count(count_val)
    );

    top_7seg display (
        .clk(clk), 
        .rstn(rstn),
        .data_in({12'b0, count_val}), 
        .digit(digit), 
        .sseg(sseg)
    );
endmodule