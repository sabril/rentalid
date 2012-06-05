class Picture < ActiveRecord::Base
  attr_accessible :photo, :picturable
  
  mount_uploader :photo, PhotoUploader
end
