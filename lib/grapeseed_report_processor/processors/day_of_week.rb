module GrapeseedReportProcessor::Processors
  class DayOfWeek < Base
    COUNT_COL = 5 # Impressions
    NAME_COL = 4 # DayOfWeek

    def process
      insertion_orders = {}

      CSV.foreach(@filename, headers: true) do |row|
        break if row[0].nil?

        insertion_orders[row[1]] ||= { day_of_week: '', count: 0 }
        next if row[COUNT_COL].to_i <= insertion_orders[row[1]][:count]

        insertion_orders[row[1]] = { day_of_week: row[NAME_COL], count: row[COUNT_COL].to_i }
      end

      insertion_orders.each_with_object({}) { |(k, v), h| h[k] = v[:day_of_week] }
    end
  end
end
