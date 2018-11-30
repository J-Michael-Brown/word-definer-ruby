class Word

  @@all_words[]

  attr_accessor(:term, :definitions)

  def initialize(term, definitions_array = [], pronounciation = false)
    @term = term
    @definitions = definitions_array
    @pronounciation = pronounciation
  end

  def self.all
    @@all_words
  end

  def self.add_to_lib(term_object)
    @@all_words.push(term_object)
  end

  def self.find_index_by_term(this_term)
    @@all_words.each_with_index do |term, i|
      if term.term == this_term
        return i
      end
    end
    false
  end

  def self.find_word_by_term(this_term)
    i = self.find_index_by_term(this_term)
    if i
      @@all_words[i]
    end
  end

end
