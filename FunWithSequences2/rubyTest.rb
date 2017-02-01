class ArrayHelper
	def printArr(arr)
		res = ""
		arr.each do |e|
			res += e.to_s + " "
		end
		puts res
	end

	def stringArr2Int(arr)
		res = Array.[];
		arr.each do |e|
			res << e.to_i
		end
		res
	end
end

class Solver

	@s
	@q
	@i
	@res

	def initialize(arr1, arr2)
		@s = arr1
		@q = arr2
		@i = 0
		@res = Array.[]
	end

	def solve
		@s.each do |e|
			if @i < @q.size && e > @q[@i]
				self.incrementUntillNoLongerGreaterThan(e)
			end
			if e == @q[@i]
				@res << e
			end
		end
	end

	def getResult
		@res
	end

	def incrementUntillNoLongerGreaterThan(e)
		while (@i < (@q.size - 1) && e > @q[@i]) do
			@i = @i + 1
		end
	end

end



n = gets
s = gets
m = gets
q = gets

helper = ArrayHelper.new

s = helper.stringArr2Int(s.split(' '))
q = helper.stringArr2Int(q.split(' '))

mySolver = Solver.new(s, q)
mySolver.solve
helper.printArr(mySolver.getResult)