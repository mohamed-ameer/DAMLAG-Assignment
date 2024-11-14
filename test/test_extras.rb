require 'test_helper'
require 'extras'

# defines a new class called TestExtras that inherits from Minitest::Test
class TestExtras < Minitest::Test
  # defines a setup method that creates a new instance of the Extras class and assigns it to the @extras instance variable.
  def setup
  # creates a new instance of the Extras class and assigns it to the @extras instance variable.
    @extras = Extras.new
  end
  # defines a test method for each test case
  # the test_inheritance test checks if the Extras class inherits from the Stack class.
  def test_inheritance
    # assert_kind_of checks if the actual value is an instance of the expected class.
    # in this case, it checks if the @extras instance variable is an instance of the Stack class.
    assert_kind_of Stack, @extras
  end
  # the test_mean_empty_stack test checks if the mean method returns nil when the stack is empty.
  def test_mean_empty_stack
    assert_nil @extras.mean
  end
  # the test_mean_single_element test checks if the mean method returns the correct value when the stack contains a single element.
  def test_mean_single_element
    @extras.push(5)
    assert_equal 5.0, @extras.mean
  end
  # the test_mean_multiple_elements test checks if the mean method returns the correct value when the stack contains multiple elements.
  def test_mean_multiple_elements
    numbers = [2, 4, 6, 8]
    numbers.each { |n| @extras.push(n) }
    assert_equal 5.0, @extras.mean  # (2+4+6+8)/4 = 5.0
  end
  # the test_mean_after_pop test checks if the mean method returns the correct value after popping an element from the stack.
  def test_mean_after_pop
    [1, 2, 3].each { |n| @extras.push(n) }
    assert_equal 2.0, @extras.mean  # (1+2+3)/3 = 2.0
    
    @extras.pop  # removes 3 from the stack
    assert_equal 1.5, @extras.mean  # (1+2)/2 = 1.5
  end
  # the test_maintains_stack_functionality test checks if the mean method maintains the stack functionality by returning the correct value after popping an element from the stack.
  def test_maintains_stack_functionality
    [3, 7, 2, 9, 1].each { |n| @extras.push(n) }
    
    assert_equal 9, @extras.max
    assert_equal 4.4, @extras.mean  # (3+7+2+9+1)/5 = 4.4
    
    assert_equal 1, @extras.pop
    assert_equal 5.25, @extras.mean  # (3+7+2+9)/4 = 5.25
  end
  # the test_stress_test_with_mean test checks if the mean method returns the correct value for a large number of elements.
  # you can try 10 millions elements and see how long it takes to run as you asked in the task description.
  def test_stress_test_with_mean
    numbers = (1..1000).to_a
    numbers.each { |n| @extras.push(n) }
    # verify the mean value is correct
    expected_mean = numbers.sum.to_f / numbers.length
    assert_equal expected_mean, @extras.mean
    # pop 100 elements and verify the mean value is correct
    100.times { @extras.pop }
    new_numbers = numbers[0...900]
    new_expected_mean = new_numbers.sum.to_f / new_numbers.length
    assert_equal new_expected_mean, @extras.mean
  end
end