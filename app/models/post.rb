class Post < ActiveRecord::Base
  has_many :images, class_name: 'PostImage'

  accepts_nested_attributes_for :images, reject_if: :all_blank
end
