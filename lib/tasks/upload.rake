desc 'Upload words from source'
task :upload_words => :environment do
  puts 'Uploading'
  Word.upload
  puts "Uploaded #{Word.count} rows"
end