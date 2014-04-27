require_relative '../../lib/transpose_chords'

module TransposeChords
  describe Chord do
    context 'transposing to a new key' do
      it 'transposes a chord progression' do
        Chord.transpose(['C','F','Am','G']).to('D').should == ['D','G','Bm','A']
      end

      it 'transposes a chord progression with inverted chords' do
        Chord.transpose(['C/E','F/A','Am/G','G/B']).to('D').should == ['D/F#','G/B','Bm/A','A/C#']
      end

      it 'transposes a chord progression to a sharp note' do
        Chord.transpose(['C','F','Am','G']).to('D#').should == ['D#','G#','Cm','A#']
      end

      it 'transposes a chord progression to a flat note' do
        Chord.transpose(['Cm','F','Am','G']).to('Bb').should == ['Bbm','Eb','Gm','F']
      end

      it 'transposes a chord progression to a flat note scale (F)' do
        Chord.transpose(['C','F','Am','G']).to('F').should == ['F','Bb','Dm','C']
      end
    end

    context 'transposing with a capo' do
      it 'transposes the chords' do
        Chord.transpose(['C','D','G']).capo(2).should == ['D','E','A']
      end
    end
  end
end
