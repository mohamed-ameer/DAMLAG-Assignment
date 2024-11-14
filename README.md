# Stack Implementation

A Ruby implementation of a Stack data structure with additional functionality.

## Features

- Basic stack operations (push, pop)
- Constant-time maximum value retrieval
- Extended functionality (mean calculation)
- Comprehensive test suite
- Performance optimization test

## Installation

```bash
git clone [repository-url]
cd DAMLAG-Assignment
bundle install
```

## Running Tests

```bash
rake test
```

## Prove why is your solution considered fast(er)?

```bash
cd lib
ruby performance_test.rb
```

## Usage

```ruby
require_relative 'lib/stack'
require_relative 'lib/extras'

# Basic Stack usage
stack = Stack.new
stack.push(5)
stack.push(10)
puts stack.max  # => 10
puts stack.pop  # => 10

# Extended functionality
extras = Extras.new
extras.push(5)
extras.push(10)
puts extras.mean  # => 7.5
```