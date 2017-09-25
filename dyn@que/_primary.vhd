library verilog;
use verilog.vl_types.all;
entity dynQue is
    port(
        \in\            : in     vl_logic_vector(3 downto 0);
        \out\           : out    vl_logic
    );
end dynQue;
