class GrapeseedReportProcessor::Dispatcher
  attr_reader :filename, :processor

  class NoProcessorError < StandardError; end

  class Inflector
    def self.class_name_from(filename)
      m = /I&C_([\w]+)_by/.match(filename)

      fail NoProcessorError, "Unable to determine processor from filename" unless m

      m[1].split('_').collect { |w| w.capitalize }.join('')
    end
  end

  def initialize(filename)
    @filename = filename
    @processor = processor_from_filename(filename)
  end

  def result
    processor.new(filename).result
  end

  private

  def processor_from_filename(filename)
    class_name = Inflector.class_name_from(filename)
    GrapeseedReportProcessor::Processors.const_get class_name
  rescue NameError
    raise NoProcessorError, "#{class_name} is not a valid processor"
  end
end
