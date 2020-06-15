library verilog;
use verilog.vl_types.all;
entity kronometreproje is
    port(
        hex0            : out    vl_logic_vector(0 to 6);
        hex1            : out    vl_logic_vector(0 to 6);
        hex2            : out    vl_logic_vector(0 to 6);
        hex3            : out    vl_logic_vector(0 to 6);
        SW              : in     vl_logic_vector(0 to 9);
        key             : in     vl_logic_vector(0 to 3);
        clock_50        : in     vl_logic
    );
end kronometreproje;
