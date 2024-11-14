# Way 1:  the core native implementation of stack
class NaiveStack
    # here we are using only array create a stack
    def initialize
      @items = []
    end
  
    def push(number)
      @items.push(number)
    end
  
    def pop
      @items.pop
    end
  
    def max
      @items.max
    end
  end
  
  # Way 2: my own optimized implementation
  class OptimizedStack
    # here we are using array create a stack and max_cache array to store the max value of the stack at each step of the stack push and pop operations.
    def initialize
      @items = []
      @max_cache = []
    end
  
    def push(number)
      @items.push(number)
      if @max_cache.empty? || number >= @max_cache.last
        @max_cache.push(number)
      end
    end
  
    def pop
      return nil if @items.empty?
      popped = @items.pop
      if !@max_cache.empty? && popped == @max_cache.last
        @max_cache.pop
      end
      popped
    end
  
    def max
      @max_cache.empty? ? nil : @max_cache.last
    end
  end
  
  # performance test for both implementations of stack using benchmark library.
  # benchmark library is a tool that allows you to measure the performance of your code.
  # this will measure the time taken by each implementation to perform a large number of max() calls on a stack of 1 million numbers.
  require 'benchmark'
  # run_performance_test method is used to run the performance test for both implementations of stack.
  # it creates two stacks, one using the NaiveStack class and the other using the OptimizedStack class.
  # it then fills both stacks with the same numbers and performs a large number of max() calls on each stack.
  # it then measures the time taken by each implementation to perform these max() calls and prints the results.
  # the results show that the optimized implementation is much faster than the naive implementation.
  def run_performance_test
    n = 1_000_000  # 1 million numbers (in algorithm we use 'n' to represent the size of the inputs)
    max_calls = 1000  # 10 million max calls
    # create two stacks, one using the NaiveStack class and the other using the OptimizedStack class.
    naive = NaiveStack.new
    optimized = OptimizedStack.new
    
    # fill both stacks with same numbers
    numbers = Array.new(n) { rand(1000000) }
    numbers.each do |num|
      naive.push(num)
      optimized.push(num)
    end
    
    puts "testing max() performance..."
    puts "\nnaive implementation:"
    time_naive = Benchmark.measure do
      max_calls.times { naive.max }
    end
    
    puts "\noptimized Implementation:"
    time_optimized = Benchmark.measure do
      max_calls.times { optimized.max }
    end
    
    puts "\nResults for #{max_calls} max() calls:"
    puts "Naive: #{time_naive.real} seconds"
    puts "Optimized: #{time_optimized.real} seconds"
  end
  
  # run the performance test
  run_performance_test
# Complexity Analysis:
#     Native implementation:
#     1. push: O(1)
#     2. pop:  O(1)
#     3. max:  O(n) -it will scan entire array each time, for m max() calls with n items: O(m * n)
    
#     My  optimized implementation:
#     1. push: O(1)
#     2. pop:  O(1)
#     3. max:  O(1) -it will just returns last element of max_cache, for m max() calls with n items: O(m)
        
#     Example with real numbers:
#     - n = 1 million items
#     - m = 1000 max() calls
    
#     Naive Way:
#     - Each max() call scans 1 million items
#     - Total operations: 1000 * 1 million = 1000_000_000 operations
    
#     Optimized Way:
#     - Each max() call is just one operation
#     - Total operations: 1000 operations
