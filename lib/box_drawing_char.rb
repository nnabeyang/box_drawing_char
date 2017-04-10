require "box_drawing_char/version"

def t_ary_num(v)
  v.to_s.to_i(3)
end
module BoxDrawingChar
class NAryNum < DelegateClass(Fixnum)
  def initialize(n, v_str)
    @ary = n
    super(v_str.to_i(@ary))
  end
  def to_s(ary = 3) 
    super(ary || @ary)
  end
  def inspect
    to_s
  end
  def <<(n)
    NAryNum.new(@ary, self * (@ary ** n)) 
  end
  def >>(n)
    NAryNum.new(@ary, self / (@ary ** n)) 
  end
  def &(other)
     a = self 
     b = other 
     out = 0
     i = 0
     while a > 0 ||  b > 0 do
       out += [(a  %  @ary), (b % @ary)].max * (@ary ** i)
       a /= @ary 
       b /= @ary 
       i+=1
     end
     NAryNum.new(@ary, out.to_s(3))
  end
end

class Char 
  attr_reader :code
  SPACE = ' '
  def initialize(ch)
    @code = NAryNum.new(3, dict.index(ch).to_s(3))
    puts ch if !@code
  end
  def dict
    @@dict ||= initDict
  end
  def +(other)
     a = @code
     b = dict.index(other) || other.code
     Char.new(dict[a & b])
  end
  def to_s
    dict[@code]
  end
  def inspect
    "BoxDrawing(#{dict[@code.to_s(3).to_i]}, #{"%04d" % @code.to_s(3).to_i})"
  end 
  def initDict
    #dict = MyArray.new
    dict = []
    dict[t_ary_num(0d0000)] = SPACE 

    dict[t_ary_num(0d0001)] = SPACE 

    dict[t_ary_num(0d0002)] = SPACE 

    dict[t_ary_num(0d0010)] = SPACE 

    dict[t_ary_num(0d0011)] = ?┐

    dict[t_ary_num(0d0012)] = ?┑

    dict[t_ary_num(0d0020)] = SPACE 

    dict[t_ary_num(0d0021)] = ?┒

    dict[t_ary_num(0d0022)] = ?┓

    dict[t_ary_num(0d0100)] = SPACE 

    dict[t_ary_num(0d0101)] = ?─

    dict[t_ary_num(0d0102)] = SPACE 

    dict[t_ary_num(0d0110)] = ?┌

    dict[t_ary_num(0d0111)] = ?┬ 

    dict[t_ary_num(0d0112)] = ?┭ 

    dict[t_ary_num(0d0120)] = ?┎ 

    dict[t_ary_num(0d0121)] = ?┰ 

    dict[t_ary_num(0d0122)] = ?┱

    dict[t_ary_num(0d0200)] = SPACE 

    dict[t_ary_num(0d0201)] = SPACE 

    dict[t_ary_num(0d0202)] = ?━

    dict[t_ary_num(0d0210)] = ?┍ 

    dict[t_ary_num(0d0211)] = ?┮ 

    dict[t_ary_num(0d0212)] = ?┯ 

    dict[t_ary_num(0d0220)] = ?┏ 

    dict[t_ary_num(0d0221)] = ?┲ 

    dict[t_ary_num(0d0222)] = ?┳ 

    dict[t_ary_num(0d1000)] = SPACE 

    dict[t_ary_num(0d1001)] = ?┘

    dict[t_ary_num(0d1002)] = ?┙ 

    dict[t_ary_num(0d1010)] = ?│

    dict[t_ary_num(0d1011)] = ?┤

    dict[t_ary_num(0d1012)] = ?┸

    dict[t_ary_num(0d1020)] = SPACE 
   
    dict[t_ary_num(0d1021)] = ?┧

    dict[t_ary_num(0d1022)] = ?┪

    dict[t_ary_num(0d1100)] = ?└

    dict[t_ary_num(0d1101)] = ?┴

    dict[t_ary_num(0d1102)] = ?┵

    dict[t_ary_num(0d1110)] = ?├

    dict[t_ary_num(0d1111)] = ?┼

    dict[t_ary_num(0d1112)] = ?┽

    dict[t_ary_num(0d1120)] = ?┟

    dict[t_ary_num(0d1121)] = ?╁

    dict[t_ary_num(0d1122)] = ?╅

    dict[t_ary_num(0d1200)] = ?┕

    dict[t_ary_num(0d1201)] = ?┶

    dict[t_ary_num(0d1202)] = ?┷

    dict[t_ary_num(0d1210)] = ?┝

    dict[t_ary_num(0d1211)] = ?┾

    dict[t_ary_num(0d1212)] = ?┿

    dict[t_ary_num(0d1220)] = ?┢

    dict[t_ary_num(0d1221)] = ?╆

    dict[t_ary_num(0d1222)] = ?╈

    dict[t_ary_num(0d2000)] = SPACE

    dict[t_ary_num(0d2001)] = ?┚

    dict[t_ary_num(0d2002)] = ?┛

    dict[t_ary_num(0d2010)] = SPACE 
   
    dict[t_ary_num(0d2011)] = ?┦

    dict[t_ary_num(0d2012)] = ?┩

    dict[t_ary_num(0d2020)] = ?┃

    dict[t_ary_num(0d2021)] = ?┨

    dict[t_ary_num(0d2022)] = ?┫

    dict[t_ary_num(0d2100)] = ?┖

    dict[t_ary_num(0d2101)] = ?┸

    dict[t_ary_num(0d2102)] = ?┹

    dict[t_ary_num(0d2110)] = ?┞

    dict[t_ary_num(0d2111)] = ?╀

    dict[t_ary_num(0d2112)] = ?╃

    dict[t_ary_num(0d2120)] = ?┠

    dict[t_ary_num(0d2121)] = ?╂

    dict[t_ary_num(0d2122)] = ?╉

    dict[t_ary_num(0d2200)] = ?┗

    dict[t_ary_num(0d2201)] = ?┺

    dict[t_ary_num(0d2202)] = ?┻

    dict[t_ary_num(0d2210)] = ?┡

    dict[t_ary_num(0d2211)] = ?╄

    dict[t_ary_num(0d2212)] = ?╇

    dict[t_ary_num(0d2220)] = ?┣

    dict[t_ary_num(0d2221)] = ?╊

    dict[t_ary_num(0d2222)] = ?╋

    dict
  end
end
end

