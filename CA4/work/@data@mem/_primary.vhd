library verilog;
use verilog.vl_types.all;
entity DataMem is
    port(
        clk             : in     vl_logic;
        rst             : in     vl_logic;
        address         : in     vl_logic_vector(31 downto 0);
        writeD          : in     vl_logic_vector(31 downto 0);
        memWrite        : in     vl_logic;
        memRead         : in     vl_logic;
        readD           : out    vl_logic_vector(31 downto 0)
    );
end DataMem;
