class Organisation < ApplicationRecord
  belongs_to :user

  extend FriendlyId
  friendly_id :slug_candidates, use: :slugged

  # in case of 2 same name, the module will genrate a slug with Organisation ID.
  def slug_candidates
    random_number1 = rand(10)
    random_number2 = rand(10)
    random_number3 = rand(10)
    [
      :name,
      [:name, random_number1],
      [:name, random_number1, random_number2],
      [:name, random_number1, random_number2, random_number3]
    ]
  end

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
