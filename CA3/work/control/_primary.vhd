library verilog;
use verilog.vl_types.all;
entity control is
    port(
        clk             : in     vl_logic;
        rst             : in     vl_logic;
        inst            : in     vl_logic_vector(7 downto 0);
        pcWrite         : out    vl_logic;
        pcWriteCond     : out    vl_logic;
        pcSrc           : out    vl_logic;
        IorD            : out    vl_logic;
        memRead         : out    vl_logic;
        memWrite        : out    vl_logic;
        IrWrite         : out    vl_logic;
        MtoS            : out    vl_logic;
        ldA             : out    vl_logic;
        ldB             : out    vl_logic;
        srcA            : out    vl_logic;
        srcB            : out    vl_logic;
        push            : out    vl_logic;
        pop             : out    vl_logic;
        tos             : out    vl_logic;
        AluOp           : out    vl_logic_vector(1 downto 0)
    );
end control;
