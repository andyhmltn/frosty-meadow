require 'json'

module FrostyMeadow
	module Version
    	MAJOR  = 2
    	MINOR  = 1
    	PATCH  = 0

    	FULL = [MAJOR, MINOR, PATCH].join('.')

    	class << self
    		def to_s
    			FULL
    		end
    	end
  	end

  	module Hex
		class << self
			def generate length = 5
				return ((0..length).map{rand(256).chr}*"").unpack("H*")[0][0,length]
			end
		end
  	end

  	class << self
  		@@words = []
  		@@cached_path = ''

		def generate params = {}
			words = get_words params

			adjectives = words['adjectives']
			nouns      = words['nouns']

			result = "#{adjectives[rand(adjectives.length)]} #{nouns[rand(nouns.length)]}"
			
			return (params[:separator] && self.seperate(result, params[:separator])) || result
		end

		def seperate result, separator
			result.gsub(/ +/, separator)
		end

		def get_words params = {}

			if @@words.empty? || !params[:skip_cache].nil? || params[:from_file] != @@cached_path
				if params[:from_file].nil?
					file_path =  File.join(File.dirname(__FILE__), 'data/words.json')
				else
					file_path = params[:from_file]
				end

				file = File.new file_path, "r"

				file_contents = ""
				while line = file.gets
					file_contents << line
				end

				words 	= JSON.parse(file_contents)

				@@words 	  = words
				@@cached_path = file_path
			else
				words = @@words
			end

			words['adjectives'] = params[:adjectives] unless params[:adjectives].nil?
			words['nouns'] = params[:nouns] unless params[:nouns].nil?

			return words
		end

		def generate_hex_name params = {}
			generated_string = self.generate({:separator => '-'}.merge(params))

			return "#{generated_string}-#{self::Hex.generate}"
		end

		def hex_string length=5
			((0..length).map{rand(256).chr}*"").unpack("H*")[0][0,length]
		end
	end
end