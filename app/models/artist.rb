class Artist < ApplicationRecord
  has_and_belongs_to_many(:albums)
  validates :name, presence: true
  validates_length_of :name, maximum: 100

  before_save(:titleize_artist)


  scope :random, -> {(
    Artist.order('RANDOM()').first()
  )}

  private
      def titleize_artist
        self.name = self.name.titleize
      end
end
