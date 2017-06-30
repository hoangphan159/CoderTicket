require 'rails_helper'

RSpec.describe EventsController, type: :controller do
  describe 'require loged in to create, update, publish new event' do
    before(:each) do
      sign_in nil
    end

    it 'denied access to events#new' do
      get :new
      expect(response).to redirect_to new_user_session_path
    end

    it 'denied access to events#create' do
      expect{
        post :create, { :event => { :name => "Any Name" } }
      }.to_not change(Event, :count)

      expect(response).to redirect_to new_user_session_path
    end

    it 'denied access to events#edit' do
      get :edit, { :id => 1 }

      expect(response).to redirect_to new_user_session_path
    end

    it 'denied access to events#update' do
      expect{
        put :update, { :id => 1, :name => "Any Name" }
      }.to_not change(Event, :count)

      expect(response).to redirect_to new_user_session_path
    end

    it 'denied access to events#publish' do
      expect{
        get :publish, { :id => 1 }
      }.to_not change(Event, :count)

      expect(response).to redirect_to new_user_session_path
    end

    it 'denied access to events#mine' do
      get :mine

      expect(response).to redirect_to new_user_session_path
    end
  end

  describe 'no login require for index, show, upcoming action' do
    before(:each) do
      sign_in nil
    end

    it 'should return 200 when access events#index' do
      get :index

      expect(response.status).to eq 200
    end

    it 'should return 200 when access events#index with search term' do
      get :index, { :search => 'live' }

      expect(response.status).to eq 200
    end

    it 'should return 200 when access events#show' do
      event = FactoryGirl.create(:event)
      get :show, { :id => event.id }

      expect(response.status).to eq 200
    end
  end

  describe 'logined can do new, create, edit, update, publish' do
    before(:each) do
      user = FactoryGirl.create(:user)
      sign_in(user)
    end

    it 'should render new template when access new' do
      get :new

      expect(response.status).to eq 200
    end

    # it 'should create event success' do
    #   expect {
    #     event = FactoryGirl.attributes_for(:event)
    #
    #     post :create, {:event => event}
    #   }.to change(Event, :count)
    #
    #   expect(response.status).to eq 200
    # end
  end
end
