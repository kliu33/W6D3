# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

ActiveRecord::Base.transaction do
    ArtworkShare.delete_all
    Artwork.delete_all
    User.delete_all
    puts "Resetting id sequences..."
    %w(users artworks artwork_shares).each do |table_name|
        ApplicationRecord.connection.reset_pk_sequence!(table_name)
    end

    rex = User.create!(
        username: "rex"
    )

    rex1 = User.create!(
        username: "rex1"
    )

    rex2 = User.create!(
        username: "rex2"
    )

    rex3 = User.create!(
        username: "rex3"
    )

    rex4 = User.create!(
        username: "rex4"
    )

    rex5 = User.create!(
        username: "rex5"
    )

    rex6 = User.create!(
        username: "rex6"
    )

    rex7 = User.create!(
        username: "rex7"
    )

    rex8 = User.create!(
        username: "rex8"
    )

    rex9 = User.create!(
        username: "rex9"
    )

    mona_lisa = Artwork.create!(
        title: "Mona Lisa",
        image_url: "monalisa.com",
        artist_id: rex.id
    )

    starry_night = Artwork.create!(
        title: "Starry Night",
        image_url: "starrynight.com",
        artist_id: rex1.id
    )

    scream = Artwork.create!(
        title: "Scream",
        image_url: "scream.com",
        artist_id: rex2.id
    )

    scream_share = ArtworkShare.create!(
        artrework_id: scream.id,
        viewer_id: rex6.id
    )

    artwork_share = ArtworkShare.create!(
        artwork_id: mona_lisa.id,
        viewer_id: rex.id
    )

    artwork_share1 = ArtworkShare.create!(
        artwork_id: mona_lisa.id,
        viewer_id: rex1.id
    )

    artwork_share2 = ArtworkShare.create!(
        artwork_id: mona_lisa.id,
        viewer_id: rex2.id
    )

    artwork_share3 = ArtworkShare.create!(
        artwork_id: mona_lisa.id,
        viewer_id: rex3.id
    )

    artwork_share4 = ArtworkShare.create!(
        artwork_id: mona_lisa.id,
        viewer_id: rex4.id
    )

    artwork_share5 = ArtworkShare.create!(
        artwork_id: starry_night.id,
        viewer_id: rex5.id
    )
    artwork_share6 = ArtworkShare.create!(
        artwork_id: starry_night.id,
        viewer_id: rex6.id
    )
    artwork_share7 = ArtworkShare.create!(
        artwork_id: starry_night.id,
        viewer_id: rex7.id
    )
    artwork_share8 = ArtworkShare.create!(
        artwork_id: starry_night.id,
        viewer_id: rex8.id
    )

    artwork_share9 = ArtworkShare.create!(
        artwork_id: starry_night.id,
        viewer_id: rex9.id
    )
end