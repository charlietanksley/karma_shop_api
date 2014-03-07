require 'spec_helper'
require_relative '../../app/models/hash_munger'

describe HashMunger do
  let(:hash) { Hash['thisKey' => 1, 'that' => 2] }
  let(:munger) { HashMunger.new(hash) }

  describe 'transforming the keys of the hash' do
    it 'can do one transformation' do
      new_hash = munger.transform(keys: [:to_sym])
      expect(new_hash.keys).to match_array([:thisKey, :that])
    end

    it 'can chain multiple transformations' do
      new_hash = munger.transform(keys: [:upcase, :to_sym])
      expect(new_hash.keys).to match_array([:THISKEY, :THAT])
    end
  end
end
