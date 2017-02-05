class ApplicationController < ActionController::API
  def meta_data(collection)
    {
      current_page: collection.current_page,
      next_page: collection.next_page,
      prev_page: collection.prev_page,
      total_pages: collection.total_pages,
      total_count: collection.total_count
    }
  end

  def default_error(errors, status = :internal_server_error)
    {
      json: { errors: errors },
      status: status
    }
  end
end
