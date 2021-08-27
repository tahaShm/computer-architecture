library verilog;
use verilog.vl_types.all;
entity Comperator is
    port(
        x1              : in     vl_logic_vector(31 downto 0);
        x2              : in     vl_logic_vector(31 downto 0);
        q               : out    vl_logic
    );
end Comperator;
