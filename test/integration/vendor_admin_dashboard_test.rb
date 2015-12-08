require 'test_helper'

class VendorAdminDashboardTest < ActionDispatch::IntegrationTest

  test "vendor admin can access dashboard and edit their account" do
    user = User.create(name: "Aaron", username: "aaron", password: "password")
    user.roles << Role.create(name: "vendor_admin")
    vendor = Vendor.create(name:"Aaron's store", user_id: user.id)
    vendor.tickets.create(name: "Frozen on Ice", price: 100, section: "A", row: "B", seat: "1")

    visit root_path

    click_link "Login"

    fill_in "Username", with: "aaron"
    fill_in "Password", with: "password"

    click_button "Login"

    assert "/aaron-s-store/dashboard", current_path

    click_link("Edit Account")
    fill_in ("Username"), with: "acareaga"
    check "Vendor"
    click_button "Update Account"

    assert "/aaron-s-store/dashboard", current_path
  end

  test "vendor admin can revert back to registered user" do
    user = User.create(name: "Aaron", username: "aaron", password: "password")
    user.roles << Role.create(name: "vendor_admin")
    vendor = Vendor.create(name:"Aaron's store", user_id: user.id)

    visit root_path
    click_link "Login"
    fill_in "Username", with: "aaron"
    fill_in "Password", with: "password"
    click_button "Login"

    assert "/aaron-s-store/dashboard", current_path
    click_link("Edit Account")

    fill_in "Password", with: "password"
    check "Vendor"
    click_button "Update Account"

    assert "/dashboard", current_path
  end

  test "vendor can create a ticket" do
    skip
    user = User.create(name: "Aaron", username: "aaron", password: "password")
    user.roles << Role.create(name: "vendor_admin")
    vendor = Vendor.create(name:"Aaron's store", user_id: user.id)
    user.update!(vendor_id: vendor.id, password:"pass")
    vendor.tickets.create(name: "Frozen on Ice", price: 100, section: "A", row: "B", seat: "1")

    visit login_path

    fill_in "Username", with: "aaron"
    fill_in "Password", with: "pass"

    click_button "Login"

    assert_equal vendor_dashboard_path(user), current_path

    click_link "Add Ticket"

    fill_in "Name", with: "Dix Tix"
    fill_in "Section", with: "A"
    fill_in "Row", with: "B"
    fill_in "Seat", with: "A"
    fill_in "Price", with: 100
    fill_in "Status", with: 1

    click_button "Create Ticket"

    assert page.has_content?("Dix Tix")
  end

  test "vendor can edit their tickets" do
    skip
    create_vendor_admin

    assert vendor_admin_dashboard_path, current_path

    within("#frozen-on-ice") do
      click_link "Edit"
    end

    assert edit_vendor_admin_ticket_path, current_path

    fill_in "Name", with: "Lola"
    fill_in "Section", with: 100
    fill_in "Row", with: 12
    fill_in "Seat", with: 1

    click_link "Update Ticket"

    assert vendor_admin_ticket_path, current_path
    assert page.has_content?("Lola")
    assert page.has_content?("100")
    assert page.has_content?("12")
    assert page.has_content?("1")
  end

  test "vendor can delete their ticket" do
    skip
    create_vendor_admin

    assert vendor_admin_dashboard_path, current_path

    within("#frozen-on-ice") do
      click_link "Delete"
    end

    refute page.has_content?("Frozen on Ice")
  end
end
