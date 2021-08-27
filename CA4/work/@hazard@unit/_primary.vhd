library verilog;
use verilog.vl_types.all;
entity HazardUnit is
    port(
        ID_EX_memRead   : in     vl_logic;
        ID_EX_Rt        : in     vl_logic_vector(4 downto 0);
        Rs              : in     vl_logic_vector(4 downto 0);
        Rt              : in     vl_logic_vector(4 downto 0);
        IF_ID_write     : out    vl_logic;
        pcWrite         : out    vl_logic;
        controlSel      : out    vl_logic
    );
end HazardUnit;
