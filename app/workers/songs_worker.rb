class SongsWorker
  require 'csv'
  include Sidekiq::Worker
 
  def perform(songs_file)
    CSV.foreach(songs_file, headers: true) do |s|
      Song.create(name: s[0], artist_name: lead[1], last_name: lead[2])
    end
  end
end