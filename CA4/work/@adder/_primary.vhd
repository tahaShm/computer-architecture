library verilog;
use verilog.vl_types.all;
entity Adder is
    port(
        x1              : in     vl_logic_vector(31 downto 0);
        x2              : in     vl_logic_vector(31 downto 0);
        q               : out    vl_logic_vector(31 downto 0)
    );
end Adder;
