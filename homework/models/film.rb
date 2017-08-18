require_relative('../customer')

class Film

attr_reader (:id)
attr_accessor (:title , :price)

def initialize(film_details)
@id = film_details['id'].to_i
@title = film_details['title']
@price= film_details['price'].to_i
end


end
