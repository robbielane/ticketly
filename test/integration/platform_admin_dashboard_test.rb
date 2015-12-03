require_relative '../test_helper'

class PlatformAdminDashboardTest < ActionDispatch::IntegrationTest

  test "Platform admin can access dashboard" do

    platform_admin_login

     assert admin_dashboard_path, current_path
  end

  test "Platform admin can take a vendor offline" do

    user = User.create(name:"Aaron", username:"aaron", password:"aaron")
    user.roles << Role.create(name:"vendor_admin")



# I expect to see an index of existing businesses and their status,
# I expect to see a button to take the business offline or online,
# And when I click offline,
# I expect to see the business status updated,
# And when I visit that business url,
# I expect to be redirected to the index of online businesses
  end
end
