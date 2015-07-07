module GrapeseedReportProcessor::Processors
  class CreativeType < Base
    COUNT_COL = 7 # Impressions
    NAME_COL = 6 # Creative Type

    def process
      insertion_orders = {}

      CSV.foreach(@filename, headers: true) do |row|
        break if row[0].nil?

        insertion_orders[row[1]] ||= { first: nil, second: nil, first_count: 0, second_count: 0 }
        data = insertion_orders[row[1]]

        next if row[COUNT_COL].to_i <= data[:second_count]

        if row[COUNT_COL].to_i <= data[:first_count]
          data[:second] = creative_type(row)
          data[:second_count] = row[COUNT_COL].to_i
        else
          data = { first: creative_type(row), second: data[:first], first_count: row[COUNT_COL].to_i, second_count: data[:first_count] }
        end

        insertion_orders[row[1]] = data
      end

      insertion_orders.each_with_object({}) { |(k, v), h| h[k] = [v[:first], v[:second]] }
    end

    private

    # Replace 'Standard' with the creative dimensions
    def creative_type(row)
      return row[NAME_COL] unless row[NAME_COL] == 'Standard'
      [row[4],row[5]].join('X')
    end
  end
end
