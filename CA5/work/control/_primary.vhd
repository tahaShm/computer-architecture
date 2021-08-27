library verilog;
use verilog.vl_types.all;
entity control is
    port(
        clk             : in     vl_logic;
        rst             : in     vl_logic;
        hit             : in     vl_logic;
        miss            : in     vl_logic;
        done            : in     vl_logic;
        hitCounter      : out    vl_logic_vector(14 downto 0);
        counter         : out    vl_logic_vector(14 downto 0);
        write           : out    vl_logic;
        read            : out    vl_logic;
        ready           : out    vl_logic
    );
end control;
