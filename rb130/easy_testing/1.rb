require 'Minitest/autorun'
require 'Minitest/reporters'
Minitest::Reporters.use!

class ExampleTest < Minitest::Test

  def test_boolean
    value = 1
    assert(value.odd?, 'value is not odd')
  end

  def test_equality
    value = 'xyz'
    assert_equal('xyz', value.downcase)
  end

  def test_nil
    value = nil
    assert_nil(value)
  end

  def test_empty
    list = []
    assert_empty(list)
  end

  def test_included
    list = ['abc', 'xyz']
    assert_includes(list, 'xyz')
  end

  def test_exception
    skip
    assert_raises(NoExperienceError) { employee.hire }
  end

  def test_type
    value = Numeric.new
    assert_instance_of(Numeric, value)
  end
  
  def test_kind
    value = 1.1
    assert_includes(value.class.ancestors, Numeric)
    value = 1
    assert_includes(value.class.ancestors, Numeric)
  end

  def test_same
    skip
    assert_same(list, list.process)
  end

  def test_refutations
    list = ['abc', 'not xyz']
    refute_includes(list, 'xyz')
  end
    
end