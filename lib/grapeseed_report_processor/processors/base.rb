module GrapeseedReportProcessor::Processors
  class Base
    def initialize(filename)
      @filename = filename
    end

    def process
      fail NoMethodError, "Base cannot be used directly. Please use a subclass of base."
    end

    def result
      @result ||= process
    end
  end
end
