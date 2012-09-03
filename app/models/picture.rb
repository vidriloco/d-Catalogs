class Picture < ActiveRecord::Base
  attr_accessible :caption, :image
  
  belongs_to :imageable, :polymorphic => true
end
