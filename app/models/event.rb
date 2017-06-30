class Event < ActiveRecord::Base
  belongs_to :user
  belongs_to :venue
  belongs_to :category
  has_many :tickets, foreign_key: "event_id", class_name: "TicketType", :dependent => :destroy

  validates_presence_of :name, :extended_html_description, :venue, :category, :starts_at
  validates_uniqueness_of :name, uniqueness: {scope: [:venue, :starts_at]}

  def self.upcoming
    Event.where('starts_at > ? and published_at is not null', Time.now)
  end

  def self.search(term)
    where('name ILIKE ? and published_at is not null', "%#{term}%")
    where('extended_html_description ILIKE ? and published_at is not null', "%#{term}%")
  end

end
