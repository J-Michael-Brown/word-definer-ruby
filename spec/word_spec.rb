require ('word')
require ('rspec')
require ('pry')

describe('.Word') do
  describe('#self.add_to_lib') do
    it "adds a word the the @@library class object, and returns the new @@library class object array" do
      starting_length = Word.all.length
      new_word = Word.new("new")
      Word.add_to_lib(new_word)
      ending_length = Word.all.length
      expect(ending_length).to eq(starting_length+1)
    end
  end

  describe('#self.find_index_by_term') do
    it "takes a 'term' string and attempts to match it to one of the sotred word object's Word.term. Returns index of Word object in @@library" do
      first_word = Word.new("first")
      Word.add_to_lib(first_word)
      second_word = Word.new("second")
      Word.add_to_lib(second_word)
      expect(Word.find_index_by_term("first")).to eq(Word.find_index_by_term("second")-1)
    end
  end

  describe('#self.find_word_by_term') do
    it "utilizes the #find_index_by_term to return the word object based off of its term." do
      newer_word = Word.new("newer")
      Word.add_to_lib(newer_word)
      expect(Word.find_word_by_term("newer")).to eq(newer_word)
    end
  end

  describe('#self.remove_from_lib') do
    it "takes a word object, finds, removes and returns that word" do
      doomed = Word.new("Doomed",["It will not last long"])
      Word.add_to_lib(doomed)
      expect(Word.delete_word(doomed)).to eq(doomed)
      expect(Word.all.include?(doomed)).to eq(false)
    end
  end
end
