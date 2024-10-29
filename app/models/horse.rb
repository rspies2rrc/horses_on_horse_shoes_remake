class Horse < ApplicationRecord
  belongs_to :breed

  has_one_attached :image

  def self.ransackable_attributes(auth_object = nil)
    [ "age", "breed_id", "created_at", "id", "id_value", "name", "number_of_legs", "top_speed", "updated_at" ]
  end

  def self.ransackable_associations(auth_object = nil)
    [ "breed" ]
  end
end
