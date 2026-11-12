module spi_synchronizer (
    input logic clk,
    input logic rst_n,

    input logic sclk,
    input logic cs_n,
    input logic mosi,

    output logic mosi_sync,
    output logic cs_n_sync,

    output logic cs_n_rise,
    output logic cs_n_fall,

    output logic sclk_rise,
    output logic sclk_fall
);

    logic [1:0] sclk_sync_flop, cs_n_sync_flop, mosi_sync_flop;
    logic sclk_d, cs_n_d;

    assign mosi_sync = mosi_sync_flop[1];
    assign cs_n_sync = cs_n_sync_flop[1];

    assign cs_n_rise = cs_n_sync & ~cs_n_d;
    assign cs_n_fall = ~cs_n_sync & cs_n_d;

    assign sclk_rise = sclk_sync_flop[1] & ~sclk_d;
    assign sclk_fall = ~sclk_sync_flop[1] & sclk_d;

    always_ff @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            sclk_sync_flop <= 2'b00;
            cs_n_sync_flop <= 2'b11;
            mosi_sync_flop <= 2'b00;

            sclk_d <= 1'b0;
            cs_n_d <= 1'b1;
        end else begin
            sclk_d <= sclk_sync_flop[1];
            cs_n_d <= cs_n_sync_flop[1];

            sclk_sync_flop <= {sclk_sync_flop[0], sclk};
            mosi_sync_flop <= {mosi_sync_flop[0], mosi};
            cs_n_sync_flop <= {cs_n_sync_flop[0], cs_n};
        end
    end

endmodule
