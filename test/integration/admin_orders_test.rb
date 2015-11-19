require "test_helper"

class AdminOrdersTest < ActionDispatch::IntegrationTest
  test "admin can see all orders on dasboard and filter by status" do
    checkout_user(2)

    click_link "Logout"

    login_admin

    assert admin_dashboard_path, current_path

    assert page.has_content?("Order ID")
    assert page.has_content?("Pending")
    assert page.has_content?("Completed")
    assert page.has_content?("Paid")
    assert page.has_content?("Cancelled")
  end

  test "admin can view an individual order" do
    checkout_user(2)

    click_link "Logout"

    login_admin

    assert admin_dashboard_path, current_path
    assert page.has_link?("Pending")

    click_link("Pending")

    assert_equal "/admin/orders/#{Order.first.id}", current_path
    assert page.has_content?("#{Time.now.strftime("%B %d, %Y")}")

    assert page.has_content?("Travellers")
    assert page.has_content?("Total")
    assert page.has_content?("1001")
  end
end
