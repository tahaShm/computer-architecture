library verilog;
use verilog.vl_types.all;
entity ID_EX is
    port(
        clk             : in     vl_logic;
        rst             : in     vl_logic;
        inAlusrc        : in     vl_logic;
        inRegdst        : in     vl_logic;
        inMemread       : in     vl_logic;
        inMemwrite      : in     vl_logic;
        inRegwrite      : in     vl_logic;
        inMemtoreg      : in     vl_logic;
        inAluop         : in     vl_logic_vector(2 downto 0);
        inR1            : in     vl_logic_vector(31 downto 0);
        inR2            : in     vl_logic_vector(31 downto 0);
        inim            : in     vl_logic_vector(31 downto 0);
        inRt            : in     vl_logic_vector(4 downto 0);
        inRd            : in     vl_logic_vector(4 downto 0);
        inRs            : in     vl_logic_vector(4 downto 0);
        outAlusrc       : out    vl_logic;
        outRegdst       : out    vl_logic;
        outMemread      : out    vl_logic;
        outMemwrite     : out    vl_logic;
        outRegwrite     : out    vl_logic;
        outMemtoreg     : out    vl_logic;
        outR1           : out    vl_logic_vector(31 downto 0);
        outR2           : out    vl_logic_vector(31 downto 0);
        outim           : out    vl_logic_vector(31 downto 0);
        outRt           : out    vl_logic_vector(4 downto 0);
        outRd           : out    vl_logic_vector(4 downto 0);
        outRs           : out    vl_logic_vector(4 downto 0);
        outAluop        : out    vl_logic_vector(2 downto 0)
    );
end ID_EX;
