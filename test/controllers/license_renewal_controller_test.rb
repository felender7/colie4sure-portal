require "test_helper"

class LicenseRenewalControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get license_renewal_index_url
    assert_response :success
  end
end
