class Shift < ActiveRecord::Base
  attr_accessible :start, :stop, :user_id, :store_id

  validates_presence_of :user_id
  validates_presence_of :start
  validates_presence_of :store_id

  belongs_to :user
  belongs_to :store

  def self.to_csv(options = {})
    CSV.generate(options) do |csv|
      csv << column_names
      all.each do |shift|
        csv << shift.attributes.values_at(*column_names)
      end
    end
  end

end
