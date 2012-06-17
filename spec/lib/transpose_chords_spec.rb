require_relative '../../lib/transpose_chords'

module TransposeChords
  describe Chord do
    context 'transposing to a new key' do
      it 'transposes a chord progression' do
        Chord.transpose(['C','F','Am','G']).to('D').should == ['D','G','Bm','A']
      end
    end
  end
end
