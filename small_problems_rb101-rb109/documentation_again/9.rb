require 'yaml'
MESSAGES = YAML.load_file('calculator_messages.yml')

# https://docs.ruby-lang.org/en/3.2/Psych.html#method-c-load_file
# On the YAML page, the Psych page is linked as "the YAML engine for Ruby"
# Under the Psych page, we find the load_file method.