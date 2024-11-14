# imports the stack class from the stack.rb file 
# require_relative is used to load a file relative to the file where it is called using relative path
# require is used to load a file relative to the current working directory using absolute path
require_relative 'stack'
# defines a new class called Extras that inherits from the Stack class
class Extras < Stack
  # initialize method is called when a new instance of the class is created
  # it calls the initialize method of the parent class (Stack) using super
  # it also initializes two instance variables: @sum and @count to 0
  def initialize
    super
    # @sum is used to store the sum of all the numbers pushed into the stack
    @sum = 0
    # @count is used to store the number of elements in the stack
    @count = 0
  end
  # the push method is called when a new number is pushed into the stack 
  # it calls the push method of the parent class (Stack) using super
  # it also updates the @sum and @count instance variables
  def push(number)
    super(number)
    @sum += number
    @count += 1
  end
  # the pop method is called when an element is popped from the stack
  # it calls the pop method of the parent class (Stack) using super
  # it also updates the @sum and @count instance variables
  def pop
    number = super
    if number
      @sum -= number
      @count -= 1
    end
    number
  end
  # the mean method is called to calculate the mean of all the numbers in the stack 
  # it returns nil if the stack is empty, otherwise it returns the mean of all the numbers in the stack
  def mean
    @count.zero? ? nil : (@sum.to_f / @count)
  end
end