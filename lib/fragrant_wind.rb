class FragrantWind
	attr_accessor :adjectives, :nouns, :result

	def initialize adjectives = nil, nouns = nil
		@adjectives = (adjectives.nil?)? self.get_default_adjectives : adjectives
		@nouns 		= (nouns.nil?)? self.get_default_nouns : nouns
	end

	def generate params = {}
		@result = "#{@adjectives[rand(@adjectives.length)]} #{@nouns[rand(@nouns.length)]}"

		if params[:to_underscored].nil? || params[:to_underscored] == false
			return @result
		else
			return self.to_underscored
		end
	end

	def to_underscored
		@result.gsub(/ +/, '_')
	end

	def get_default_adjectives
		["autumn", "hidden", "bitter", "misty", "silent", "empty", "dry", "dark",
	    "summer", "icy", "delicate", "quiet", "white", "cool", "spring", "winter",
	    "patient", "twilight", "dawn", "crimson", "wispy", "weathered", "blue",
	    "billowing", "broken", "cold", "damp", "falling", "frosty", "green",
	    "long", "late", "lingering", "bold", "little", "morning", "muddy", "old",
	    "red", "rough", "still", "small", "sparkling", "throbbing", "shy",
	    "wandering", "withered", "wild", "black", "young", "holy", "solitary",
	    "fragrant", "aged", "snowy", "proud", "floral", "restless", "divine",
	    "polished", "ancient", "purple", "lively", "nameless"]
	end

	def get_default_nouns
		["waterfall", "river", "breeze", "moon", "rain", "wind", "sea", "morning",
	    "snow", "lake", "sunset", "pine", "shadow", "leaf", "dawn", "glitter",
	    "forest", "hill", "cloud", "meadow", "sun", "glade", "bird", "brook",
	    "butterfly", "bush", "dew", "dust", "field", "fire", "flower", "firefly",
	    "feather", "grass", "haze", "mountain", "night", "pond", "darkness",
	    "snowflake", "silence", "sound", "sky", "shape", "surf", "thunder",
	    "violet", "water", "wildflower", "wave", "water", "resonance", "sun",
	    "wood", "dream", "cherry", "tree", "fog", "frost", "voice", "paper",
	    "frog", "smoke", "star"]
	end
end