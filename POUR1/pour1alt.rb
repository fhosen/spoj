class Vessel
	def initialize(c)
		@capacity = c
		@content = 0
	end

	def fill
		@content = @capacity
	end

	def recive_water(x)
		old = @content
		@content = [@capacity, @content + x].min
		@content - old
	end

	def give_water(x)
		@content = [@content - x, 0].max
	end

	def empty
		@content = 0
	end

	def get_content
		@content
	end

	def get_capacity
		@capacity
	end

	def empty?
		@content == 0
	end
end

class Solver
	def initialize(a, b, c)
		@big_vessel =  Vessel.new([a, b].max)
		@small_vessel = Vessel.new([a, b].min)
		@objective = c
		@steps = 0
	end

	# Llenar la vasija grande e ir vaciandola de a poco
	def solve_A
		if @objective > @big_vessel.get_capacity
			return -1
		end

		fill_vessel(@big_vessel)
		while @big_vessel.get_content > @objective do
			empty_vessel(@small_vessel)
			pour(@big_vessel, @small_vessel)
		end

		if @big_vessel.get_content == @objective
			return @steps
		end

		return -1
	end

	# Ir llenando la vasija grande (que empieza vacía) con la vasija pequeña
	def solve_B
		if @objective > @big_vessel.get_capacity
			return -1
		end

		if @objective == @big_vessel.get_capacity || @objective == @small_vessel.get_capacity
			return 1
		end

		while @objective > @big_vessel.get_content
			pour(@small_vessel, @big_vessel)
		end

		if @big_vessel.get_content == @objective
			return @steps
		end

		return -1	
	end

	# echa el contenido de v1 en v2
	def pour(v1, v2)
		if v1.empty?
			fill_vessel(v1)
		end
		served_water = v2.recive_water(v1.get_content)
		v1.give_water(served_water)
		@steps += 1
	end

	def empty_vessel(v)
		if !v.empty?
			v.empty
			@steps += 1
		end
	end

	def fill_vessel(v)
		v.fill
		@steps += 1
	end
end

test_cases = gets.to_i
(1..test_cases).each { 
	a = gets.to_i
	b = gets.to_i
	c = gets.to_i
	solver_A = Solver.new(a, b, c)
	solver_B = Solver.new(a, b, c)

	results = [solver_A.solve_A, solver_B.solve_B].select {|e| e > 0}
	if results.empty?
		puts -1
	else
		puts results.min
	end
	
}