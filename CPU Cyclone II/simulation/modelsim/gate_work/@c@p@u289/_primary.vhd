library verilog;
use verilog.vl_types.all;
entity CPU289 is
    port(
        clk             : in     vl_logic;
        sel7seg         : in     vl_logic_vector(4 downto 0);
        displays_7seg   : out    vl_logic_vector(27 downto 0);
        rst             : in     vl_logic
    );
end CPU289;
