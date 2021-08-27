library verilog;
use verilog.vl_types.all;
entity lRegister is
    generic(
        n               : integer := 6
    );
    port(
        clk             : in     vl_logic;
        rst             : in     vl_logic;
        inp             : in     vl_logic_vector;
        load            : in     vl_logic;
        \out\           : out    vl_logic_vector
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of n : constant is 1;
end lRegister;
