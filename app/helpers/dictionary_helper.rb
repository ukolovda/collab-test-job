module DictionaryHelper

  def user_dictionary
    session[:dictionary] || []
  end

  def append_to_user_dictionary(word)
    session[:dictionary] ||= []
    session[:dictionary] << word
  end
end