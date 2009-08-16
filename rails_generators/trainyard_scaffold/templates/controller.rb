class <%= plural_class_name %>Controller < ApplicationController
  make_resource_controller do
    <%- if options[:child] -%>
    # NOTE (RES) - uncomment RES lines if this record can belong to a parent resource
    belongs_to :resource
    <%- end -%>
   
    # NOTE - Use lines like these to register custom member or collection actions
    # member_actions :some_action
    # collection_actions :some_other_action
    
    # NOTE - Use a block like this to set a before callback for an action
    # before :show do
    #   add_breadcrumb h(@<%= singular_name %>.resource.name), @<%= singular_name %>.name
    # end
       
    # NOTE - Use a block like this to set a custom response for an action
    # response_for :create do |format|
    #   format.html { redirect_to some_path }
    # end
  end
  
  def resourceful_name
    t(:<%= singular_name %>)
  end

  <%- if options[:child] -%>
  # NOTE (RES)
  # before_filter :check_editor_of_resource, :only => [ :index, :new, :create ]
  <%- end -%>
  before_filter :check_editor_of_<%= singular_name %>, :only => [ :edit, :update, :destroy ]

  <%= controller_methods :actions %>


  private

  <%- if options[:child] -%>
  # NOTE (RES)
  def check_editor_of_resource
    check_editor_of(@resource, true)
  end
  <%- end -%>

  def check_editor_of_<%= singular_name %>
    check_editor_of(@<%= singular_name %>)
  end
end
