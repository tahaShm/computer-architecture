library verilog;
use verilog.vl_types.all;
entity ALU is
    port(
        A               : in     vl_logic_vector(7 downto 0);
        B               : in     vl_logic_vector(7 downto 0);
        ALUOp           : in     vl_logic_vector(1 downto 0);
        ALUResult       : out    vl_logic_vector(7 downto 0)
    );
end ALU;
