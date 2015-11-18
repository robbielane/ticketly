require "test_helper"

class AdminOrdersTest < ActionDispatch::IntegrationTest
  test "admin can see all orders on dasboard page and link to order show page" do
    checkout_user(2)

    click_link "Logout"

    login_admin

    assert admin_dashboard_path, current_path

    assert page.has_content?("Order ID")
    assert page.has_content?("Pending")

    click_link("Ordered")
save_and_open_page
    # I can click on "cancel" on individual orders which are "paid" or "ordered"
    assert page.has_content?("Ordered")

    within("#update_status") do
      click_button "cancel"
    end

    # I can click on "mark as paid" on orders that are "ordered"
    assert page.has_content?("Ordered")

    within("#update_status") do
      click_button "mark as paid"
    end

    # I can click on "mark as completed" on orders that are "paid"
    assert page.has_content?("Paid")

    within("#update_status") do
      click_button "mark as completed"
    end
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
