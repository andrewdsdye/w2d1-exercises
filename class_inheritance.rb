require "byebug"

class Employee

  attr_reader :name, :title, :salary
  attr_accessor :boss

  def initialize(name, title, salary, boss = nil)
    @name = name
    @title = title
    @salary = salary
    @boss = boss
  end


  def bonus(multiplier)
    self.salary * multiplier
  end

  def boss=(boss)
    @boss = boss
    boss.add_employee(self)
    boss
  end
end



class Manager < Employee

  attr_reader :employees

  def initialize(name, title, salary, boss = nil)
    super(name, title, salary, boss)
    @employees = []
  end


  def bonus(multiplier)
    self.employee_subsalary * multiplier
  end


  def employee_subsalary
    subsalary = 0
    self.employees.each do |employee|
      if employee.is_a?(Manager)
        subsalary += employee.salary + employee.employee_subsalary
      else
        subsalary += employee.salary
      end
    end

    subsalary
  end


  def add_employee(employee)
    self.employees << employee
  end

end
