module PursuitsHelper
  def purchase_link_or_retired_notice
    if current_user
      if current_user.admin?
        link_to "Edit Pursuit", edit_admin_pursuit_path(@pursuit.id)
      elsif !current_user.admin?
        if @pursuit.retired?
          content_tag :p, "This pursuit has been retired and may no longer be purchased."
        else
          link_to "Purchase Trip", new_cart_pursuit_path(id: @pursuit.id)
        end
      end
    end
  end
end
