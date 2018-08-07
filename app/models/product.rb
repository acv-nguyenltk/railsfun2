class Product < ActiveRecord::Base
  extend Enumerize
  belongs_to :category, optional: true
  validates :title, :desciption, presence: true
  validate :title_is_shorter_than_description
  validates :price, numericality: { greater_than: 0 }, presence: true

  before_save :strip_html_from_description, :set_title_lowercase

  scope :published, -> { where(published: true)}
  scope :priced_more_than, ->(price){ where('price > ?', price)}

  enumerize :level, in: {easy: 1, medium: 2, hard: 3}
  enumerize :country, in: ISO3166::Country.translations.invert


  def set_title_lowercase
    self.title = title.downcase
  end

  def title_is_shorter_than_description
    return if title.blank? or desciption.blank?
    if desciption.length < title.length
      errors.add(:description, 'cant be shorter than title')
    end
  end


  def strip_html_from_description
    self.desciption = ActionView::Base.full_sanitizer.sanitize(self.desciption)
  end

end
