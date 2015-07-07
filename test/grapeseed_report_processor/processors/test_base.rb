require_relative '../../minitest_helper'

class TestBase < Minitest::Test
  include GrapeseedReportProcessor::Processors

  def setup
    @filename = fixture('I&C_Base_by.csv')
  end

  def test_accepts_a_filename
    Base.new(@filename)
  end

  def test_raises_an_error_if_called_directly
    assert_raises NoMethodError do
      Base.new(@filename).process
    end
  end
end
