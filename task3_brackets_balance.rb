class String
  def open_bracket?
  	['(', '{', '['].include? self
  end

  def closed_bracket?
  	[')', '}', ']'].include? self
  end

  def brackets_balanced?
  	a, h = [], {'(' => ')', '[' => ']', '{' => '}'}
  	self.each_char do |char|
  	  return false if char.closed_bracket? && a.empty? 
  	  a.push char  if char.open_bracket?
  	  a.pop        if char.closed_bracket? && h[a.last] == char  	  
  	end
  	a.empty?
  end
end

puts "()".brackets_balanced?
puts ")".open_bracket?

