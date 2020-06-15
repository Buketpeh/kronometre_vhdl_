library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity kronometreproje is 
port(
     hex0 :out std_logic_vector(0 to 6); --kullanılan displayler
	  hex1 :out std_logic_vector(0 to 6);--0 dan 6 ya kadar 7 bitten oluşuyor 
	  hex2 :out std_logic_vector(0 to 6);
	  hex3 :out std_logic_vector(0 to 6);
	  SW: in std_logic_vector(0 to 9);  
	  key: in std_logic_vector(0 to 3); 
	  clock_50 : std_logic 
     );
function segment (s: integer:=0) 
return std_logic_vector is
begin
case s is
  when 0 => return "0000001"; 
  when 1 => return "1001111"; 
  when 2 => return "0010010";
  when 3 => return "0000110";
  when 4 => return "1001100";
  when 5 => return "0100100";
  when 6 => return "0100000";
  when 7 => return "0001101";
  when 8 => return "0000000";
  when 9 => return "0000100";
  when others => return "1111111";
  end case;
  end segment;
 end;

architecture counter of kronometreproje is  
signal count : integer :=1;   
signal clk : std_logic :='0';  --sayaca 1 atanmış clk a 0 bit atanmış iyiside sinyal
begin

--50MHz'den 10hz'ye saat bölücü
process(clock_50) -- 
begin
if(clock_50'event and clock_50='1') then --yükselen kenarı belirleyen satır
count <=count+1; --sayac arttırılıyor 
if(count = 2500000) then 
clk <= not clk;
count <=1;
end if;
end if;
end process;
--clk süresi 0.1 saniyedir
process(clk) 
type timee is array(0 to 3) of integer;
variable zetime: timee:=(0,0,0,0);
variable flag: std_logic;
begin
if(key(0)'event and key(0)'last_value='0') then --basma düğmesi yapmak için 
flag:=not flag;
end if;

if(clk'event and clk='1' and flag='1') then 
zetime(0):=zetime(0)+1;
if(zetime(0)=10) then
zetime(0):=0;
zetime(1):=zetime(1)+1;
if(zetime(1)=10) then
zetime(1):=0;
zetime(2):= zetime(2)+1;
if(zetime(2)=6) then 
zetime(2):=0;
zetime(3):=zetime(3)+1;
end if;
end if;
end if;
end if;
--7-segments resetleme işlemi yapılıyor bu ksıımda

if(key(1)='0') then 
zetime:=(0,0,0,0);
end if;
 --fonksiyonlar çağrılıyor
hex0<=segment(zetime(0));
hex1<=segment(zetime(1));
hex2<=segment(zetime(2));
hex3<=segment(zetime(3));
end process;
end;

 