# frozen_string_literal: true

Dir['data/subs/*.srt'].each do |episode|
  content = File.read(episode)
  next if episode.include?('S05E05')

  babe_count = content.scan('babe').size
  baby_count = content.scan('baby').size

  File.open('data/data.csv', 'a') do |f|
    f.puts 'episode, babe, baby' if f.size.zero?
    episode = episode.split[3]
    f.puts "#{episode}, #{babe_count}, #{baby_count}"
  end
end
