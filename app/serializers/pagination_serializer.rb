class PaginationSerializer < ActiveModel::Serializer
  attributes :total_items, :total_pages, :current_page

  def total_items
    object.total_count
  end

  def total_pages
    object.total_pages
  end

  def current_page
    object.current_page
  end
end
