library verilog;
use verilog.vl_types.all;
entity signExtender is
    port(
        x               : in     vl_logic_vector(7 downto 0);
        q               : out    vl_logic_vector(15 downto 0)
    );
end signExtender;
