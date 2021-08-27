library verilog;
use verilog.vl_types.all;
entity CA1 is
    port(
        start           : in     vl_logic;
        clk             : in     vl_logic;
        rst             : in     vl_logic;
        done            : out    vl_logic;
        w7Copy          : out    vl_logic_vector(13 downto 0)
    );
end CA1;
