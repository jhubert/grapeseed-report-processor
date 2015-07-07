module GrapeseedReportProcessor::Processors
  class Sites < Base
    COUNT_COL = 6 # Impressions
    NAME_COL = 4 # Site
    SITE_LIMIT = 4

    def process
      insertion_orders = {}

      CSV.foreach(@filename, headers: true) do |row|
        break if row[0].nil?

        insertion_orders[row[1]] ||= { sites: [] }

        next if row[COUNT_COL].to_i == 0

        insertion_orders[row[1]][:sites] << composite(row)
      end

      insertion_orders.each_with_object({}) { |(k, v), h| h[k] = clean_sites(v[:sites]) }
    end

    private

    def composite(row)
      [row[COUNT_COL], row[NAME_COL]].join(':')
    end

    def clean_sites(sites)
      sites.sort.reverse[0...SITE_LIMIT].collect { |v| v.split(':').last }
    end
  end
end
