library verilog;
use verilog.vl_types.all;
entity DataMem is
    port(
        address         : in     vl_logic_vector(9 downto 0);
        writeData       : in     vl_logic_vector(15 downto 0);
        memWrite        : in     vl_logic;
        memRead         : in     vl_logic;
        readData        : out    vl_logic_vector(15 downto 0)
    );
end DataMem;
