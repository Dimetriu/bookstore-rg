require 'rails_helper'

RSpec.describe HomeController, type: :controller do

  describe "GET #index" do
    it "returns http success" do
      expect(get: root_url(subdomain: nil)).to route_to(controller: "home", action: "index", locale: "en")
    end
  end

end