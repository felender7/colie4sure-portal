class LicenseRenewalController < ApplicationController
  before_action :randoms
  def index
    @license_renewals = Garage.all
  end

  def randoms
    @r_date = DateTime.now - (rand * 21)
    @amount = (rand(500..700)) + (rand(1..50))
  end
end
