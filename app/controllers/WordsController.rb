class WordsController < ApplicationController
  include DictionaryHelper

  def index
    @dictionary = user_dictionary
  end

  def create
    word = params[:word]
    append_to_user_dictionary word
  end
end