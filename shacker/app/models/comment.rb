class Comment < ActiveRecord::Base

  #associations
  belongs_to :post
  belongs_to :author, class_name: 'User'

  #validations

end
