library verilog;
use verilog.vl_types.all;
entity liRegister is
    generic(
        n               : integer := 13
    );
    port(
        clk             : in     vl_logic;
        rst             : in     vl_logic;
        a               : in     vl_logic_vector;
        load            : in     vl_logic;
        init            : in     vl_logic;
        \out\           : out    vl_logic_vector
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of n : constant is 1;
end liRegister;
