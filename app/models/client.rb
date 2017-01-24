class Client < ActiveRecord::Base
  has_many :needs

  def attach_to_need(need_id)
    need = Need.find(need_id)

    if need
      need.client_id = self.id
      need.save
    end
  end
end
