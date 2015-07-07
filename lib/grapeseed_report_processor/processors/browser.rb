module GrapeseedReportProcessor::Processors
  class Browser < Base
    COUNT_COL = 5 # Impressions
    NAME_COL = 4 # Browser

    def process
      insertion_orders = {}

      CSV.foreach(@filename, headers: true) do |row|
        break if row[0].nil?

        insertion_orders[row[1]] ||= { browser: '', count: 0 }
        next if row[COUNT_COL].to_i <= insertion_orders[row[1]][:count]

        insertion_orders[row[1]] = { browser: row[NAME_COL], count: row[COUNT_COL].to_i }
      end

      insertion_orders.each_with_object({}) { |(k, v), h| h[k] = v[:browser] }
    end
  end
end
