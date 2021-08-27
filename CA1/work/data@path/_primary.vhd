library verilog;
use verilog.vl_types.all;
entity dataPath is
    port(
        clk             : in     vl_logic;
        rst             : in     vl_logic;
        ldx1            : in     vl_logic;
        ldx2            : in     vl_logic;
        lda             : in     vl_logic;
        ldt             : in     vl_logic;
        ldw1            : in     vl_logic;
        initw1          : in     vl_logic;
        ldw2            : in     vl_logic;
        initb           : in     vl_logic;
        ldb             : in     vl_logic;
        initw2          : in     vl_logic;
        ldyin           : in     vl_logic;
        inityin         : in     vl_logic;
        enNEQ           : in     vl_logic;
        initNQ          : in     vl_logic;
        onesel          : in     vl_logic;
        twosel          : in     vl_logic;
        xwsel           : in     vl_logic;
        x1sel           : in     vl_logic;
        wsel            : in     vl_logic;
        x2sel           : in     vl_logic;
        fbsel           : in     vl_logic;
        secbsel         : in     vl_logic;
        present         : in     vl_logic_vector(3 downto 0);
        NEQ             : out    vl_logic;
        NEQOut          : out    vl_logic;
        EOF             : out    vl_logic;
        w1Out           : out    vl_logic_vector(13 downto 0);
        w2Out           : out    vl_logic_vector(13 downto 0);
        bOut            : out    vl_logic_vector(13 downto 0);
        w7Copy          : out    vl_logic_vector(13 downto 0)
    );
end dataPath;
