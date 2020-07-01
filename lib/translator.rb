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

def get_japanese_emoticon(file, emoticon)
  emoticons = load_library(file)
  emoticons.each do |key, value|
    if emoticons[key][:english] == emoticon
      return emoticons[key][:japanese]
    end
  end
  return "Sorry, that emoticon was not found"
end

def get_english_meaning(file, emoticon)
  emoticons = load_library(file)
  emoticons.each do |key, value|
    if emoticons[key][:japanese] == emoticon
      return key
    end
  end
  return "Sorry, that emoticon was not found"
end 