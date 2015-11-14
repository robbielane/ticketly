require 'test_helper'

class AdminOrdersTest < ActionDispatch::IntegrationTest
  test "admin can see all orders on dasboard page and link to order show page" do
    create_and_login_user
    user = User.first

    order1 = user.orders.create(total: 1001,
                                created_at: Time.new(2011, 11, 10, 15, 25, 0),
                                status: "Completed")
    order2 = user.orders.create(total: 200,
                                created_at: Time.new(2012, 11, 12, 15, 25, 0),
                                status: "Paid")

    order1.pursuits.create(name: "Hiking",
                           description: "Hike the Alps",
                           price: 1001)

    order2.pursuits.create(name: "Jet Skiing",
                           description: "Jet Skiing in Jamaica",
                           price: 200)

    click_link "Logout"

    User.create(username: "acareaga", password: "pass", name: "Aaron", role: 1)

    visit root_path

    fill_in "Username", with: "acareaga"
    fill_in "Password", with: "pass"
    click_button "Login"

    assert admin_dashboard_path, current_path
    assert page.has_content?("Hiking")
    assert page.has_content?("Completed")
    assert page.has_content?("Paid")

    click_link("Completed")
  save_and_open_page
    assert page.has_content?("1001")
  end
end
