class BooksController < ApplicationController
	def index
		if (defined? params[:query])
			response = Book.__elasticsearch__.search(
				query: {
					multi_match: {
						query: params[:query],
						fields: ['name', 'author.first_name', 'author.last_name', 'isbn']
					}
				}
			).results
			
			render json: {
				results: response.results,
				total: response.total
			}
		else
			response = Book.__elasticsearch__.search(
				query: {
					wildcard: { 
						"name": "*"
					}
				}
			).results
		puts results
		end
	end
end