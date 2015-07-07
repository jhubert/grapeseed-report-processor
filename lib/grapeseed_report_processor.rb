require "grapeseed_report_processor/version"
require "grapeseed_report_processor/dispatcher"
require "grapeseed_report_processor/processors"

module GrapeseedReportProcessor
  def self.process(filename)
    Dispatcher.new(filename).result
  end
end
