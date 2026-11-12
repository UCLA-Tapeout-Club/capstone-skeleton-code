module spi_slave (
    input logic clk,
    input logic rst_n,

    // need to be synchronized
    input logic sclk,
    input logic cs_n,
    input logic mosi,

    // data from slave to master
    input logic [7:0] tx_byte,
    output logic miso,
    output logic miso_enable,

    // data going into slave
    output logic [7:0] rx_byte,
    output logic rx_valid
);
    logic cs_n_sync, mosi_sync;
    logic cs_n_rise, cs_n_fall;
    logic sclk_rise, sclk_fall;

    spi_synchronizer sync (
        .clk(clk),
        .rst_n(rst_n),

        .sclk(sclk),
        .mosi(mosi),
        .cs_n(cs_n),

        .cs_n_sync(cs_n_sync),
        .mosi_sync(mosi_sync),

        .cs_n_rise(cs_n_rise),
        .cs_n_fall(cs_n_fall),

        .sclk_rise(sclk_rise),
        .sclk_fall(sclk_fall)
    );
    
    assign miso_enable = !cs_n_sync;

    spi_shift shifter (
        .clk(clk),
        .rst_n(rst_n),

        .sclk_rise(sclk_rise),
        .sclk_fall(sclk_fall),

        .cs_n_sync(cs_n_sync),
        .cs_n_rise(cs_n_rise),
        .cs_n_fall(cs_n_fall),

        .mosi_sync(mosi_sync),
        .rx_byte(rx_byte),
        .rx_valid(rx_valid),

        .miso(miso),
        .tx_byte(tx_byte)
    );

endmodule
