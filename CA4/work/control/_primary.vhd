library verilog;
use verilog.vl_types.all;
entity control is
    port(
        func            : in     vl_logic_vector(5 downto 0);
        opcode          : in     vl_logic_vector(5 downto 0);
        equal           : in     vl_logic;
        ALUOP           : out    vl_logic_vector(2 downto 0);
        pcSrc           : out    vl_logic_vector(1 downto 0);
        MemRead         : out    vl_logic;
        MemToReg        : out    vl_logic;
        MemWrite        : out    vl_logic;
        ALUSrc          : out    vl_logic;
        RegWrite        : out    vl_logic;
        RegDst          : out    vl_logic;
        IF_Flush        : out    vl_logic
    );
end control;
