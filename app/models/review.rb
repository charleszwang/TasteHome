class Review < ActiveRecord::Base
  belongs_to :cook, :class_name => 'User', :foreign_key => 'cook_id'
  belongs_to :member, :class_name => 'User', :foreign_key => 'member_id'
  validates :user_id, presence: true
  validates :content, presence: true, length: { maximum: 140 }
end
