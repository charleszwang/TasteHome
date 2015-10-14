class Member < User
  has_many :reviews
  has_many :orders
  
  def member?
    true
  end
  
end
