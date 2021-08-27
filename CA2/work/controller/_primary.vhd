library verilog;
use verilog.vl_types.all;
entity controller is
    port(
        clk             : in     vl_logic;
        zero            : in     vl_logic;
        ins             : in     vl_logic_vector(15 downto 0);
        aluop           : out    vl_logic_vector(2 downto 0);
        pc1sel          : out    vl_logic;
        pc2sel          : out    vl_logic;
        wdsel           : out    vl_logic;
        ldw             : out    vl_logic;
        regwrite        : out    vl_logic;
        asel            : out    vl_logic;
        memwrite        : out    vl_logic;
        memread         : out    vl_logic;
        memtoreg        : out    vl_logic
    );
end controller;
