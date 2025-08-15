require 'minitest/autorun'
require 'minitest/reporters'
Minitest::Reporters.use!

require_relative 'cash_register'
require_relative 'transaction'

class CashRegisterTest < Minitest::Test

  def setup
    @register = CashRegister.new(100)
  end
  
  def test_accept_money
    transaction = Transaction.new(10)
    transaction.amount_paid = 5
    @register.accept_money(transaction)
    assert_equal 105, @register.total_money
  end

  def test_change
    transaction = Transaction.new(20)
    transaction.amount_paid = 50
    assert_equal 30, @register.change(transaction)
  end

  def test_give_receipt
    transaction = Transaction.new(30)
    assert_output("You've paid $30.\n") { @register.give_receipt(transaction) }
  end

  def test_prompt
    transaction = Transaction.new(40)
    input = StringIO.new("40\n")
    output = StringIO.new
    transaction.prompt_for_payment(input: input, output: output)
    assert_equal 40, transaction.amount_paid
  end

  def test_alter_prompt
    transaction = Transaction.new(50)
    input = StringIO.new("50\n")
    output = StringIO.new
    transaction.prompt_for_payment(input: input, output: output)
    assert_equal 50, transaction.amount_paid
  end

end