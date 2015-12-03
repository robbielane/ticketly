require_relative '../test_helper'

class PlatformAdminDashboardTest < ActionDispatch::IntegrationTest

  test "Platform admin can access dashboard" do
    platform_admin_login

    assert admin_dashboard_path, current_path
  end

  test "Platform admin can take a vendor offline" do
    skip
    create_vendor_admin

    platform_admin_login

    assert admin_dashboard_path, current_path

    within("#aaron-s-store") do
      assert page.has_content?("Vendors")
      assert page.has_content?("Status")
    end

    click_button("Offline")

    within("#aaron-s-store") do
      refute page.has_content?("Offline")
      assert page.has_content?("Online")
    end


# I expect to see an index of existing businesses and their status,
# I expect to see a button to take the business offline or online,
# And when I click offline,
# I expect to see the business status updated,
# And when I visit that business url,
# I expect to be redirected to the index of online businesses
  end
end
