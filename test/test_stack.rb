# this is a test file that tests the Stack class and its methods using the minitest framework.
# it requires the test_helper file, the stack file, and the minitest/autorun and minitest/pride gems to set up the testing environment.
require 'test_helper'
require 'stack'
# defines a test class called TestStack that inherits from Minitest::Test.
class TestStack < Minitest::Test
  # defines a setup method that creates a new instance of the Stack class and assigns it to the @stack instance variable.
  def setup
    @stack = Stack.new
  end
  # defines a test method for each test case
  # the test_new_stack_is_empty test checks if the stack is empty after initialization.
  def test_new_stack_is_empty
    # assert_nil checks if the actual value is nil, and if it is then the stack is empty and the test passes.
    assert_nil @stack.pop
    assert_nil @stack.max
  end
  # the test_push_validates_input test checks if the push method raises an ArgumentError when given invalid input.
  def test_push_validates_input
    # assert_raises checks if the block raises an ArgumentError when given invalid input (stack.rb line 13).
    assert_raises(ArgumentError) { @stack.push(-1) }
    assert_raises(ArgumentError) { @stack.push(1.5) }
    assert_raises(ArgumentError) { @stack.push("2") }
    assert_raises(ArgumentError) { @stack.push(nil) }
  end
  # the test_push_and_pop_single_element test checks if the push and pop methods work correctly for a single element.
  def test_push_and_pop_single_element
    # assert_equal checks if the actual value is equal to the expected value.
    @stack.push(5)
    assert_equal 5, @stack.max
    assert_equal 5, @stack.pop
    assert_nil @stack.max
    assert_nil @stack.pop
  end

  def test_max_with_duplicates
    @stack.push(5)
    @stack.push(5)
    assert_equal 5, @stack.max
    @stack.pop
    assert_equal 5, @stack.max
    @stack.pop
    assert_nil @stack.max
  end

  def test_stress_test
    # (1..1000).to_a creates an array of numbers from 1 to 1000.
    # .shuffle shuffles the array randomly.
    numbers = (1..1000).to_a.shuffle
    # loop over the array and pushes each number to the stack.
    numbers.each { |n| @stack.push(n) }
    # verify the max value is 1000
    assert_equal 1000, @stack.max
    
    # Verify FILO order
    # loop over the array in reverse order and pops each number from the stack.
    # assert_equal checks if the actual value is equal to the expected value.
    # assert_equal expected, actual 
    # expected is the expected value and actual is the actual value.
    numbers.reverse.each do |expected|
      assert_equal expected, @stack.pop
    end
  end
end