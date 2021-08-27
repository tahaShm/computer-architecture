library verilog;
use verilog.vl_types.all;
entity wndReg is
    port(
        clk             : in     vl_logic;
        rst             : in     vl_logic;
        wIn             : in     vl_logic_vector(1 downto 0);
        ld              : in     vl_logic;
        wOut            : out    vl_logic_vector(2 downto 0)
    );
end wndReg;
