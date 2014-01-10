class Integer
  # task330
  # 6, 28, 496, 8128, 33550336, 8589869056, 137438691328
  def perfect
    a, n = [], self
    1.upto n do |i|
      1.upto(i / 2) { |j| a << j if i % j == 0 }
      if a.inject(:+) == i
        print "#{i} consists of "
        a.each { |k| print k, ' ' }
        puts "\n#{i} is perfect"
      end 
      a = []
    end
  end

  # task86 a, b
  def digits_count
    a, n = [], self
    print "#{n} consists of "
    begin
      a << n % 10
      n /= 10
    end while n > 0  
    a.reverse.each { |k| print k, ' ' }
    puts "and has #{a.length} digits"
    puts "sum is #{a.inject(:+)}"
  end
end

# 2535.perfect
# 3534535.digits_count