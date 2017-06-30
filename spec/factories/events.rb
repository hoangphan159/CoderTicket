FactoryGirl.define do
  factory :event do
    name 'aa'
    starts_at DateTime.parse('Fri, 11 Mar 2016 7:00 AM+0700')
    ends_at DateTime.parse('Sun, 13 Mar 2016 3:00 PM+0700')
    venue
    category
    hero_image_url 'https://media.ticketbox.vn/eventcover/2015/10/25/C6A1A5.jpg?w=1040&maxheight=400&mode=crop&anchor=topcenter'
    extended_html_description 'aaaa'
  end

end
