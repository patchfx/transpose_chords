require_relative '../../lib/transpose_chords'

module TransposeChords
  describe Chord do
    context 'transposing to a new key' do
      it 'transposes a chord progression' do
        expect(Chord.transpose(['C','F','Am','G']).to('D')).to match_array(['D','G','Bm','A'])
      end

      it 'transposes a chord progression with inverted chords' do
        expect(Chord.transpose(['C/E','F/A','Am/G','G/B']).to('D')).to match_array(['D/F#','G/B','Bm/A','A/C#'])
      end

      it 'transposes a chord progression to a sharp note' do
        expect(Chord.transpose(['C','F','Am','G']).to('D#')).to match_array(['D#','G#','Cm','A#'])
      end

      it 'transposes a chord progression to a flat note' do
        expect(Chord.transpose(['Cm','F','Am','G']).to('Bb')).to match_array(['Bbm','Eb','Gm','F'])
      end

      it 'transposes a chord progression to a flat note scale (F)' do
        expect(Chord.transpose(['C','F','Am','G']).to('F')).to match_array(['F','Bb','Dm','C'])
      end
    end

    context 'transposing with a capo' do
      it 'transposes the chords' do
        expect(Chord.transpose(['C','D','G']).capo(2)).to match_array(['D','E','A'])
      end
    end
  end
end
