library verilog;
use verilog.vl_types.all;
entity Extender is
    port(
        x               : in     vl_logic_vector(15 downto 0);
        q               : out    vl_logic_vector(31 downto 0)
    );
end Extender;
