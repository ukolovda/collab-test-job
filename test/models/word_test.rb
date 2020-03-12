require 'test_helper'

class WordTest < ActiveSupport::TestCase

  test 'upload_from_url' do
    url = 'https://raw.githubusercontent.com/ukolovda/collab-test-job/master/Gemfile'
    Word.upload_from_url(url)
    assert Word.count > 50
  end
  
  test "upload_csv from file" do
    file_name = File.join(Rails.root, 'test', 'fixtures', 'files', 'test_words.txt')
    Word.upload_file(file_name)

    assert_equal 1036, Word.count

    r = Word.where(value: 'Aalto').first
    assert_not_nil r
    assert_equal 'aalto', r.locase_value
  end

  test 'get words' do
    values = Word.get_words('str', 10)
    assert_equal ['str 1', 'Str 2'], values
  end
end
