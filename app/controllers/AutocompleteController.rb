class AutocompleteController < ApplicationController
  include DictionaryHelper

  WORDS_LIMIT = 20
  
  def words
    @dictionary = user_dictionary
    # Should exclude words already in dictionary
    @result = get_words(params[:term]) - @dictionary
  end

  private

  def get_words(template)
    Word.get_words(template, WORDS_LIMIT)
    # ['aaa', 'bbb', 'Ccc']
  end
  
end