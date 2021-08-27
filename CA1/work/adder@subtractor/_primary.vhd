library verilog;
use verilog.vl_types.all;
entity adderSubtractor is
    generic(
        n               : integer := 13
    );
    port(
        x1              : in     vl_logic_vector;
        x2              : in     vl_logic_vector;
        mode            : in     vl_logic;
        q               : out    vl_logic_vector
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of n : constant is 1;
end adderSubtractor;
