class TicketType < ActiveRecord::Base
  belongs_to :event

  validates_presence_of :name, :price, :max_quantity
end
