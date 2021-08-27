library verilog;
use verilog.vl_types.all;
entity MEM_WB is
    port(
        clk             : in     vl_logic;
        rst             : in     vl_logic;
        inRegwrite      : in     vl_logic;
        inMemtoreg      : in     vl_logic;
        inReadD         : in     vl_logic_vector(31 downto 0);
        inAlu           : in     vl_logic_vector(31 downto 0);
        inRd            : in     vl_logic_vector(4 downto 0);
        outRegwrite     : out    vl_logic;
        outMemtoreg     : out    vl_logic;
        outResult       : out    vl_logic_vector(31 downto 0);
        outFromAlu      : out    vl_logic_vector(31 downto 0);
        MemWbRd         : out    vl_logic_vector(4 downto 0)
    );
end MEM_WB;
