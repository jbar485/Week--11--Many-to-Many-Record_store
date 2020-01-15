class Album < ApplicationRecord
  scope :rock, -> { where(genre: "Rock") }
  scope :today, -> { where("created_at >=?", Time.now.beginning_of_day)}
  scope :ten_most_recent, -> { order(created_at: :desc).limit(10)}
  scope :most_songs, -> {(
    select("albums.id, albums.name, count(songs.id) as songs_count")
    .joins(:songs)
    .group("albums.id")
    .order("songs_count DESC")
    .limit(1)
  )}
  scope :search, -> (name_parameter) { where("name like ?", "%#{name_parameter}%")}

  scope :random, -> {(
    Album.order('RANDOM()').first()
  )}
  has_and_belongs_to_many(:artists)
  has_many :songs, dependent: :destroy
  validates :name, presence: true
  validates_length_of :name, maximum: 100

  before_save(:titleize_album)
  #
  # def self.rock
  #   where(genre: "Rock")
  # end

  private
  def titleize_album
    self.name = self.name.titleize
  end
end
