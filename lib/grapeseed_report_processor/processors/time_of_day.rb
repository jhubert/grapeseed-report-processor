module GrapeseedReportProcessor::Processors
  class TimeOfDay < Base
    COUNT_COL = 5 # Impressions
    NAME_COL = 4 # TimeOfDay

    def process
      insertion_orders = {}

      CSV.foreach(@filename, headers: true) do |row|
        break if row[0].nil?

        insertion_orders[row[1]] ||= { first: nil, second: nil, first_count: 0, second_count: 0 }
        data = insertion_orders[row[1]]

        next if row[COUNT_COL].to_i <= data[:second_count]

        if row[COUNT_COL].to_i <= data[:first_count]
          data[:second] = row[NAME_COL].to_i
          data[:second_count] = row[COUNT_COL].to_i
        else
          data = { first: row[NAME_COL].to_i, second: data[:first], first_count: row[COUNT_COL].to_i, second_count: data[:first_count] }
        end

        insertion_orders[row[1]] = data
      end

      insertion_orders.each_with_object({}) { |(k, v), h| h[k] = [v[:first], v[:second]] }
    end
  end
end
