class Link < ApplicationRecord
    has_and_belongs_to_many :hooks
    has_and_belongs_to_many :tags

    validates :url, presence: true

   


end
