class Stack
  # i will implement the push, pop, and max methods by using the built-in data structures in ruby language to store the stack data which is an array.
  # initialize a new stack object with an empty array to store the stack data and an empty array to store the maximum values.
  def initialize
    @items = []
    @max_cache = []
  end
  
  # the push method will add a new element to the stack.
    def push(number)
      # check if the number is a non-negative integer and raise an error if it is not.
      if !number.is_a?(Integer) || number < 0
        raise ArgumentError, "Number must be non-negative"
      end
      # add the number to the end of the items array to store it in the stack.
      @items.push(number)
      # if max_cache is empty or the new number is greater than or equal to the current max
      # add it to max_cache to maintain the maximum value tracking
      if @max_cache.empty? || number >= @max_cache.last
        @max_cache.push(number)
      end
    end
  # the pop method will remove the top element from the stack.
    def pop
      # if the stack is empty, return nil
      return nil if @items.empty?
      # store the popped value in local variable 
      popped = @items.pop
      # if max_cache is not empty and the popped number is the current max value 
      # then pop it from max_cache as well to maintain the maximum value tracking
      if !@max_cache.empty? && popped == @max_cache.last
        @max_cache.pop
      end
      # return the popped value so may we need it later
      popped
    end
  # the max method will return the maximum value in the stack.
    def max
      @max_cache.empty? ? nil : @max_cache.last
    end
  
    protected
    # the items method is protected rather than private because:
    # 1- protected methods can be called by any instance of the same class or its subclasses
    # 2- this allows the Extras subclass to access @items while inheriting Stack class
    # 3- protected provides encapsulation by preventing external access from unrelated classes
    # 4- unlike private, protected enables object-to-object communication within the class and its subclasses but restricts access from outside the class
    # 5- but private methods can only be called by the instance of the same class, not its subclasses
    # 6- and public methods can be called by any instance of the class or its subclasses or any other class that has access to the instance of the class or its subclasses 
    def items
      @items
    end
  end