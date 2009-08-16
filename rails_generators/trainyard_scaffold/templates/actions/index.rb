def index
  respond_with_indexer do |options|
    # NOTE - examples of setting various options
    # options[:conditions] = { :resource_id => @resource, :resource_type => @resource.class.to_s }
    # options[:default_sort] = :created_at
    # options[:headers] = [
    #   { :name => t(:title, :scope => [ :content ]), :sort => :name },
    #   t(:group),
    # ]
  end
end