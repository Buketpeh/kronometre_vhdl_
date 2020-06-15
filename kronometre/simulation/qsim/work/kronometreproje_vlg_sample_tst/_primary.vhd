library verilog;
use verilog.vl_types.all;
entity kronometreproje_vlg_sample_tst is
    port(
        clock_50        : in     vl_logic;
        key             : in     vl_logic_vector(0 to 3);
        SW              : in     vl_logic_vector(0 to 9);
        sampler_tx      : out    vl_logic
    );
end kronometreproje_vlg_sample_tst;
