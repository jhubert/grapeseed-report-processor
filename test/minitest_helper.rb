$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)

FIXTURE_PATH = File.expand_path('../fixtures', __FILE__)

require 'grapeseed_report_processor'

require 'minitest/autorun'

class Minitest::Test
  include GrapeseedReportProcessor

  def fixture(path)
    File.join(FIXTURE_PATH, path)
  end
end
