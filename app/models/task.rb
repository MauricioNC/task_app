class Task < ApplicationRecord
  belongs_to :entity, class_name: "entity", foreign_key: "entity_id"
end
