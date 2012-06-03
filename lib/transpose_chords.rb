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
        c: ['C', 'Dm', 'Em', 'F', 'G', 'Am', 'Bdim'],
        d: ['D', 'Em', 'F#m', 'G', 'A', 'Bm', 'C#dim'],
        e: ['E', 'F#m', 'G#m', 'A', 'B', 'C#m', 'D#dim'],
        f: ['F', 'Gm', 'Am', 'Bb', 'C', 'Dm', 'Edim'],
        g: ['G', 'Am', 'Bm', 'C', 'D', 'Em', 'F#dim'],
        a: ['A', 'Bm', 'C#m', 'D', 'E', 'F#m', 'G#dim'],
        b: ['B', 'C#m', 'D#m', 'E', 'F#', 'G#m', 'A#dim']
      }
    end

    def to(key)
      key = table_key_for(key)
      key_indexes.map { |k| table[key][k] }
    end

    def table_key_for(key)
      key.downcase.to_sym
    end

    def key_indexes
      @keys.map { |k|  keys_for(table_key_for(@keys.first))[k] }
    end

    def keys_for(key)
      Hash[table[key].map.with_index{|*ki| ki}]
    end
  end
end
