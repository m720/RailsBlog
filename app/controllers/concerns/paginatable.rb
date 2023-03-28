module Paginatable 
  extend ActiveSupport::Concern

    included do
      protected
        def paginate(collection:, options: {})
          per_page = limit_per_page(params[:per_page])
          collection = collection.page(params[:page]).per(per_page)
          render({
            json: collection, adapter: :json, meta: {
              total_entries: collection.total_count,
              total_pages: collection.total_pages,
              next_page: collection.next_page,
              previous_page: collection.prev_page,
              current_page: collection.current_page,
              per_page: per_page,
            }
          }.merge(options)
          )
        end
    end
  end