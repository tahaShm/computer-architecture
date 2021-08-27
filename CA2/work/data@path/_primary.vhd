library verilog;
use verilog.vl_types.all;
entity dataPath is
    port(
        clk             : in     vl_logic;
        rst             : in     vl_logic;
        ldw             : in     vl_logic;
        wdsel           : in     vl_logic;
        regwrite        : in     vl_logic;
        pc1sel          : in     vl_logic;
        pc2sel          : in     vl_logic;
        asel            : in     vl_logic;
        memread         : in     vl_logic;
        memwrite        : in     vl_logic;
        memtoreg        : in     vl_logic;
        aluop           : in     vl_logic_vector(2 downto 0);
        zero            : out    vl_logic;
        inst            : out    vl_logic_vector(15 downto 0)
    );
end dataPath;
