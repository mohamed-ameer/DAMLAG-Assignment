# this is a test helper file that sets up the testing environment for the Extras class.
# it requires the minitest/autorun and minitest/pride gems, and sets up the SimpleCov gem to track code coverage.
# it also adds the lib directory to the load path, so that the Extras class can be found when it is required.
# this file is typically used in conjunction with a test file that tests the Extras class.
# the test file will require this file, and then require the Extras class, and then run the tests.
# these kind of files we call it manifest file which is a file that links oter files together.

require 'simplecov'
SimpleCov.start

require 'minitest/autorun'
require 'minitest/pride'

# Add lib directory to load path
# (This is not necessary if you use bundler and have a Gemfile)
# $LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)