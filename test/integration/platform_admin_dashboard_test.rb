require_relative '../test_helper'

class PlatformAdminDashboardTest < ActionDispatch::IntegrationTest

  test "Platform admin can access dashboard" do

    user = User.create(name:"jhun", username:"jhun", password:"jhun")
    user.roles << Role.create(name:"platform_admin")
     visit root_path
     click_link "Login"

     fill_in "Username", with: "jhun"
     fill_in "Password", with: "jhun"

     assert admin_dashboard_path, current_path
   end
end
