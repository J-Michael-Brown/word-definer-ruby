class Word

  @@library[]

  attr_accessor(:definitions)
  attr_reader(:term)

  def initialize(term, definitions_array = [], pronounciation = false)
    @term = term
    @definitions = definitions_array
    @pronounciation = pronounciation
  end

  def self.all
    @@library
  end

  def self.add_to_lib(word_object)
    if word_object.class == Word
      @@library.push(word_object)
    else
      false
    end
  end

  def self.find_index_by_term(this_term)
    @@library.each_with_index do |term, i|
      if term.term == this_term
        return i
      end
    end
    false
  end

  def self.find_word_by_term(this_term)
    i = self.find_index_by_term(this_term)
    if i
      @@library[i]
    end
  end

  def self.delete_word(word)
    i = self.find_index_by_term(word.term)
    @@library.slice!(i)
  end


end
