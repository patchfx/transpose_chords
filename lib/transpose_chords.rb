module TransposeChords
  class Chord
    FLATS = %w(C Db D Eb E F Gb G Ab A Bb B)
    SHARPS = %w(C C# D D# E F F# G G# A A# B)

    def self.transpose(keys)
      new(keys)
    end

    def initialize(keys)
      @keys = keys
      @scale = FLATS
    end

    def to(key)
      @scale = key.include?('b') || key.start_with?('F') ? FLATS : SHARPS
      intervals = index_of(key)
      @keys.map { |k| transpose_chord(k, intervals) }
    end

    def capo(fret)
      @keys.map { |k| transpose_chord(k, fret) }
    end

    private

    def transpose_chord(chord, intervals)
      chord.gsub /([A-G][#b]*)/ do
        chord_name, complement = $~.captures
        new_chord_name = @scale[(index_of(chord_name) + intervals) % @scale.size]
        "#{new_chord_name}#{complement}"
      end
    end

    def index_of(chord_name)
      index = FLATS.index(chord_name) || SHARPS.index(chord_name)
      raise "Cannot recognize chord name '#{chord_name}'" unless index
      index
    end
  end
end
