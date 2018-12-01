class Word

  attr_accessor(:definitions)
  attr_reader(:term)

  def initialize(term, definitions_array = [], pronounciation = false)
    @term = term
    @definitions = definitions_array
    @pronounciation = pronounciation
  end

  @@dictionary = [
    # Word.new("elmo",["famouse childrens show character"]),
    # Word.new("love"),
    # Word.new("melo"),
    # Word.new("ounce")
  ]

  def self.all
    @@dictionary
  end

  def self.alphabetical
    alpha_terms = []
    @@dictionary.each do |word|
      alpha_terms.push(word.term)
    end
    alpha_terms.sort!
    alpha_dictionary = []
    alpha_terms.each do |term|
      alpha_dictionary.push(self.find_word_by_term(term))
    end
    alpha_dictionary
  end

  def self.find_index_by_term(this_term)
    @@dictionary.each_with_index do |term, i|
      if term.term == this_term
        return i
      end
    end
    false
  end

  def self.find_word_by_term(this_term)
    i = self.find_index_by_term(this_term)
    if i
      @@dictionary[i]
    end
  end

  def self.find_index_by_word(word_to_match)
    i = self.find_index_by_term(word_to_match.term)
  end

  def self.add_to_lib(word_object)
    if (word_object.class != Word)
      false
    else
      @@dictionary.each do |word|
        unique_term = word_object.term
        if word.term == unique_term
          return false
        end
      end
      @@dictionary.push(word_object)
    end
  end

  def self.delete_word(word)
    i = self.find_index_by_term(word.term)
    @@dictionary.slice!(i)
  end

  def self.add_define(word, new_meaning)
    i = self.find_index_by_word(word)
    if new_meaning != ""
      @@dictionary[i].definitions.push(new_meaning)
    else
      @@dictionary[i]
    end
  end

end
