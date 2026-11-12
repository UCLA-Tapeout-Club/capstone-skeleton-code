module spi_shift (
    input logic clk,
    input logic rst_n,

    input logic sclk_rise,
    input logic sclk_fall,

    input logic cs_n_sync,
    input logic cs_n_rise,
    input logic cs_n_fall,

    input logic mosi_sync,
    output logic [7:0] rx_byte,
    output logic rx_valid,

    output logic miso,
    input logic [7:0] tx_byte
);

    logic [2:0] counter;
    logic [7:0] tx_reg;

    assign miso = tx_reg[7];

    always_ff @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            rx_byte <= '0;
            rx_valid <= 1'b0;
            tx_reg <= '0;
            counter <= '0;
        end else begin
            rx_valid <= 1'b0;

            if (sclk_rise && !cs_n_sync) begin
                rx_byte <= {rx_byte[6:0], mosi_sync};
                if (counter == 3'd7) rx_valid <= 1'b1;
                counter <= counter + 1;
            end

            if ((sclk_fall && !cs_n_sync) || cs_n_fall) begin
                if (counter == '0) begin
                    tx_reg <=  tx_byte;
                end else begin
                    tx_reg <= {tx_reg[6:0], 1'b0};
                end
            end

            if (cs_n_rise) counter <= '0;
        end
    end

endmodule
