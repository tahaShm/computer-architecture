library verilog;
use verilog.vl_types.all;
entity multiplier2 is
    port(
        x1              : in     vl_logic_vector(13 downto 0);
        x2              : in     vl_logic_vector(6 downto 0);
        q               : out    vl_logic_vector(13 downto 0)
    );
end multiplier2;
