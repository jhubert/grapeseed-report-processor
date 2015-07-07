require_relative '../../minitest_helper'

class TestSites < Minitest::Test
  include GrapeseedReportProcessor::Processors

  def setup
    @filename = fixture('I&C_Sites_by.csv')
  end

  def test_accepts_a_filename
    Sites.new(@filename)
  end

  def test_returns_a_hash_if_the_file_is_valid
    assert Sites.new(@filename).result.is_a? Hash
  end

  def test_returns_the_top_4_sites_by_insertion_order
    result = Sites.new(@filename).result
    assert_equal %w(blogtalkradio.com comicbookresources.com uproxx.com ebay.com), result['1567563']
  end

  def test_sorts_by_the_impression_count
    result = Sites.new(@filename).result
    assert_equal %w(blogtalkradio.com comicbookresources.com uproxx.com ebay.com), result['1567563']
  end
end
