library verilog;
use verilog.vl_types.all;
entity adder is
    generic(
        n               : integer := 2
    );
    port(
        x1              : in     vl_logic_vector;
        x2              : in     vl_logic_vector;
        q               : out    vl_logic_vector
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of n : constant is 1;
end adder;
