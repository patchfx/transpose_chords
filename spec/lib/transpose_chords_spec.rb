require_relative '../../lib/transpose_chords'

module TransposeChords
  describe Chord do
    context 'transposing to a new key' do
      it 'transposes a chord progression' do
        Chord.transpose(['C','F','Am','G']).to('D').should == ['D','G','Bm','A']
      end
    end

    context 'transposing with a capo' do
      it 'transposes the chords' do
        Chord.transpose(['C','D','G']).capo(2).should == ['D','E','A']
      end
    end
  end
end
