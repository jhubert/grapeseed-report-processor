require_relative '../../minitest_helper'

class TestCreativeType < Minitest::Test
  include GrapeseedReportProcessor::Processors

  def setup
    @filename = fixture('I&C_Creative_Type_by.csv')
  end

  def test_accepts_a_filename
    CreativeType.new(@filename)
  end

  def test_returns_a_hash_if_the_file_is_valid
    assert CreativeType.new(@filename).result.is_a? Hash
  end

  def test_returns_the_top_two_creative_types_by_insertion_order
    result = CreativeType.new(@filename).result
    assert_equal ['300X250', 'Facebook'], result['1567563']
  end

  def test_replaces_standard_with_the_creative_dimensions
    result = CreativeType.new(@filename).result
    assert_equal '300X250', result['1567563'][0]
  end

  def test_sorts_by_the_impression_count
    result = CreativeType.new(@filename).result
    assert_equal ['300X250', 'Facebook'], result['1567563']
  end
end
