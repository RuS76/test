module test_module #(
    parameter DATA_W = 8
)(
    input  logic                        clk_in,
    input  logic                        reset_in,
    input  logic [(DATA_W - 1) : 0]     data_in,

    output logic [(DATA_W - 1) : 0]     out_0,
    output logic                        out_valid_0,
    output logic [(DATA_W - 1) : 0]     out_1,
    output logic                        out_valid_1,
    output logic [(DATA_W - 1) : 0]     out_2,
    output logic                        out_valid_2,
    output logic [(DATA_W - 1) : 0]     out_3,
    output logic                        out_valid_3
);


    // Constants


    // Interface signals


    // Work signals
    logic [3:0]                 out_valid;
    logic [3:0][DATA_W-1:0]     out_data;
    logic [3:0]                 catching;

    // Assigns
    assign out_0 = out_data[0];
    assign out_1 = out_data[1];
    assign out_2 = out_data[2];
    assign out_3 = out_data[3];
    assign out_valid_0 = out_valid[0];
    assign out_valid_1 = out_valid[1];
    assign out_valid_2 = out_valid[2];
    assign out_valid_3 = out_valid[3];

    // Set up if equal input data or less if eqaul input data
    always_comb begin

        for (int i = 3; i >= 0; i--) begin
            if (out_data[i] == data_in || (i < 3 && catching[i + 1] == 1'b1)) begin
                catching[i] = 1'b1;
            end else begin
                catching[i] = 1'b0;
            end
            // if(out_data[i] == data_in) begin
            //     catching[i] = 1'b1;
            // end else begin
            //     catching[i] = 1'b0;
            // end
        end

    end


    // Form output signals and data
    always_ff @(posedge clk_in) begin
        if (reset_in == 1'b1) begin
            out_valid <= '{default:'0};
            out_data <= '{default:'0};
        end else begin

            for (int i = 0; i < 4; i++) begin
                if (catching[i] == 1'b1 || |catching == 1'b0) begin
                    if (i == 0) begin
                        out_data[i] <= data_in;
                    end else begin
                        out_data[i] <= out_data[i - 1];
                    end
                end
            end

            for (int i = 0; i < 4; i++) begin
                if (catching[i] == 1'b1 || |catching == 1'b0) begin
                    if (i == 0) begin
                        out_valid[i] <= 1'b1;
                    end else begin
                        out_valid[i] <= out_valid[i - 1];
                    end
                end
            end

        end
    end

endmodule
