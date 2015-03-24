class Url < ActiveRecord::Base
	 # Remember to create a migration!
  validates :url_address, presence: true
  validate :valid_url
  # validates :url_address, format: { with: URI.regexp }, if: Proc.new { |a| a.url.present? }
  before_create :generate_shorten_url

  def generate_shorten_url
    x = []
    x << (0...8).map { ('a'..'z').to_a[rand(26)] }
    self.shorten_url = "#{x.join("")}"
  end

  def valid_url
    uri = URI.parse(url_address) rescue false
    errors.add(:url_address, "Invalid http") unless uri.kind_of?(URI::HTTP) || uri.kind_of?(URI::HTTPS)
  end

  def add_to_counter
    self.counter += 1
    save
  end
end

