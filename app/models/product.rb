class Product < ActiveRecord::Base
  validates :title, :desciption, presence: true
  validate :title_is_shorter_than_description
  validates :price, numericality: { :greater_than 0 }, presence: true

  def title_is_shorter_than_description
    return if title.blank? or desciption.blank?
    if desciption.length < title.length
      errors.add(:description, 'cant be shorter than title')
    end
  end
end
