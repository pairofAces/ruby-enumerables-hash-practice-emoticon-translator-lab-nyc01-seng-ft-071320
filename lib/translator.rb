# require modules here
require "yaml"
require "pry"

def load_library(file)
  hash = {}
  library = YAML.load_file('./lib/emoticons.yml')
  library.each do |key, value|
    hash[key] = {}
    hash[key][:english] = value[0]
    hash[key][:japanese] = value[1]
  end
  hash
end

def get_japanese_emoticon(library, emoticon)
  emotions = load_library(library)
  emotions.each do |key, value|
    if emotions[key][:english] == emoticon
      return emotions[key][:japanese]
    end
  end
  return "Sorry, that emoticon was not found"
end

def get_english_meaning(library, emoticon)
  emotions = load_library(library)
  emotions.each do |key, value|
    if emotions[key][:japanese] == emoticon
      return key
    end
  end
  return "Sorry, that emoticon was not found"
end 