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
    fill_in "Password", with: "pass"

    click_button "Update Account"

    assert_equal platform_admin_dashboard_path, current_path
  end

  test "Platform admin can take a vendor offline" do
    create_vendor_admin
    platform_admin_login

    assert platform_admin_dashboard_path, current_path

    within("#aaron-s-store") do
      assert page.has_content?("Active")
    end

    click_button("Active")

    assert_equal vendor_path, current_path

    within("#aaron-s-store") do
      refute page.has_content?("Offline")
      assert page.has_content?("Online")
    end
  end
end
