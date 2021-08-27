library verilog;
use verilog.vl_types.all;
entity IF_ID is
    port(
        clk             : in     vl_logic;
        rst             : in     vl_logic;
        IF_ID_write     : in     vl_logic;
        flush           : in     vl_logic;
        inpc            : in     vl_logic_vector(31 downto 0);
        inInst          : in     vl_logic_vector(31 downto 0);
        outpc           : out    vl_logic_vector(31 downto 0);
        outInst         : out    vl_logic_vector(31 downto 0)
    );
end IF_ID;
