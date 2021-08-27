library verilog;
use verilog.vl_types.all;
entity NeqReg is
    port(
        clk             : in     vl_logic;
        rst             : in     vl_logic;
        en              : in     vl_logic;
        init            : in     vl_logic;
        \out\           : out    vl_logic
    );
end NeqReg;
