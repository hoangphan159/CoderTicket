require 'rails_helper'

RSpec.describe 'routing to upcoming events', :type => :routing do
  it 'routes /upcoming to events#index' do
    expect(:get => "/upcoming").to route_to(
      :controller => "events",
      :action => "index"
    )
  end

  it 'routes root_path to events#index' do
    expect(:get => "/").to route_to(
      :controller => "events",
      :action => "index"
    )
  end

end
