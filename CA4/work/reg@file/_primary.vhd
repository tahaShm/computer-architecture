library verilog;
use verilog.vl_types.all;
entity regFile is
    port(
        clk             : in     vl_logic;
        rst             : in     vl_logic;
        readR1          : in     vl_logic_vector(4 downto 0);
        readR2          : in     vl_logic_vector(4 downto 0);
        writeR          : in     vl_logic_vector(4 downto 0);
        writeD          : in     vl_logic_vector(31 downto 0);
        regWrite        : in     vl_logic;
        readD1          : out    vl_logic_vector(31 downto 0);
        readD2          : out    vl_logic_vector(31 downto 0)
    );
end regFile;
