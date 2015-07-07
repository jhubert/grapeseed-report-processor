require 'csv'

module GrapeseedReportProcessor::Processors
  class Base
    def initialize(filename)
      @filename = filename
    end

    def result
      @result ||= process
    end
  end
end

require 'grapeseed_report_processor/processors/creative_type'
require 'grapeseed_report_processor/processors/browser'
require 'grapeseed_report_processor/processors/device'
require 'grapeseed_report_processor/processors/day_of_week'
require 'grapeseed_report_processor/processors/time_of_day'
require 'grapeseed_report_processor/processors/sites'
