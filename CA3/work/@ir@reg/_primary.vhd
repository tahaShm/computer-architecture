library verilog;
use verilog.vl_types.all;
entity IrReg is
    port(
        clk             : in     vl_logic;
        rst             : in     vl_logic;
        inst            : in     vl_logic_vector(7 downto 0);
        IrWrite         : in     vl_logic;
        IrOut           : out    vl_logic_vector(7 downto 0)
    );
end IrReg;
