class Merchant < ApplicationRecord
  has_many :items

  def as_json(option={})
    {:id => self.id.to_s, :type => self.class.name.downcase, :attributes => {:name => self.name}}
  end

  

end
