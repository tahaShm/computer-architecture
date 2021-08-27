library verilog;
use verilog.vl_types.all;
entity DataPath is
    port(
        clk             : in     vl_logic;
        rst             : in     vl_logic;
        pcWrite         : in     vl_logic;
        pcWriteCond     : in     vl_logic;
        pcSrc           : in     vl_logic;
        IorD            : in     vl_logic;
        memRead         : in     vl_logic;
        memWrite        : in     vl_logic;
        IrWrite         : in     vl_logic;
        MtoS            : in     vl_logic;
        ldA             : in     vl_logic;
        ldB             : in     vl_logic;
        srcA            : in     vl_logic;
        srcB            : in     vl_logic;
        push            : in     vl_logic;
        pop             : in     vl_logic;
        tos             : in     vl_logic;
        AluOp           : in     vl_logic_vector(1 downto 0);
        inst            : out    vl_logic_vector(7 downto 0)
    );
end DataPath;
