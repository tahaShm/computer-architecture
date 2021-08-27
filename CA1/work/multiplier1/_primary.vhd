library verilog;
use verilog.vl_types.all;
entity multiplier1 is
    generic(
        n               : integer := 6
    );
    port(
        x1              : in     vl_logic_vector;
        x2              : in     vl_logic_vector;
        q               : out    vl_logic_vector
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of n : constant is 1;
end multiplier1;
