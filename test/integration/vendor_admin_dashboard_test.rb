require 'test_helper'

class VendorAdminDashboardTest < ActionDispatch::IntegrationTest

  test "vendor admin can access dashboard and edit their account" do
    user = User.create(name: "Aaron", username: "aaron", password: "password")
    user.roles << Role.create(name: "vendor_admin")
    vendor = Vendor.create(name:"Aaron's store", user_id: user.id, slug:self.name.parameterize)

    user.update!(vendor_id: vendor.id, password:"password")

    visit login_path

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
    user.update!(vendor_id: vendor.id, password: "password")

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

    user = User.create(name: "Aaron", username: "aaron", password: "password")
    user.roles << Role.create(name: "vendor_admin")
    vendor = Vendor.create(name:"Aaron's store", user_id: user.id)
    user.update!(vendor_id: vendor.id, password:"pass")

    visit login_path

    fill_in "Username", with: "aaron"
    fill_in "Password", with: "pass"

    click_button "Login"

    assert_equal vendor_dashboard_path(user.vendor.slug), current_path

    click_link "Add Ticket"

    assert_equal vendor_event_select_path(vendor.slug), current_path

    click_link "Disney Frozen On Ice"

    assert_equal new_vendor_ticket_path(vendor: vendor.slug), current_path

    fill_in "Section", with: "A"
    fill_in "Row", with: "B"
    fill_in "Seat", with: "A"
    fill_in "Price", with: 100

    click_button "Create Ticket"

    assert page.has_content?("Disney Frozen On Ice")
    assert page.has_content?(100)

  end

  test "vendor can create a new event and ticket" do
    user = User.create(name: "Aaron", username: "aaron", password: "password")
    user.roles << Role.create(name: "vendor_admin")
    vendor = Vendor.create(name:"Aaron's store", user_id: user.id)
    user.update!(vendor_id: vendor.id, password:"pass")

    visit login_path

    fill_in "Username", with: "aaron"
    fill_in "Password", with: "pass"

    click_button "Login"

    assert_equal vendor_dashboard_path(user.vendor.slug), current_path

    click_link "Add Ticket"


    assert_equal vendor_event_select_path(vendor.slug), current_path

    click_link "Create New Event"

    fill_in "Venue", with: "Chin's"
    fill_in "Name", with: "Jackie Chan's Dojo"
    fill_in "Description", with: "Get your ass kicked and eat chinese food"
    fill_in "City", with: "Hong Kong"
    fill_in "State", with: "All the states"
    fill_in "Date", with: "12/25/2015"

    click_button "Create Event"

    assert_equal new_vendor_ticket_path(vendor: vendor.slug), current_path

    fill_in "Section", with: "A"
    fill_in "Row", with: "B"
    fill_in "Seat", with: "A"
    fill_in "Price", with: 100

    click_button "Create Ticket"

    assert page.has_content?("Jackie Chan's Dojo")
    assert page.has_content?(100)

  end


  test "vendor can edit their tickets" do
    event = events(:one)
    user = User.create(name: "Aaron", username: "aaron", password: "password")
    user.roles << Role.create(name: "vendor_admin")
    vendor = Vendor.create(name:"Aaron's store", user_id: user.id)
    user.update!(vendor_id: vendor.id, password:"pass")
    Ticket.create(section: "a", row: "b", seat: "d", price: 10, vendor_id: vendor.id, status: 0, event_id: event.id)

    visit login_path

    fill_in "Username", with: "aaron"
    fill_in "Password", with: "pass"

    click_button "Login"

    click_link "View All Tickets"

    within("#disney-frozen-on-ice") do
      click_link "Edit"
    end

    fill_in "Section", with: 100
    fill_in "Row", with: 12
    fill_in "Seat", with: 1
    fill_in "Price", with: 100
    fill_in "Status", with: "Active"
    click_button "Update Ticket"

    assert page.has_content?(100)
    assert page.has_content?("1")
    assert page.has_content?('ACTIVE')
  end

  test "vendor can delete their ticket" do
    event = events(:one)
    user = User.create(name: "Aaron", username: "aaron", password: "password")
    user.roles << Role.create(name: "vendor_admin")
    vendor = Vendor.create(name:"Aaron's store", user_id: user.id)
    user.update!(vendor_id: vendor.id, password:"pass")
    Ticket.create(section: "a", row: "b", seat: "d", price: 10, vendor_id: vendor.id, status: 0, event_id: event.id)


    visit login_path

    fill_in "Username", with: "aaron"
    fill_in "Password", with: "pass"

    click_button "Login"

    click_link "View All Tickets"


    within("#disney-frozen-on-ice") do
      click_link "Delete"
    end

    refute page.has_content?("Frozen on Ice")
  end
end
