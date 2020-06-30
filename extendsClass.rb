require "./aliasPlus.rb"
require "./moduleTest.rb"
# require sẽ đọc và load file 1 lần duy nhất
#load sẽ đọc và load file được mỗi khi file đó được chạy
class Point3D < Point
    @@test = 2
    def initialize(x,y,z)
        super(x,y)
        @z = z; 
    end
    ORIGIN = Point3D.new(0,0,0)
    def to_s
        "(#@x, #@y, #@z)" # Variables @x and @y inherited?
    end
end
p2 = Point.new(1,2)
p3 = Point3D.new(1,2,3)
puts p2.to_s, p2.class # prints "(1,2)Point" 
puts p3.to_s, p3.class # prints "(1,2)Point3D"
puts Point.test , Point3D.test
puts Point::ORIGIN
puts Point3D::ORIGIN
include TestModule
chia
puts $LOAD_PATH