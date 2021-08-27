library verilog;
use verilog.vl_types.all;
entity mainMem is
    port(
        clk             : in     vl_logic;
        read            : in     vl_logic;
        modAdr          : in     vl_logic_vector(14 downto 0);
        done            : out    vl_logic;
        data1           : out    vl_logic_vector(31 downto 0);
        data2           : out    vl_logic_vector(31 downto 0);
        data3           : out    vl_logic_vector(31 downto 0);
        data4           : out    vl_logic_vector(31 downto 0)
    );
end mainMem;
