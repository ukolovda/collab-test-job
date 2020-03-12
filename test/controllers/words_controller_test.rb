require 'test_helper'

class WordsControllerTest < ActionController::TestCase

  test 'routes' do
    assert_routing({method: :post, path: '/words'}, controller: 'words', action: 'create')
  end
  
  test 'should get index' do
    get :index
    assert_response :success
  end

  test 'should post new word' do
    post :create, xhr: true, params: {word: 'abc'}
    assert_equal ['abc'], session[:dictionary]
    assert_response :success
  end

end