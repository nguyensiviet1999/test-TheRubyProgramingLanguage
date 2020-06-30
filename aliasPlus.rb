class Point
    attr_accessor :x,:y # khai báo rằng 2 biến đều có thể đọc và ghi tiếp
    attr_reader :x, :y # Define reader methods for our instance variables
    attr :x # Define a trivial getter method x for @x 
    attr :y, true # Define getter and setter methods for @y
    @@n = 0  #@@ là biến class , là biến dùng chung của tất cả object, có thể thay đổi giá trị
    @@totalX = 0 
    @@totalY = 0
    @@test = 1
    def initialize(x,y)
        @x,@y = x,y
        @@n += 1 # Keep track of how many Points have been created 
        @@totalX += x # Add these coordinates to the totals
        @@totalY += y
    end
    ORIGIN = Point.new(0,0) #constants được định nghĩa sau method initialize
    def self.test; @@test = 2; end
    def self.report #cach khai báo khác của 1 method class
        # Here we use the class variables in a class method 
        puts "Number of points created: #@@n"
        puts "Average X coordinate: #{@@totalX.to_f/@@n}" 
        puts "Average Y coordinate: #{@@totalY.to_f/@@n}"
        end
    def to_s #định dạng kiểu khi in ra
        "(#@x,#@y)"  
    end

    def x  #getter for @x
        @x
    end

    def y; @y; end #getter for @y

    def x=(value) #setter for @x
        @x = value
    end

    def y=(value) #setter for @y
        @y = value
    end

    def +(other)
        raise TypeError, "Point argument expected" unless other.is_a? Point
        Point.new(@x+other.x,@y+other.y)
    end

    def -@
        Point.new(-@x,-@y)
    end
    def  *(scalar)
        Point.new(@x*scalar, @y*scalar)
    end
    def [](index)
        case index
        when 0, -2; @x 
        when 1, -1; @y           
        else nil   
        end
    end
    def each
        yield @x
        yield @y
    end
    def ==(o)
        if o.is_a? Point
            @x==o.x && @y==o.y
        else
            false
        end
    end
    def <=>(other)
        return nil unless other.instance_of? Point
        @x**2 + @y**2 <=> other.x**2 + other.y**2 
    end
    def add!(p) # Add p to self, return modified self . Thêm Dấu ! nếu muốn thay đổi giá trị của biến
        @x += p.x
        @y += p.y
        self
    end
    private :add! # làm cho hàm add! trở thành hàm private
    def Point.sum(*points) # Gọi là 1 method class
        x=y= 0
        points.each {|p| x += p.x; y += p.y }
        Point.new(x,y)   
    end
end

point = Point.new(20,10)
puts point
point.x = 12
point.y = 50
puts point.x


point_1 = Point.new(10,20)
point_2 = Point.new(10,78)
puts point_1+point_2
puts -point_2
puts point_2[0]
point_2.each {|coordinates| puts coordinates} #hàm each này là hàm tạo trong class
puts point_1==point_2
puts point_1<=>point_2
# puts point.add!(point_1)  
puts Point.sum(point,point_1,point_2) #dùng chính đối tượng Point để gọi
puts Point::ORIGIN 
puts Point.report
