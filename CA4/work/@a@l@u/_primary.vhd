library verilog;
use verilog.vl_types.all;
entity ALU is
    port(
        A               : in     vl_logic_vector(31 downto 0);
        B               : in     vl_logic_vector(31 downto 0);
        ALUOp           : in     vl_logic_vector(2 downto 0);
        zero            : out    vl_logic;
        Result          : out    vl_logic_vector(31 downto 0)
    );
end ALU;
