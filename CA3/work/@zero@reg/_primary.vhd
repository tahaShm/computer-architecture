library verilog;
use verilog.vl_types.all;
entity ZeroReg is
    port(
        clk             : in     vl_logic;
        rst             : in     vl_logic;
        \in\            : in     vl_logic_vector(7 downto 0);
        \out\           : out    vl_logic
    );
end ZeroReg;
