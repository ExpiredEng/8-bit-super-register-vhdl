library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity reg is
port(
    data_in: in std_logic_vector(7 downto 0); -- 8 bit input data
    clk, data_sh_r, data_sh_l: in std_logic; -- clock, serial data input for right and left shift
    control: in std_logic_vector(2 downto 0); -- control signal
    data_out: out std_logic_vector(7 downto 0); -- 8 bit output data
    flag: out std_logic); -- flag output
end reg;

architecture fun of reg is
signal Q:std_logic_vector(7 downto 0);
begin
  process(clk)
    begin
        if clk'event and clk='1' then
            case control is
                when "000" => -- store the present data
                     Q<=Q; 
                when "001" => -- parallel load
                    Q<=data_in;
                when "010" => -- shift right
                    FOR i IN 0 TO 6 LOOP
                    Q(i) <= Q(i+1);        
                    END LOOP;        
                    Q(7) <= data_sh_r;                 
                when "011" => -- shift left
                    FOR i IN 0 TO 6 LOOP        
                    Q(7-i) <= Q(6-i);        
                    END LOOP;        
                    Q(0) <= data_sh_l;        
                when "100" => -- rotate right
                    for i in 0 to 6 LOOP
                        Q(i) <= Q(i+1);
                    END LOOP;
                    Q(7) <= Q(0);
                when "101" => -- rotate left
                    for i in 0 to 6 loop 
                        Q(i+1) <= Q(i);
                    END LOOP;
                    Q(0) <= Q(7);
                
                -- count functions
                when "110" => -- count up
                    q <= std_logic_vector(unsigned(q) + 1);
                when "111" => -- count down
                    q <= std_logic_vector(unsigned(q) - 1);
                    
                when others => Q<=Q; -- for invalid control inputs
            end case;
        end if;
    end process;
data_out<=Q;
flag<='1' when (Q="00000000" or Q="11111111") else '0';
end fun;