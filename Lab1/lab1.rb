class ComplexNumber
    attr_accessor :real, :imag
    @real
    @imag
    @@counter = {
        :add => 0,
        :multiply => 0,
        :bulk_add => 0,
        :bulk_mutiply => 0
    }

    def initialize(real, imag)
        @real = real
        @imag = imag
    end

    def +(c2)
        realPart = @real + c2.real
        imagPart = @imag + c2.imag
        puts "Plus Operator #{realPart} + #{imagPart}i"
        @@counter[:add] = @@counter[:add] + 1
    end

    def *(c2)
        t = ComplexNumber.new(1,1)
        realPart = (@real * c2.real) - (@imag * c2.imag)
        imagPart = (@real * c2.imag) + (@imag * c2.real)
        t.real = realPart
        t.imag = imagPart
        puts "Multiply Operator #{realPart} + #{imagPart}i"
        @@counter[:multiply] +=1
        return t
    end

    def self.bulk_add(c3)
        realPart = 0
        imagPart = 0

        c3.each do | c |
            realPart += c.real
            imagPart += c.imag
        end
        puts "Add Two #{realPart} + #{imagPart}i"
        @@counter[:bulk_add]+=1
    end

    def self.bulk_multiply(c3)
       t = ComplexNumber.new(1,1)

        c3.each do | c |
            if c3.index(c) == 0
                t = c
            else
                t = t * c
            end
        end
        puts "Multiply Two #{t.real} + #{t.imag}i"
        @@counter[:bulk_mutiply] =  @@counter[:bulk_mutiply]+ 1
    end

    def self.get_stats
        puts "Counter = #{@@counter}"
    end

end

c1 = ComplexNumber.new(3,2)
c2 = ComplexNumber.new(1,7)
c1 + c2
c1 * c2

c3 = Array[c1,c2]
ComplexNumber.bulk_add(c3)
ComplexNumber.bulk_multiply(c3)

ComplexNumber.get_stats