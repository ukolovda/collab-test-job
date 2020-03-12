class AutocompleteController < ApplicationController
  include DictionaryHelper
  
  def words
    @dictionary = user_dictionary
    # Should exclude words already in dictionary
    @result = get_words(params[:term]) - @dictionary
  end

  private

  def get_words(template)
    ['aaa', 'bbb', 'Ccc']
  end
  
end