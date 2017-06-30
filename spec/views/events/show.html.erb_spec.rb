require 'spec_helper'
require 'rails_helper'

describe 'events/index.html.erb' do
  before(:each) do
    assign(:events, [
        stub_model(Event, :name => "slicer",
          :starts_at => DateTime.parse('Fri, 11 Mar 2016 7:00 AM+0700'),
          :ends_at => DateTime.parse('Sun, 13 Mar 2016 3:00 PM+0700'),
          :venue => Venue.create(FactoryGirl.attributes_for(:venue)),
          :user => nil
          ),
        stub_model(Event, :name => "dicer",
          :starts_at => DateTime.parse('Fri, 11 Mar 2016 7:00 AM+0700'),
          :ends_at => DateTime.parse('Sun, 13 Mar 2016 3:00 PM+0700'),
          :venue => Venue.create(FactoryGirl.attributes_for(:venue)),
          :user => nil
          )
      ])

    assign(:current_user, FactoryGirl.create(:user))
  end

  it "displays both events" do
    render

    expect(rendered).to match /slicer/
    expect(rendered).to match /dicer/
  end

  it "don't display edit and publish action" do
    render

    expect(rendered).to_not match /Edit/
    expect(rendered).to_not match /Publish/
  end
end
