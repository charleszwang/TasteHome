class Cook < User
  has_many :reviews
  
  def cook?
    true
  end
  
end
