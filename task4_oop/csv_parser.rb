class Teacher
  attr_reader :id, :name, :surname, :discipline

  def initialize(info = [])
    @id, @name, @surname, @discipline = info
    @id = @id.to_i
  end

  def show
    puts "#{@id}\t#{@name}\t\t#{@surname}\t\t#{@discipline}"  
  end

  def find_by_id(id)
    file  = File.new('teachers.csv', 'r')
    file.each_line("\n") do |row|
      info = row.split(", ")
      if info[0].to_i == id
        @id, @name, @surname, @discipline = info
        @id = @id.to_i
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

class Student
  attr_reader :id, :name, :surname, :project

  def initialize(info = [])
    @id, @name, @surname, @project = info
    @id = @id.to_i
  end

  def show
    puts "#{@id}\t#{@name}\t\t#{@surname}\t\t#{@project}" 
  end

  def find_by_id(id)
    file  = File.new('students.csv', 'r')
    file.each_line("\n") do |row|
      info = row.split(", ")
      if info[0].to_i == id
        @id, @name, @surname, @project = info
        @id = @id.to_i
        return self
      end
    end 
  end

  def show_all
    file = File.new('students.csv', 'r')
    file.each_line("\n") do |row|
      student = Student.new(row.split(", "))
      student.show
    end   
  end 
end

class Project
  attr_reader :id, :name, :description

  def initialize(info = [])
    @id, @name, @description = info
    @id = @id.to_i
  end
  
  def show
    puts "#{@id}\t#{@name}\t\t#{@description}"  
  end 

  def find_by_id(id)
    file  = File.new('projects.csv', 'r')
    file.each_line("\n") do |row|
      info = row.split(", ")
      if info[0].to_i == id
        @id, @name, @description = info
        @id = @id.to_i
        return self
      end
    end 
  end

  def show_all
    file = File.new('projects.csv', 'r')
    file.each_line("\n") do |row|
      project = Project.new(row.split(", "))
      project.show
    end   
  end   
end

teacher = Teacher.new
teacher.show_all
puts
teacher.find_by_id(2).show
