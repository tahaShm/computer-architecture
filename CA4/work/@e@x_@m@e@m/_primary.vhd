library verilog;
use verilog.vl_types.all;
entity EX_MEM is
    port(
        clk             : in     vl_logic;
        rst             : in     vl_logic;
        inRegwrite      : in     vl_logic;
        inMemtoreg      : in     vl_logic;
        inMemwrite      : in     vl_logic;
        inMemread       : in     vl_logic;
        inAluz          : in     vl_logic;
        inResult        : in     vl_logic_vector(31 downto 0);
        inForward       : in     vl_logic_vector(31 downto 0);
        inRdout         : in     vl_logic_vector(4 downto 0);
        outRegwrite     : out    vl_logic;
        outMemtoreg     : out    vl_logic;
        outMemwrite     : out    vl_logic;
        outMemread      : out    vl_logic;
        outAluz         : out    vl_logic;
        outResult       : out    vl_logic_vector(31 downto 0);
        outForward      : out    vl_logic_vector(31 downto 0);
        ExMemRd         : out    vl_logic_vector(4 downto 0)
    );
end EX_MEM;
