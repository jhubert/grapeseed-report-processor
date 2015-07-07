require_relative '../../minitest_helper'

class TestTimeOfDay < Minitest::Test
  include GrapeseedReportProcessor::Processors

  def setup
    @filename = fixture('I&C_Time_of_Day_by.csv')
  end

  def test_accepts_a_filename
    TimeOfDay.new(@filename)
  end

  def test_returns_a_hash_if_the_file_is_valid
    assert TimeOfDay.new(@filename).result.is_a? Hash
  end

  def test_returns_the_top_time_of_day_by_insertion_order
    result = TimeOfDay.new(@filename).result
    assert_equal [1, 0], result['1567563']
  end

  def test_sorts_by_the_impression_count
    result = TimeOfDay.new(@filename).result
    assert_equal [1, 0], result['1567563']
  end

  def test_if_two_are_equal_return_the_first_one_first
    result = TimeOfDay.new(@filename).result
    assert_equal [22, 23], result['1567564']
  end
end
