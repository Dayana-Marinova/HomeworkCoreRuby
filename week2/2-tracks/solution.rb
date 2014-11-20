class Track

  PROPERTIES = [:artist, :name, :album, :genre]

  PROPERTIES.each { |p| attr_accessor p }

  def initialize(*args)
    if not args[0].is_a? Hash
      args[0] = (PROPERTIES.zip(args)).inject({}) { |hash, pair| hash[pair.first] = pair[1]; hash }
    end
    args[0].each { |k, v| instance_variable_set("@#{k}", v) unless v.nil? }
  end
end


class Playlist

  def self.from_yaml(path)
    #your code goes here
  end

  def initialize(*tracks)
    @tracks = tracks.flatten
  end

  def each(&block)
    each(&block)
  end

  def find(&block)
    Playlist.new @tracks.select { |track| track if yield(track) }
  end

  def find_by(*filters)
    Playlist.new @tracks.select{|track| track if filters.all?{|filter| filter.call(track)} }
  end

  def find_by_something(method, something)
    Playlist.new @tracks.select { |track| track if track.send(method) == something }
  end

  def find_by_name(name)
    find_by_something(:name, name)
  end

  def find_by_artist(artist)
    find_by_something(:artist, artist)
  end

  def find_by_album(album)
    find_by_something(:album, album)
  end

  def find_by_genre(genre)
    find_by_something(:genre, genre)
  end

  def shuffle
    Playlist.new @tracks.shuffle(random: Random.new(rand(1000)))
  end

  def random
    Track.new @tracks[rand(@tracks.size)]
  end

  def to_s
    result = ""
    @tracks.each { |track| result += " #{track.send(:artist).strip.center(30)}#{track.send(:name).strip.center(30)}#{track.send(:album).strip.center(30)}#{track.send(:genre).strip.center(30)} \n "
    }
    result
  end

  def &(other)
    Playlist.new
  end

  def |(other)
    Playlist.new
  end

  def -(playlist)
    Playlist.new
  end
end


class AwesomeRockFilter
  AWESOME_ARTISTS = %w(Led\ Zeppellin The\ Doors Black\ Sabbath Iron\ Maiden)

  def call(track)
    AWESOME_ARTISTS.include? track.artist
  end
end

track = Track.new artist:"KAYTRANADA feat. Shay Lia",
                  name: "Leave me alone",
                  album: "So Bad",
                  genre: "Dance"

track2 = Track.new  artist: "Iron Maiden",
                    name: "The numnber of the beast",
                    album: "The numnber of the beast",
                    genre: "heavy metal"

track3 = Track.new  artist: "me",
                    name: "me",
                    album: "me",
                    genre: "me"

track4 = Track.new  artist: "you",
                    name: "you",
                    album: "you",
                    genre: "you"

playlist = Playlist.new(track, track2, track3)
playlist1 = Playlist.new(track4, track2, track3)

#p playlist.find { |track| ["Iron Maiden", "The Doors"].include? track.artist }

#p playlist.find_by AwesomeRockFilter.new

awesome_rock_filter = proc do |track|
  awesome_artists = %w(Led\ Zeppellin The\ Doors Black\ Sabbath Iron\ Maiden me)
  awesome_artists.include? track.artist
end

#p playlist.find_by awesome_rock_filter
#p playlist.find_by_name('me')
#p playlist.shuffle
#p playlist.random
puts playlist.to_s
#p playlist.&(playlist1)
#p "hello\n hi".slice()