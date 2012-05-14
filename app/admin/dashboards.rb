ActiveAdmin::Dashboards.build do

  # Define your dashboard sections here. Each block will be
  # rendered on the dashboard in the context of the view. So just
  # return the content which you would like to display.
  
  # == Simple Dashboard Section
  # Here is an example of a simple dashboard section
  #
  #   section "Recent Posts" do
  #     ul do
  #       Post.recent(5).collect do |post|
  #         li link_to(post.title, admin_post_path(post))
  #       end
  #     end
  #   end
  
  # == Render Partial Section
  # The block is rendered within the context of the view, so you can
  # easily render a partial rather than build content in ruby.
  #
  #   section "Recent Posts" do
  #     div do
  #       render 'recent_posts' # => this will render /app/views/admin/dashboard/_recent_posts.html.erb
  #     end
  #   end
  
  # == Section Ordering
  # The dashboard sections are ordered by a given priority from top left to
  # bottom right. The default priority is 10. By giving a section numerically lower
  # priority it will be sorted higher. For example:
  #
  #   section "Recent Posts", :priority => 10
  #   section "Recent User", :priority => 1
  #
  # Will render the "Recent Users" then the "Recent Posts" sections on the dashboard.
  
  # == Conditionally Display
  # Provide a method name or Proc object to conditionally render a section at run time.
  #
  # section "Membership Summary", :if => :memberships_enabled?
  # section "Membership Summary", :if => Proc.new { current_admin_user.account.memberships.any? }
  
  section "Recent orders" do
    
  end
  
  section "Recent product updates" do
    table_for Product.order('updated_at desc').limit(20) do
      column :name
      column :status do |product|
        status_tag product.status, product.status_tag
      end
    end
  end
  
  # section "Recent updates" do
  #   table_for Version.order('id desc').limit(20) do
  #     column "Item" do |v| v.item.class end
  #     column "Type" do |v| v.item_type.underscore.humanize end
  #     column "Modified at" do |v| past_time(v.created_at) end
  #    # column "Admin" do |v| link_to User.find(v.whodunnit).email, administration_user_path(User.find(v.whodunnit)) end
  #   end
  # end
end
