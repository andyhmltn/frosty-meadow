require 'json'

class FrostyMeadow
	def self.generate params = {}
		adjectives = (params[:adjectives].nil?)? self.get_default_words['adjectives'] : params[:adjectives]
		nouns = (params[:nouns].nil?)? self.get_default_words['nouns'] : params[:nouns]

		result = "#{adjectives[rand(adjectives.length)]} #{nouns[rand(nouns.length)]}"

		return (params[:underscored].nil? || params[:underscored] == false)? result : self.to_underscored(result)
	end

	def self.to_underscored result
		result.gsub(/ +/, '_')
	end

	def self.get_default_words 
		file_path =  File.join(File.dirname(__FILE__), 'data/words.json')
		file = File.new file_path, "r"

		file_contents = ""
		while line = file.gets
			file_contents << line
		end

		JSON.parse(file_contents)
	end
end