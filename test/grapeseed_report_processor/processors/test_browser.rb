require_relative '../../minitest_helper'

class TestBrowser < Minitest::Test
  include GrapeseedReportProcessor::Processors

  def setup
    @filename = fixture('I&C_Browser_by.csv')
  end

  def test_accepts_a_filename
    Browser.new(@filename)
  end

  def test_returns_a_hash_if_the_file_is_valid
    assert Browser.new(@filename).result.is_a? Hash
  end

  def test_returns_the_top_browser_by_insertion_order
    result = Browser.new(@filename).result
    assert_equal 'Safari', result['1567563']
  end

  def test_sorts_by_the_impression_count
    result = Browser.new(@filename).result
    assert_equal 'Safari', result['1567563']
  end
end
