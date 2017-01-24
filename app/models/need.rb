class Need < ActiveRecord::Base
  belongs_to :client
  belongs_to :city
  belongs_to :item

  attr_accessor :name

  after_create :register_item

  protected
  def register_item
    item = Item.where(name: self.name)

    if item.exists?
      self.item_id = item.first.id
      self.save
    else
      new_item = Item.create(name: self.name)
      new_item.save

      self.item_id = new_item.id
      self.save
    end
  end
end