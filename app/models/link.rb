require 'uri'

class Link < ActiveRecord::Base
  validates_format_of :url, :with => URI.regexp(['http', 'https'])
  acts_as_votable
  belongs_to :user
  has_many :comments
end

