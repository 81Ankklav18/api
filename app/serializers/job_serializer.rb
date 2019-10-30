include ActionController::Serialization

class JobSerializer < ActiveModel::Serializer
  attributes :name, :place, :company_id
end
