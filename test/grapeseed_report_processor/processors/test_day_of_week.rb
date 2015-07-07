require_relative '../../minitest_helper'

class TestDayOfWeek < Minitest::Test
  include GrapeseedReportProcessor::Processors

  def setup
    @filename = fixture('I&C_Day_of_Week_by.csv')
  end

  def test_accepts_a_filename
    DayOfWeek.new(@filename)
  end

  def test_returns_a_hash_if_the_file_is_valid
    assert DayOfWeek.new(@filename).result.is_a? Hash
  end

  def test_returns_the_top_day_of_the_week_by_insertion_order
    result = DayOfWeek.new(@filename).result
    assert_equal 'Saturday', result['1567563']
  end

  def test_sorts_by_the_impression_count
    result = DayOfWeek.new(@filename).result
    assert_equal 'Saturday', result['1567563']
  end

  def test_if_two_are_equal_return_the_first
    result = DayOfWeek.new(@filename).result
    assert_equal 'Sunday', result['1567564']
  end
end
