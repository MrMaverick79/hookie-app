class Hook < ApplicationRecord
    belongs_to :user, optional: true
    has_and_belongs_to_many :links
    has_many :tags, through: 'links'

    validates :title, length: {maximum: 40} 
    validates :note, length: {maximum: 150} 
   

end
