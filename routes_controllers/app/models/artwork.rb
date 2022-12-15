# == Schema Information
#
# Table name: artworks
#
#  id         :bigint           not null, primary key
#  title      :string           not null
#  image_url  :string           not null
#  artist_id  :bigint           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Artwork < ApplicationRecord
    validates :title, presence: true, uniqueness: true
    validates :image_url, presence: true, uniqueness: true

    belongs_to :artist,
        primary_key: :id,
        foreign_key: :artist_id,
        class_name: :User
        # inverse_of: :artworks

    has_many :artwork_shares,
        primary_key: :id,
        foreign_key: :artwork_id,
        class_name: :ArtworkShare

    has_many :shared_viewers,
        through: :artwork_shares,
        source: :viewer

    def self.artworks_for_user_id(user_id)
        Artwork
            .joins(:shared_viewers)
            .where(artist_id: user_id)
            .or(where(artwork_shares: {viewer_id: user_id}))
            .select('DISTINCT artworks.id, title, image_url, artist_id,')
    end
    
end
