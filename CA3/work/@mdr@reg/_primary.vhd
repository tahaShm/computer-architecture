library verilog;
use verilog.vl_types.all;
entity MdrReg is
    port(
        clk             : in     vl_logic;
        rst             : in     vl_logic;
        inst            : in     vl_logic_vector(7 downto 0);
        MdrOut          : out    vl_logic_vector(7 downto 0)
    );
end MdrReg;
