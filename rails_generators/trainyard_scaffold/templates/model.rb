class <%= class_name %> < ActiveRecord::Base
  <%- if options[:image] -%>
  # NOTE - uncomment this line to add an image to the record
  has_attached_file :image, Configuration.default_image_options
  <%- end -%>

  <%- if options[:child] -%>
  # NOTE - uncomment these lines if this record can belong to a parent resource
  belongs_to :resource, :polymorphic => true
  validates_presence_of :name, :resource

  def group
    self.resource.group
  end
  <%- else -%>
  validates_presence_of :name
  <%- end -%>
end