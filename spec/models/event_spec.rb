require 'rails_helper'

RSpec.describe Event, type: :model do
  let(:category) { Category.new(name: "Entertainment") }

  let(:region) { Region.new(name: "Lamdong") }

  let(:venue) { Venue.new(
    name: 'Da Lat City',
    full_address: 'Ngoc Phat Hotel 10 Hồ Tùng Mậu Phường 3, Thành phố Đà Lạt, Lâm Đồng, Thành Phố Đà Lạt, Lâm Đồng',
    region: region
  )}

  subject { described_class.new(
    name: 'Việt Nam Thử Thách Chiến Thắng',
    starts_at: DateTime.parse('Fri, 11 Mar 2016 7:00 AM+0700'),
    ends_at: DateTime.parse('Sun, 13 Mar 2016 3:00 PM+0700'),
    venue: venue,
    category: category,
    hero_image_url: 'https://media.ticketbox.vn/eventcover/2015/10/25/C6A1A5.jpg?w=1040&maxheight=400&mode=crop&anchor=topcenter',
    extended_html_description: <<-DESC
      <p style="text-align:center"><span style="font-size:20px">VIỆT NAM THỬ THÁCH CHIẾN THẮNG 2016</span></p>
      <p style="text-align:center"><span style="font-size:20px">Giải đua xe đạp địa hình 11-13/03/2016</span></p>
      <p style="text-align:center"><span style="font-size:16px"><span style="font-family:arial,helvetica,sans-serif">Việt Nam Th</span>ử Thách Chiến Thắng là giải đua xe đạp địa hình được tổ chức như một sự tri ân, và cũng nhằm thỏa mãn lòng đam mẹ của những người yêu xe đạp địa hình nói chung, cũng như cho những ai đóng góp vào môn thể thao đua xe đạp tại thành phố Hồ Chí Minh. Cuộc đua diễn ra ở thành phố cao nguyên hùng vĩ Đà Lạt, với độ cao 1,500m (4,900ft) so với mặt nước biển. Đến với đường đua này ngoài việc tận hưởng cảnh quan nơi đây, bạn còn có cơ hội biết thêm về nền văn hóa của thành phố này. </span></p>
      <p style="text-align:center"><span style="font-size:16px">Hãy cùng với hơn 350 tay đua trải nghiệm 04 lộ trình đua tuyệt vời diễn ra trong 03 ngày tại Đà Lạt và bạn sẽ có những kỉ niệm không bao giờ quên!</span></p>
      <p style="text-align:center"><span style="font-size:16px">Để biết thêm thông tin chi tiết và tạo thêm hứng khởi cho cuộc đua 2016, vui lòng ghé thăm trang web</span></p>
      <p style="text-align:center"><span style="font-size:16px"><strong><span style="background-color:transparent; color:rgb(0, 0, 0)">www.vietnamvictorychallenge.com. </span></strong></span></p>
    DESC
  )}

  it "is valid with valid attributes" do
    expect(subject).to be_valid
  end

  it 'is not valid without name' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'is not valid without starts_at' do
    subject.starts_at = nil
    expect(subject).to_not be_valid
  end

  it 'is not valid without description' do
    subject.extended_html_description = nil
    expect(subject).to_not be_valid
  end
end
