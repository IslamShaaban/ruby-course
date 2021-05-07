class ComplexNumber

    @@operations = 0
    attr_accessor :real, :img

    def initialize(real_part, img_part)
        @real = real_part
        @img  = img_part
    end
  
    def +(other)
        @@operations += 1
        real = @real + other.real
        img  = @img  + other.img
        ComplexNumber.new(real, img)
    end
  
    def -(other)
        @@operations += 1
        real = @real - other.real
        img  = @img  -  other.img
        ComplexNumber.new(real, img)
    end

    def *(other)
        @@operations += 1
        real = @real * other.real - @img * other.img
        img  = @real * other.img  + @img * other.real
        ComplexNumber.new(real, img)
    end
  
    def self.bulk_add(others) 
        sum_of_cmpxs = ComplexNumber.new(0, 0)
        others.each do |other|
        sum_of_cmpxs += other
        end
        sum_of_cmpxs
    end

    def self.bulk_multiply(others)
        multiply_of_cmpxs = others.first
        others.drop(1).each do |other|
        multiply_of_cmpxs *= other
        end
        multiply_of_cmpxs
    end
    

    def self.no_of_ops()
        @@operations
    end

    #Display of Object
    def to_s
        if self.img < 0
            "#{self.real} - #{self.img.abs}i"
        else
            "#{self.real} + #{self.img}i"
        end
    end
end
  
cmpx1 = ComplexNumber.new(7, 5)
cmpx2 = ComplexNumber.new(3, 9)
cmpx3 = ComplexNumber.new(4, 9)
  
puts "Addition = #{cmpx1 + cmpx2}"

puts "Subtraction = #{cmpx1 - cmpx2}"

puts "Multiplication = #{cmpx1 * cmpx2}"

puts "Number of Operations: #{ComplexNumber.no_of_ops()}"

cmpx_arr = [cmpx1, cmpx2, cmpx3]

puts "Sum of Complex Numbers: #{ComplexNumber.bulk_add(cmpx_arr)}"

puts "Multiply of Complex Numbers: #{ComplexNumber.bulk_multiply(cmpx_arr)}"