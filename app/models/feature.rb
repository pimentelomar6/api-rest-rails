class Feature < ApplicationRecord
has_many :comments, dependent: :destroy

def external_id
  self[:external_id]
end

def magnitude
  self[:magnitude]
end

def place
  self[:place]
end

def time
  self[:time]
end
def tsunami
  self[:tsunami]
end
def mag_type
  self[:mag_type]
end
def title
  self[:title]
end




  def longitude
    self[:longitude]
  end

  def latitude
    self[:latitude]
  end

  def external_url
    self[:external_url]
  end

end
