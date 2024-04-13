class FeatureSerializer < ActiveModel::Serializer


  attributes :id
  attribute :inherited_type, key: :type
  attribute :attr, key: :attributtes
  attribute :coordinates
  attribute :links




  def attr
    {
      external_id: object.external_id,
      magnitude: object.magnitude,
      place: object.place,
      time: object.time,
      tsunami: object.tsunami,
      mag_type: object.mag_type,
      title: object.title
    }
  end




  def coordinates
    {
      longitude: object.longitude,
      latitude: object.latitude
    }
  end

  def links
    {
      external_url: object.external_url
    }
  end









end
