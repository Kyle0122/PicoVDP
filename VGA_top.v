/*
 * Generated by Digital. Don't modify this file!
 * Any changes will be lost if this file is regenerated.
 */
module DIG_D_FF_1bit
#(
    parameter Default = 0
)
(
   input D,
   input C,
   output Q,
   output \~Q
);
    reg state;

    assign Q = state;
    assign \~Q = ~state;

    always @ (posedge C) begin
        state <= D;
    end

    initial begin
        state = Default;
    end
endmodule

module DIG_ROM_64X8_R_Pal (
    input [5:0] A,
    input sel,
    output reg [7:0] D
);
    reg [7:0] my_rom [0:31];

    always @ (*) begin
        if (~sel)
            D = 8'hz;
        else if (A > 6'h1f)
            D = 8'h0;
        else
            D = my_rom[A];
    end

    initial begin
        my_rom[0] = 8'h0;
        my_rom[1] = 8'h7e;
        my_rom[2] = 8'hc3;
        my_rom[3] = 8'hff;
        my_rom[4] = 8'hff;
        my_rom[5] = 8'hff;
        my_rom[6] = 8'hff;
        my_rom[7] = 8'hff;
        my_rom[8] = 8'ha7;
        my_rom[9] = 8'h0;
        my_rom[10] = 8'h0;
        my_rom[11] = 8'h0;
        my_rom[12] = 8'h12;
        my_rom[13] = 8'h1d;
        my_rom[14] = 8'ha;
        my_rom[15] = 8'h29;
        my_rom[16] = 8'h83;
        my_rom[17] = 8'hff;
        my_rom[18] = 8'hff;
        my_rom[19] = 8'hd4;
        my_rom[20] = 8'hab;
        my_rom[21] = 8'h74;
        my_rom[22] = 8'h42;
        my_rom[23] = 8'h5f;
        my_rom[24] = 8'hdb;
        my_rom[25] = 8'hff;
        my_rom[26] = 8'hff;
        my_rom[27] = 8'hbd;
        my_rom[28] = 8'h83;
        my_rom[29] = 8'h5f;
        my_rom[30] = 8'ha2;
        my_rom[31] = 8'hc2;
    end
endmodule

module DIG_ROM_64X8_G_Pal (
    input [5:0] A,
    input sel,
    output reg [7:0] D
);
    reg [7:0] my_rom [0:31];

    always @ (*) begin
        if (~sel)
            D = 8'hz;
        else if (A > 6'h1f)
            D = 8'h0;
        else
            D = my_rom[A];
    end

    initial begin
        my_rom[0] = 8'h0;
        my_rom[1] = 8'h25;
        my_rom[2] = 8'h0;
        my_rom[3] = 8'h0;
        my_rom[4] = 8'h66;
        my_rom[5] = 8'ha3;
        my_rom[6] = 8'hec;
        my_rom[7] = 8'hff;
        my_rom[8] = 8'hf7;
        my_rom[9] = 8'he4;
        my_rom[10] = 8'hb2;
        my_rom[11] = 8'h87;
        my_rom[12] = 8'h53;
        my_rom[13] = 8'h2b;
        my_rom[14] = 8'h62;
        my_rom[15] = 8'had;
        my_rom[16] = 8'heb;
        my_rom[17] = 8'hf1;
        my_rom[18] = 8'hcc;
        my_rom[19] = 8'h8e;
        my_rom[20] = 8'h52;
        my_rom[21] = 8'h2f;
        my_rom[22] = 8'h21;
        my_rom[23] = 8'h34;
        my_rom[24] = 8'h37;
        my_rom[25] = 8'h77;
        my_rom[26] = 8'hac;
        my_rom[27] = 8'h9a;
        my_rom[28] = 8'h76;
        my_rom[29] = 8'h57;
        my_rom[30] = 8'h88;
        my_rom[31] = 8'hc3;
    end
endmodule

module DIG_ROM_64X8_B_Pal (
    input [5:0] A,
    input sel,
    output reg [7:0] D
);
    reg [7:0] my_rom [0:31];

    always @ (*) begin
        if (~sel)
            D = 8'hz;
        else if (A > 6'h1f)
            D = 8'h0;
        else
            D = my_rom[A];
    end

    initial begin
        my_rom[0] = 8'h0;
        my_rom[1] = 8'h53;
        my_rom[2] = 8'h2e;
        my_rom[3] = 8'h4d;
        my_rom[4] = 8'h0;
        my_rom[5] = 8'h0;
        my_rom[6] = 8'h27;
        my_rom[7] = 8'h7d;
        my_rom[8] = 8'h35;
        my_rom[9] = 8'h36;
        my_rom[10] = 8'h51;
        my_rom[11] = 8'h51;
        my_rom[12] = 8'h59;
        my_rom[13] = 8'h53;
        my_rom[14] = 8'hbe;
        my_rom[15] = 8'hff;
        my_rom[16] = 8'hf5;
        my_rom[17] = 8'he8;
        my_rom[18] = 8'haa;
        my_rom[19] = 8'h6f;
        my_rom[20] = 8'h36;
        my_rom[21] = 8'h29;
        my_rom[22] = 8'h36;
        my_rom[23] = 8'h7e;
        my_rom[24] = 8'hb8;
        my_rom[25] = 8'ha8;
        my_rom[26] = 8'hc5;
        my_rom[27] = 8'hdf;
        my_rom[28] = 8'h9c;
        my_rom[29] = 8'h4f;
        my_rom[30] = 8'h79;
        my_rom[31] = 8'hc7;
    end
endmodule


module DIG_Sub #(
    parameter Bits = 2
)
(
    input [(Bits-1):0] a,
    input [(Bits-1):0] b,
    input c_i,
    output [(Bits-1):0] s,
    output c_o
);
    wire [Bits:0] temp;

    assign temp = a - b - c_i;
    assign s = temp[(Bits-1):0];
    assign c_o = temp[Bits];
endmodule


module DIG_CounterPreset #(
    parameter Bits = 2,
    parameter maxValue = 4
)
(
    input C,
    input en,
    input clr,
    input dir,
    input [(Bits-1):0] in,
    input ld,
    output [(Bits-1):0] out,
    output ovf
);

    reg [(Bits-1):0] count = 'h0;

    function [(Bits-1):0] maxVal (input [(Bits-1):0] maxv);
        if (maxv == 0)
            maxVal = (1 << Bits) - 1;
        else
            maxVal = maxv;
    endfunction

    assign out = count;
    assign ovf = ((count == maxVal(maxValue) & dir == 1'b0)
                  | (count == 'b0 & dir == 1'b1))? en : 1'b0;

    always @ (posedge C) begin
        if (clr == 1'b1)
            count <= 'h0;
        else if (ld == 1'b1)
            count <= in;
        else if (en == 1'b1) begin
            if (dir == 1'b0) begin
                if (count == maxVal(maxValue))
                    count <= 'h0;
                else
                    count <= count + 1'b1;
            end
            else begin
                if (count == 'h0)
                    count <= maxVal(maxValue);
                else
                    count <= count - 1;
            end
        end
    end
endmodule


module CompUnsigned #(
    parameter Bits = 1
)
(
    input [(Bits -1):0] a,
    input [(Bits -1):0] b,
    output \> ,
    output \= ,
    output \<
);
    assign \> = a > b;
    assign \= = a == b;
    assign \< = a < b;
endmodule


module equals_gen0 (
  input [9:0] A,
  input [9:0] B,
  output Q
);
  // =
  CompUnsigned #(
    .Bits(10)
  )
  CompUnsigned_i0 (
    .a( A ),
    .b( B ),
    .\= ( Q )
  );
endmodule
module DIG_JK_FF
#(
    parameter Default = 1'b0
)
(
   input J,
   input C,
   input K,
   output Q,
   output \~Q
);
    reg state;

    assign Q = state;
    assign \~Q = ~state;

    always @ (posedge C) begin
        if (~J & K)
            state <= 1'b0;
         else if (J & ~K)
            state <= 1'b1;
         else if (J & K)
            state <= ~state;
    end

    initial begin
        state = Default;
    end
endmodule


module vga_sync (
  input en,
  input H_neg,
  input V_neg,
  input Pclk,
  output [9:0] H_pixel,
  output [9:0] V_pixel,
  output H_sync,
  output V_sync
);
  wire [9:0] s0;
  wire s1;
  wire [9:0] H_pixel_temp;
  wire [9:0] V_pixel_temp;
  wire [9:0] s2;
  wire [9:0] s3;
  wire [9:0] s4;
  wire s5;
  wire s6;
  wire s7;
  wire [9:0] s8;
  wire s9;
  wire [9:0] s10;
  wire [9:0] s11;
  wire [9:0] s12;
  wire s13;
  wire s14;
  wire s15;
  DIG_Sub #(
    .Bits(10)
  )
  DIG_Sub_i0 (
    .a( 10'b111100000 ),
    .b( 10'b1 ),
    .c_i( 1'b0 ),
    .s( s2 )
  );
  DIG_Sub #(
    .Bits(10)
  )
  DIG_Sub_i1 (
    .a( 10'b0 ),
    .b( 10'b10 ),
    .c_i( 1'b0 ),
    .s( s3 )
  );
  DIG_Sub #(
    .Bits(10)
  )
  DIG_Sub_i2 (
    .a( 10'b100010000 ),
    .b( 10'b1 ),
    .c_i( 1'b0 ),
    .s( s10 )
  );
  DIG_Sub #(
    .Bits(10)
  )
  DIG_Sub_i3 (
    .a( 10'b0 ),
    .b( 10'b10 ),
    .c_i( 1'b0 ),
    .s( s11 )
  );
  DIG_Sub #(
    .Bits(10)
  )
  DIG_Sub_i4 (
    .a( s3 ),
    .b( 10'b101001 ),
    .c_i( 1'b0 ),
    .s( s4 )
  );
  DIG_Sub #(
    .Bits(10)
  )
  DIG_Sub_i5 (
    .a( s11 ),
    .b( 10'b1010 ),
    .c_i( 1'b0 ),
    .s( s12 )
  );
  DIG_Sub #(
    .Bits(10)
  )
  DIG_Sub_i6 (
    .a( s4 ),
    .b( 10'b10 ),
    .c_i( 1'b0 ),
    .s( s0 )
  );
  DIG_Sub #(
    .Bits(10)
  )
  DIG_Sub_i7 (
    .a( s12 ),
    .b( 10'b10 ),
    .c_i( 1'b0 ),
    .s( s8 )
  );
  DIG_CounterPreset #(
    .Bits(10),
    .maxValue(0)
  )
  DIG_CounterPreset_i8 (
    .en( en ),
    .C( Pclk ),
    .dir( 1'b0 ),
    .in( s0 ),
    .ld( s1 ),
    .clr( 1'b0 ),
    .out( H_pixel_temp )
  );
  assign H_sync = ~ (s5 ^ H_neg);
  DIG_CounterPreset #(
    .Bits(10),
    .maxValue(0)
  )
  DIG_CounterPreset_i9 (
    .en( en ),
    .C( s1 ),
    .dir( 1'b0 ),
    .in( s8 ),
    .ld( s9 ),
    .clr( 1'b0 ),
    .out( V_pixel_temp )
  );
  assign V_sync = ~ (s13 ^ V_neg);
  equals_gen0 equals_gen0_i10 (
    .A( H_pixel_temp ),
    .B( s2 ),
    .Q( s1 )
  );
  equals_gen0 equals_gen0_i11 (
    .A( H_pixel_temp ),
    .B( s3 ),
    .Q( s7 )
  );
  equals_gen0 equals_gen0_i12 (
    .A( H_pixel_temp ),
    .B( s4 ),
    .Q( s6 )
  );
  equals_gen0 equals_gen0_i13 (
    .A( V_pixel_temp ),
    .B( s10 ),
    .Q( s9 )
  );
  equals_gen0 equals_gen0_i14 (
    .A( V_pixel_temp ),
    .B( s11 ),
    .Q( s15 )
  );
  equals_gen0 equals_gen0_i15 (
    .A( V_pixel_temp ),
    .B( s12 ),
    .Q( s14 )
  );
  DIG_JK_FF #(
    .Default(0)
  )
  DIG_JK_FF_i16 (
    .J( s6 ),
    .C( Pclk ),
    .K( s7 ),
    .\~Q ( s5 )
  );
  DIG_JK_FF #(
    .Default(0)
  )
  DIG_JK_FF_i17 (
    .J( s14 ),
    .C( Pclk ),
    .K( s15 ),
    .\~Q ( s13 )
  );
  assign H_pixel = H_pixel_temp;
  assign V_pixel = V_pixel_temp;
endmodule

module VGA_top (
  input Clock
);
  wire s0;
  wire Pclk;
  wire [5:0] s1;
  wire [7:0] s2;
  wire [7:0] s3;
  wire [7:0] s4;
  wire [7:0] s5;
  wire [8:0] s6;
  wire [8:0] s7;
  wire s8;
  wire s9;
  wire H;
  wire V;
  wire [9:0] s10;
  wire [9:0] s11;
  DIG_D_FF_1bit #(
    .Default(0)
  )
  DIG_D_FF_1bit_i0 (
    .D( s0 ),
    .C( Clock ),
    .Q( Pclk ),
    .\~Q ( s0 )
  );
  // R_Pal
  DIG_ROM_64X8_R_Pal DIG_ROM_64X8_R_Pal_i1 (
    .A( s1 ),
    .sel( 1'b1 ),
    .D( s2 )
  );
  // G_Pal
  DIG_ROM_64X8_G_Pal DIG_ROM_64X8_G_Pal_i2 (
    .A( s1 ),
    .sel( 1'b1 ),
    .D( s3 )
  );
  // B_Pal
  DIG_ROM_64X8_B_Pal DIG_ROM_64X8_B_Pal_i3 (
    .A( s1 ),
    .sel( 1'b1 ),
    .D( s4 )
  );
  Vram Vram_i4 (
    .X( s6 ),
    .Y( s7 ),
    .Clk( Pclk ),
    .H_in( s8 ),
    .V_in( s9 ),
    .out_color( s5 ),
    .H_out( H ),
    .V_out( V )
  );
  vga_sync vga_sync_i5 (
    .en( 1'b1 ),
    .H_neg( 1'b1 ),
    .V_neg( 1'b1 ),
    .Pclk( Pclk ),
    .H_pixel( s10 ),
    .V_pixel( s11 ),
    .H_sync( s8 ),
    .V_sync( s9 )
  );
  assign s1 = s5[5:0];
  assign s6 = s10[8:0];
  assign s7 = s11[8:0];
endmodule
