class Item < ApplicationRecord
  belongs_to :merchant
  has_many :invoice_items
  has_many :invoices, through: :invoice_items

  def as_json(option={})
    {:id => self.id.to_s, :type => self.class.name.downcase, :attributes => {:name => self.name, :description => self.description, :unit_price => self.unit_price, :merchant_id => self.merchant.id}}
  end


end
