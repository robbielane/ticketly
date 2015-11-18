require "test_helper"

class AdminOrdersTest < ActionDispatch::IntegrationTest
  test "admin can see all orders on dasboard page and link to order show page" do
    checkout_user(2)

    click_link "Logout"

    login_admin

    assert admin_dashboard_path, current_path
    assert page.has_content?("Hiking")
    assert page.has_content?("Pending")

    click_link("Pending")

    assert_equal "/admin/orders/#{Order.first.id}", current_path
    assert page.has_content?("Details")

  #   And I can filter orders to display by each status type  ("Ordered", "Paid", "Cancelled", "Completed")
  #   And I can see the total number of orders for each status ("Ordered", "Paid", "Cancelled", "Completed")

  # - I can click on "cancel" on individual orders which are "paid" or "ordered"
  # - I can click on "mark as paid" on orders that are "ordered"
  # - I can click on "mark as completed" on orders that are "paid"
  end

  test "admin can view an individual order" do
    checkout_user(2)

    click_link "Logout"

    login_admin

    assert admin_dashboard_path, current_path
    assert page.has_link?("Pending")

    click_link("Pending")

    assert_equal "/admin/orders/#{Order.first.id}", current_path
    assert page.has_content?("November 18, 2015")
    assert page.has_content?("Travellers")
    assert page.has_content?("Total")
    assert page.has_content?("1001")
  end
end
