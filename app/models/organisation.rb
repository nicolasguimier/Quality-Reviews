class Organisation < ApplicationRecord
  belongs_to :user
  validates_uniqueness_of :name

  # this will generate friendly urls
  # def to_param
  #   name.parameterize
  # end

  # to allow using "Organisation.find(params[:id])" in the contrleur,
  # even with friendy urls
  # def self.find(input)
  #   find_by_name(input)
  # end

  # better use a gem : https://github.com/norman/friendly_id
end
