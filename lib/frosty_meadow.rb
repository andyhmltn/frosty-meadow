class FrostyMeadow
	def self.generate params = {}
		adjectives = (params[:adjectives].nil?)? self.get_default_words[:adjectives] : params[:adjectives]
		nouns = (params[:nouns].nil?)? self.get_default_words[:nouns] : params[:nouns]

		result = "#{adjectives[rand(adjectives.length)]} #{nouns[rand(nouns.length)]}"

		return (params[:underscored].nil? || params[:underscored] == false)? result : self.to_underscored(result)
	end

	def self.to_underscored result
		result.gsub(/ +/, '_')
	end

	def self.get_default_words
		{:adjectives => ["autumn", "hidden", "bitter", "misty", "silent", "empty", "dry", "dark",
	    "summer", "icy", "delicate", "quiet", "white", "cool", "spring", "winter",
	    "patient", "twilight", "dawn", "crimson", "wispy", "weathered", "blue",
	    "billowing", "broken", "cold", "damp", "falling", "frosty", "green",
	    "long", "late", "lingering", "bold", "little", "morning", "muddy", "old",
	    "red", "rough", "still", "small", "sparkling", "throbbing", "shy",
	    "wandering", "withered", "wild", "black", "young", "holy", "solitary",
	    "fragrant", "aged", "snowy", "proud", "floral", "restless", "divine",
	    "polished", "ancient", "purple", "lively", "nameless"],
	     :nouns => ["waterfall", "river", "breeze", "moon", "rain", "wind", "sea", "morning",
	    "snow", "lake", "sunset", "pine", "shadow", "leaf", "dawn", "glitter",
	    "forest", "hill", "cloud", "meadow", "sun", "glade", "bird", "brook",
	    "butterfly", "bush", "dew", "dust", "field", "fire", "flower", "firefly",
	    "feather", "grass", "haze", "mountain", "night", "pond", "darkness",
	    "snowflake", "silence", "sound", "sky", "shape", "surf", "thunder",
	    "violet", "water", "wildflower", "wave", "water", "resonance", "sun",
	    "wood", "dream", "cherry", "tree", "fog", "frost", "voice", "paper",
	    "frog", "smoke", "star"]}
	end
end