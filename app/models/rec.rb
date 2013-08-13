class Rec
	require 'json'

	def get_rec(ingredients)
		#  Current API Plan: Free 
		# Usage: 0 / 500 
		# API Key: dbeba36bca60ed831f5afa391a4a1cc8 
		# HTTParty


		# http://food2fork.com/api/search
		# HTTParty
		# ingredients = {'q' => ['onions', 'carrots', 'squash']}
		
		# ingredients_URI =  {:a => "a", :b => "b"}.to_query
		
		response = HTTParty.get("http://food2fork.com/api/search?key=dbeba36bca60ed831f5afa391a4a1cc8&q=#{ingredients}")
		# puts response.body, response.code, response.message, response.headers.inspect
		return JSON.parse(response.body)['recipes']
		# return response.body
	end
end