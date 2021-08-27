library verilog;
use verilog.vl_types.all;
entity Cache is
    port(
        clk             : in     vl_logic;
        address         : in     vl_logic_vector(14 downto 0);
        data1           : in     vl_logic_vector(31 downto 0);
        data2           : in     vl_logic_vector(31 downto 0);
        data3           : in     vl_logic_vector(31 downto 0);
        data4           : in     vl_logic_vector(31 downto 0);
        write           : in     vl_logic;
        modAdr          : out    vl_logic_vector(14 downto 0);
        hit             : out    vl_logic;
        miss            : out    vl_logic;
        \out\           : out    vl_logic_vector(31 downto 0)
    );
end Cache;
