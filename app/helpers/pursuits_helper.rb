module PursuitsHelper
  def purchase_link_or_retired_notice
    if current_user
      if current_user.admin?
        link_to "Edit Pursuit", edit_admin_pursuit_path(@pursuit.id)
      else
        purchase_link_or_retired_notice
      end
    else
      purchase_link_or_retired_notice
    end
  end

  def purchase_link_or_retired_notice
    if @pursuit.retired?
      content_tag :p, "This pursuit has been retired and may no longer be purchased."
    else
      link_to "Purchase Trip", new_cart_pursuit_path(id: @pursuit.id)
    end
  end
end
