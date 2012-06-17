module TransposeChords
  class Chord
    def self.transpose(keys)
      new(keys)
    end

    def initialize(keys)
      @keys = keys
    end

    def table
      {
        to_key: {
          c: ['C', 'Dm', 'Em', 'F', 'G', 'Am', 'Bdim'],
          d: ['D', 'Em', 'F#m', 'G', 'A', 'Bm', 'C#dim'],
          e: ['E', 'F#m', 'G#m', 'A', 'B', 'C#m', 'D#dim'],
          f: ['F', 'Gm', 'Am', 'Bb', 'C', 'Dm', 'Edim'],
          g: ['G', 'Am', 'Bm', 'C', 'D', 'Em', 'F#dim'],
          a: ['A', 'Bm', 'C#m', 'D', 'E', 'F#m', 'G#dim'],
          b: ['B', 'C#m', 'D#m', 'E', 'F#', 'G#m', 'A#dim']
        },
        to_capo: {
          c: ['C', 'C#/Db', 'D', 'D#/Eb', 'E', 'F', 'F#/Gb', 'G', 'G#/Ab', 'A', 'A#/Bb'],
          d: ['D', 'D#/Eb', 'E', 'F', 'F#/Gb', 'G', 'Gb/Ab', 'A', 'A#/Bb', 'B', 'C'],
          e: ['E', 'F', 'F#/Gb', 'G', 'G#/Ab', 'A', 'A#/Bb', 'B', 'C', 'C#/Db', 'D'],
          f: ['F', 'F#/Gb', 'G', 'G#/Ab', 'A', 'A#/Bb', 'B', 'C', 'C#/Db', 'D', 'D#/Eb'],
          g: ['G', 'G#/Ab', 'A', 'A#/Bb', 'B', 'C', 'C#/Db', 'D', 'D#/Eb', 'E', 'F'],
          a: ['A', 'A#/Bb', 'B', 'C', 'C#/Db', 'D', 'D#/Eb', 'E', 'F', 'F#/Gb', 'G'],
          b: ['B', 'C', 'C#/Db', 'D', 'D#/Eb', 'E', 'F', 'F#/Gb', 'G', 'G#/Ab', 'A']
        }
      }
    end

    def to(key)
      key = table_key_for(key)
      key_indexes.map { |k| table[:to_key][key][k] }
    end

    def capo(fret)
      @keys.map do |k|
        key = table_key_for(k)
        table[:to_capo][key][fret]
      end
    end

    def table_key_for(key)
      key.downcase.to_sym
    end

    def key_indexes
      @keys.map { |k|  keys_for(table_key_for(@keys.first))[k] }
    end

    def keys_for(key)
      Hash[table[:to_key][key].map.with_index{|*ki| ki}]
    end
  end
end
