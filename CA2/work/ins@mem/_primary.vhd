library verilog;
use verilog.vl_types.all;
entity insMem is
    port(
        address         : in     vl_logic_vector(9 downto 0);
        instruction     : out    vl_logic_vector(15 downto 0)
    );
end insMem;
