class Student
  def initialize(name, year)
    @name = name
    @year = year
  end
end

class Graduate < Student
  def initialize(name, year, parking)
    @parking = parking
    super(name, year)
  end
end

class Undergraduate < Student
end

# Further exploration: if `Student` had another method which takes no arguments, but some sub-class has a method with the same name which does take arguments, `super()` could be used within the sub-class method to call the `Student` method before (or after) using the arguments passed in some other way.