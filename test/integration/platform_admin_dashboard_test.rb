require_relative '../test_helper'

class PlatformAdminDashboardTest < ActionDispatch::IntegrationTest

  test "Platform admin can access dashboard" do
    platform_admin_login

    assert_equal platform_admin_dashboard_path, current_path
  end

  test "Platform admin can edit their account" do
    platform_admin_login

    click_link "Edit Account"

    fill_in "Username", with: "jhun"
    fill_in "Name", with: "jhun"
    fill_in "Password", with: "pass"

    click_button "Update Account"

    assert_equal platform_admin_dashboard_path, current_path
  end

  test "Platform admin can take a vendor offline" do
    create_vendor_admin
    platform_admin_login

    assert platform_admin_dashboard_path, current_path

    within("#aaron-s-store") do
      click_link("active")
    end

    assert page.has_content?("Name")
    assert page.has_content?("Status")

    select "active", :from => "vendor[status]"
    fill_in "Name", with: "aaron-swag"

    click_button "Update Vendor"

    within("#aaron-swag") do
      assert page.has_content?("active")
    end

    assert_equal platform_admin_dashboard_path, current_path
  end
end
