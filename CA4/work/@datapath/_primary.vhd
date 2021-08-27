library verilog;
use verilog.vl_types.all;
entity Datapath is
    port(
        clk             : in     vl_logic;
        rst             : in     vl_logic;
        IF_Flush        : in     vl_logic;
        pcSrc           : in     vl_logic_vector(1 downto 0);
        RegWrite        : in     vl_logic;
        ALUSrc          : in     vl_logic;
        ALUOp           : in     vl_logic_vector(2 downto 0);
        RegDst          : in     vl_logic;
        memRead         : in     vl_logic;
        memWrite        : in     vl_logic;
        memToReg        : in     vl_logic;
        equal           : out    vl_logic;
        func            : out    vl_logic_vector(5 downto 0);
        opcode          : out    vl_logic_vector(5 downto 0)
    );
end Datapath;
