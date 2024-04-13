require 'custom_validators'

class PerPageValidator < ActiveModel::Validator
  def validate(record, attributes)
    per_page = record.send(attributes.first)

    if per_page.present? && per_page.to_i > 1000
      errors.add(attributes.first, "debe ser menor o igual a 1000")
    end
  end
end
