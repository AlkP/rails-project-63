install:
	@bundle install

lint:
	@rubocop

tests:
	@ruby test/test_hexlet_code.rb
