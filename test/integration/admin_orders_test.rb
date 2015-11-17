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

    assert_equal "/orders/#{Order.first.id}", current_path
    assert page.has_content?("Details")
  #   And I can filter orders to display by each status type  ("Ordered", "Paid", "Cancelled", "Completed")
  #   And I have links to transition the status
  # - I can click on "cancel" on individual orders which are "paid" or "ordered"
  # - I can click on "mark as paid" on orders that are "ordered"
  # - I can click on "mark as completed" on orders that are "paid"
  end

  test "admin can view an individual order" do
    checkout_user(2)

    click_link "Logout"

    User.create(username: "acareaga", password: "pass", name: "Aaron", role: 1)

    visit root_path

    fill_in "Username", with: "acareaga"
    fill_in "Password", with: "pass"
    click_button "Login"
    assert admin_dashboard_path, current_path

    assert page.has_link?("Pending")
    click_link("Pending")
    assert_equal admin_order_path(:id), current_path
    assert_equal "/orders/#{Order.first.id}", current_path
    assert page.has_content?("November 16, 2015")
    assert page.has_content?(#time the order was placed)
    assert page.has_link?("#{Activity.find_by_name("Hiking #{i}"}")#The item's name, which is linked to the item page.
    assert page.has_content?("Total Travellers")
    assert page.has_content?("Price")
    assert page.has_content("Line item subtotal")

# And I can see the total for the order.
# And I can see the status for the order.

  end
end
