# array = [1,2,3,4,5,6,7,8,9,10];
# array[0..1] = 0,12;
# puts array;
# def break_string_to_a(str)
#   puts str.split
# end
# break_string_to_a("try hard to fresher")

class Test
    def m( str = "this is m method")
        puts str
    end
end
def ham_mu
    a = "a"
    b = "b"
    a <<= b
    return a
end

def ham_giao
    x = [1,2,3]
    y = [2,3,4]
    return x&=y
end

def test_a
    a = 10 # có nghĩa là nếu a = nil thì a sẽ được nhận giá trị là 20
    a ||= 20
    return a
end
def test_gan
    x,(y,z) = 1,2 #x = a và y,z = b
    return x,y,z
end
# toán tử =~ là so sánh chuỗi với regex xem có giống với bản mẫu không
# (1..10).each {|x| print x if x==3...x>=3 } # Prints "34"

def goi_ham_test_a
    y = test_a if defined? test_a
    puts y
    puts defined? test_a
end


# #for loop
# for value in enumerable do
    
# end

# #while
# while test
    
# end

# #case loop
# case 
# when 
    
# when 
    
# else
    
# end

# #until loop
# until test
    
# end

def modify_while
  x = 0
  puts x += 1 while x<10
end

def test_yield(n,m,c)
    i = 0
    while i < n
        yield m*i + c #truyền kết quả vào y và puts y ra màn hình
        i += 1
    end
end
def goi_ham_test_yield
    test_yield(3,5,1){|y| puts y}
end

def test_get_value
    array = [1,2,3,4,5,6]
    array = array.map{|val|
        val+=1
    }
    # puts array
    0.step(Math::PI,0.1) {|x|
        printf "%.2f ",x
    }
end

def test_as_var_dump
    str = {
        :a => "a",
        :b => "b",
        :c => {:d => "d"}
    }
    puts str.to_enum.inspect #inspect in ra thông tin của str
end
def test_select_reject_inject
    print 10.downto(1).select{|x| x%2==0
    }
    print 10.downto(1).reject{|x| x%2==0
    }

end
def test_with_index
    text = "I want to richman\nádasdasdsad"
    for line, number in text.each_line.with_index 
        print "#{number+1}: #{line}"
    end
end
def test_rescues
    iterator = 9.downto(1) 
    puts iterator.inspect
    begin
        print iterator.next while true 
    rescue StopIteration #báo lỗi
        puts "...blastoff!" 
    end
end
def test_to_enum(*enumerables,&block) 
    enumerators = enumerables.map {|e| e.to_enum }
    puts enumerators.inspect
    until enumerators.empty?
        begin
            e = enumerators.shift
            yield e.next
        rescue StopIteration #thực hiện khi có ngoại lê xảy ra
        else
            enumerators << e
        end
    end
    
end
def goi_ham_test_to_enum
    a,b,c = [1,2,3], 4..6, 'a'..'e'
    test_to_enum(a,b,c) {|x| print x}
end
def test_dup #tạo bản sao
    snapshot = self.dup # tạo 1 bản sao
end

def test_break_with_value
    arr = [1,2.3]
    arr.each{|a|
        puts a
    }
end

def bundle(*enumerables)
    enumerators = enumerables.map {|e| e.to_enum }
    loop { yield enumerators.map {|e| 
            e.next
        } 
    } 
end
a,b,c = [1,2,3], 4..6, 'a'..'e'
bundle(a,b,c) {|x| print x}
#bắt và xử lý ngoại lệ
module NgoaiLe
    class TenKhongTonTai        < StandardError; end
end
def test_xu_ly_ngoai_le_rescue_else_ensure
    begin
        name = nil
        raise NgoaiLe::TenKhongTonTai, "Tên không tồn tại "  if name.nil?
    rescue StandardError => e #thường hay sử dụng StandardError vì nó chứa khá đầy đủ các ngoại lệ
        puts e.inspect
    else
        p "else - chạy khi Không có bất kỳ ngoại lệ nào"
    ensure
        puts "ensure - Tôi luôn chạy dù có bất kỳ ngoại lệ nào"
    end
end
def test_catch_throw
    floor = [["Một", "Hai", "Ba"],
         ["Bốn", "Năm", "Sáu"],
         ["Bảy", "Tám", "Chín"]]
    number = 0
    tang = catch(:found) do
        floor.each do |row|
            row.each do |tile|
                number += 1
                throw(:found, tile) if tile == "Năm"
                puts tile
            end
        end
    end
    puts tang
    puts number
end
#threads, fiber 
def test_fiber
    f = Fiber.new do |message|
        puts "Caller said: #{message}" 
        message2 = Fiber.yield("Hello") 
        puts "Caller said: #{message2}" 
        "Fine"
    end
        response = f.resume("Hello") 
        puts "Fiber said: #{response}"
        response2 = f.resume("How are you?") # "How are you?" returned by Fiber.yield 
        puts "Fiber said: #{response2}"
end
#alias cung cấp bí danh 
class User
    def fullname
        "Nguyễn Sỹ Việt"
    end
    
    alias_method :username, :fullname # đổi bí danh ngay cả lớp con đều dùng đc
    alias_method :name, :username
    alias username fullname
    alias name username #đổi bí danh nhưng trả lại kết quả của lớp cha
end
def test_alias
    u = User.new
    p u.fullname
    p u.username
    p u.name
end
# một số hàm có tham số quá dài và k thể nhớ hết thứ tự các tham số vì vậy sẽ dùng tham số mảng băm
def sequence(args)
    n = args[:n] || 0
    m = args[:m] || 1
    c = args[:c] || 0
    puts "n = #{n},m = #{m},c = #{c}"
end
sequence({:n=>3, :m=>5})
sequence(:m=>3, :n=>5)
sequence c:1, m:3, n:5
#Proc và lambda
def test_proc
    proc = Proc.new {|x| puts x } #nếu proc return thì nó sẽ trả về ngay giá trị đó và dừng hàm 
                                    #còn lambda vẫn chạy đến cuối hàm
    [1,2,3].each(&proc)
    proc.call([1,2,3])
end
#proc không kiểm tra số lượng tham số , nếu k có tham số thì sẽ nhận nil
#lambda kiểm tra số lượng tham số , nếu số lượng tham só không đúng sẽ báo lỗi
def test_lambda
    lambda_say = ->{puts "This is lambda"} #khởi tạo lambda không có đối số
    lambda_say.call
    #hoặc là  lambda_say = lambda { puts "This is a lambda" }
    lambda_say2 = ->(x){x*2} #khởi tạo lambda có đối số
    puts lambda_say2.call(10)
end
#truyền lambda vào hàm
lambda_t = lambda {|phuongthuc|
    if phuongthuc == '+'
        return 1+2
    else
        return 2-1
    end
}
def tinh(phuongthuc)
    yield(phuongthuc) #yield là để đánh dấu chỗ nào sử dụng hàm lambda
end
puts tinh('+',&lambda_t) #dấu & để kí hiệu đây là lambda
#truyền proc vào hàm
proc = Proc.new {|x| puts x+1}
def tinhtoanlinhtinh(a,b,pr)
    pr.call(a+b)
end
puts tinhtoanlinhtinh(2,6,proc)
# Return an array of lambdas that multiply by the arguments 
def multipliers(*args)
    x = nil
    args.map {|x| lambda {|y| x*y }} 
end
double,triple = multipliers(2,3)
puts double.inspect
puts double.call(2) # Prints 4
puts triple.call(2) # Prints 6
#
def multiplier(n)
    lambda {|data| data.collect{|x| x*n } } 
end
doubler = multiplier(2) # Get a lambda that knows how to double 
print doubler.call([1,2,3])
puts
eval("n=3",doubler.binding) #hàm động tác động lại cấu trúc lambda của doubler
print doubler.call([1,2,3])
 #unbound object method
case_choose = gets.chomp.to_i
unbound_plus = Fixnum.instance_method("+")
case case_choose
when 1
    plus_2 = unbound_plus.bind(2)
    sum = plus_2.call(2)
    puts "case is 1"
when 2 
    plus_3 = plus_2.unbind.bind(3)
    puts "case is 2"
else
    puts "else anything"
end

puts Numeric===123