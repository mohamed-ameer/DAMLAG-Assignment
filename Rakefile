# we use require to load a file relative to the current working directory using absolute path
# we use require_relative to load a file relative to the file where it is called using relative path
# require_relative  using relative path
# require  using absolute path
# rake is a build tool that helps you automate tasks such as running tests, compiling code, and deploying applications.
# rakefile is a file that contains a set of tasks that can be executed by rake.
# rake in not in our current directory so we use require to load a file relative to the current working directory using absolute path.
require 'rake/testtask'
# define a test task that runs the test files in the test directory
Rake::TestTask.new(:test) do |t|
  # .libs << 'test' adds the test directory to the load path so that the test files can be found when they are required by rake  
  t.libs << 'test'
  t.libs << 'lib'
  # the test_files attribute specifies the test files to run using a glob pattern that matches all files in the test directory that end with _test.rb
  t.test_files = FileList['test/**/test_*.rb']
end

# define a default task that runs the test task when no task is specified when running rake 
# this line sets the default task for Rake to be the :test task
# When you run 'rake' without specifying a task name, it will execute the :test task by default.
# The syntax 'default: :test' creates a task named 'default' that depends on the :test task
# When you run 'rake', it will execute the 'default' task, which in turn executes the :test task.
# rake = rake default = rake test
task default: :test
