require_relative '../../minitest_helper'

class TestDevice < Minitest::Test
  include GrapeseedReportProcessor::Processors

  def setup
    @filename = fixture('I&C_Device_by.csv')
  end

  def test_accepts_a_filename
    Device.new(@filename)
  end

  def test_returns_a_hash_if_the_file_is_valid
    assert Device.new(@filename).result.is_a? Hash
  end

  def test_returns_the_top_device_by_insertion_order
    result = Device.new(@filename).result
    assert_equal 'Desktop', result['1567563']
  end

  def test_sorts_by_the_impression_count
    result = Device.new(@filename).result
    assert_equal 'Desktop', result['1567563']
  end
end
