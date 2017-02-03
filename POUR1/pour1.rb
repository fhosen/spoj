class Pour1Solver
	def initialize(a, b, c)
		@big_vessel = [a, b].max
		@small_vessel = [a, b].min
		@objective = c
	end

	def solve
		if @objective > @big_vessel
			return -1
		end

		# Resultado posible de llenar la vasija grande a partir de la chica
		if @objective % @small_vessel == 0
			candidate_res = @objective / @small_vessel
			candidate_res * 2
		end

		# Se puede alcanzar el resultado "sacando" agua de la vasija grande
		if !can_remove_water? && candidate_res.nil?
			return -1
		end

		if !can_remove_water?
			return candidate_res
		end

		if candidate_res.nil?
			return calculate_steps_removing_water[0].to_i
		end 

		return [candidate_res, calculate_steps_removing_water[0]].min
	end

	private
	def can_remove_water?
		calculate_steps_removing_water[0] == calculate_steps_removing_water[1]
	end

	# Llenar primero la vasija grande, e ir descargandola (y vaciando la chica).
	def calculate_steps_removing_water
		steps_required_to_fill = (@big_vessel - @objective) / @small_vessel.to_f
		steps_as_integer = (@big_vessel - @objective) / @small_vessel

		return steps_as_integer *2 , steps_required_to_fill *2
	end
end

test_cases = gets.to_i
(1..test_cases).each { 
	a = gets.to_i
	b = gets.to_i
	c = gets.to_i
	solver = Pour1Solver.new(a, b, c)
	puts solver.solve	
}