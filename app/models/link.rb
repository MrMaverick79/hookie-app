class Link < ApplicationRecord
    has_and_belongs_to_many :hooks
    has_and_belongs_to_many :tags

    validates :url, length: {minimum: 4}

   


end
