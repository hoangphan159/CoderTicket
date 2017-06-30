require 'rails_helper'
require 'spec_helper'

RSpec.describe VenuesController, type: :controller do

  describe "access to venues need to be loged in" do

    it 'denied access to venues#new' do
      sign_in nil

      get :new
      expect(response).to redirect_to new_user_session_path
    end

    it 'denied access to venues#create' do
      sign_in nil

      expect{
        post :create, { :venue => { :name => "Any Name" } }
      }.to_not change(Venue, :count)
      
      expect(response).to redirect_to new_user_session_path
    end
  end

  describe 'loged in user can create venue' do

    it 'successfull create venue with name' do
      sign_in

      expect {
        post :create, { :venue => { :name => "Any Name" } }
      }.to change(Venue, :count)

      expect(response).to redirect_to events_path
    end
  end
end
