class Object
  @@id, @@name = 0, ""
end

class Person < Object
  @@surname = ""

  def id
    @@id		
  end

  def name
  	@@name	
  end

  def surname
    @@surname		
  end
end

class Teacher < Person
  attr_reader :discipline

  def initialize(info = [])
    @@id = info[0].to_i
    @@name = info[1]
    @@surname = info[2]
    @discipline = info[3]
  end

  def show
  	puts "#{@@id}\t#{@@name}\t\t#{@@surname}\t\t#{@discipline}"	
  end

  def find_by_id(id)
  	file  = File.new('teachers.csv', 'r')
    file.each_line("\n") do |row|
      info = row.split(", ")
      if info[0].to_i == id
        @@id = info[0].to_i
        @@name = info[1]
        @@surname = info[2]
        @discipline = info[3]
        return self
      end
    end	
  end

  def show_all
    file = File.new('teachers.csv', 'r')
    file.each_line("\n") do |row|
      teacher = Teacher.new(row.split(", "))
      teacher.show
    end		
  end	
end

class Student < Person
  attr_reader :project

  def initialize(info = [])
    @@id      = info[0].to_i
    @@name    = info[1]
    @@surname = info[2]
    @project  = info[3]
  end

  def show
  	puts "#{@@id}\t#{@@name}\t\t#{@@surname}\t\t#{@project}"	
  end
end

class Project < Object
  attr_reader :description

  def initialize(info = [])
    @@id         = info[0].to_i
    @@name       = info[1]
    @description = info[2]
  end
	
  def show
   	puts "#{@@id}\t#{@@name}\t\t#{@@description}"	
  end 	
end

teacher = Teacher.new
teacher.show_all
puts
teacher.find_by_id(2).show
