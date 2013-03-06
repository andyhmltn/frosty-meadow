require 'json'

module FrostyMeadow
	module Version
    	MAJOR = 1
    	MINOR = 1
    	PATCH  = 0

    	FULL = [MAJOR, MINOR, PATCH].join('.')

    	class << self
    		def to_s
    			FULL
    		end
    	end
  	end

	def self.generate params = {}
		words = get_words params

		adjectives = words['adjectives']
		nouns      = words['nouns']

		result = "#{adjectives[rand(adjectives.length)]} #{nouns[rand(nouns.length)]}"
		
		return (params[:separator] && self.seperate(result, params[:separator])) || result
	end

	def self.seperate result, separator
		result.gsub(/ +/, separator)
	end

	def self.get_words params = {}
		file_path =  File.join(File.dirname(__FILE__), 'data/words.json')
		file = File.new file_path, "r"

		file_contents = ""
		while line = file.gets
			file_contents << line
		end

		words = JSON.parse(file_contents)

		words['adjectives'] = params[:adjectives] unless params[:adjectives].nil?
		words['nouns'] = params[:nouns] unless params[:nouns].nil?

		return words
	end

	def self.generate_hex_name
		generated_string = self.generate(:separator => '-')

		return "#{generated_string}-#{self.hex_string}"
	end

	def self.hex_string length=5
		((0..length).map{rand(256).chr}*"").unpack("H*")[0][0,length]
	end
end