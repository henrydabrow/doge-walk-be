# frozen_string_literal: true

module API
  module V1
    module Helpers
      module Pagination
        ::DEFAULT_PAGE_SIZE = 9

        def render_paginated(records, options = {})
          paginated_records = paginate(records)

          render paginated_records, pagination_metadata(paginated_records).merge(extra: options)
        end

        def paginate(records)
          records.page([params[:page].to_i, 1].max).per(params[:per_page] || DEFAULT_PAGE_SIZE)
        end

        private

        def pagination_metadata(records)
          {
            meta: {
              count: records.unscope(:group, :select, :joins, :order).count(:all),
              page: records.current_page,
              per_page: records.limit_value,
              page_count: records.total_pages,
              total_count: records.total_count,
            },
          }
        end
      end
    end
  end
end
