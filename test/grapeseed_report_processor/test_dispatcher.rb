require_relative '../minitest_helper'

class TestDispatcher < Minitest::Test
  def setup
    @filename = 'I&C_Creative_Type_by.csv'
  end

  def test_accepts_and_stores_a_filename
    dispatcher = Dispatcher.new(@filename)
    assert_equal @filename, dispatcher.filename
  end

  def test_determines_the_processor_based_on_the_filename
    dispatcher = Dispatcher.new(@filename)
    assert_equal Processors::CreativeType, dispatcher.processor
  end

  def test_raises_an_error_if_the_filename_is_blank
    assert_raises Dispatcher::NoProcessorError do
      Dispatcher.new('')
    end
  end

  def test_raises_an_error_if_the_filename_does_not_map_to_an_available_class
    assert_raises GrapeseedReportProcessor::Dispatcher::NoProcessorError do
      GrapeseedReportProcessor::Dispatcher.new('I&C_Missing_Class_by')
    end
  end
end

class TestDispatcherInflector < Minitest::Test
  def test_generates_a_class_name_from_a_filename
    class_name = Dispatcher::Inflector.class_name_from('I&C_Creative_Type_by.csv')
    assert_equal 'CreativeType', class_name
  end

  def test_normalizes_matching_words_to_class_names
    class_name = Dispatcher::Inflector.class_name_from('I&C_Creative_type_by.csv')
    assert_equal 'CreativeType', class_name

    class_name = Dispatcher::Inflector.class_name_from('I&C_CREATIVE_TYPE_by.csv')
    assert_equal 'CreativeType', class_name
  end
end
