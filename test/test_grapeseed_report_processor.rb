require 'minitest_helper'

class TestGrapeseedReportProcessor < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::GrapeseedReportProcessor::VERSION
  end

  def test_processes_a_valid_file_and_returns_a_hash
    filename = fixture('I&C_Creative_Type_by.csv')
    result = GrapeseedReportProcessor.process(filename)
    assert result.is_a? Hash
  end

  def test_raises_an_error_if_the_file_is_invalid
    assert_raises StandardError do
      GrapeseedReportProcessor.process('filename')
    end
  end
end
