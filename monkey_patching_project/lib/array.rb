# Monkey-Patch Ruby's existing Array class to add your own custom methods
require "byebug"
class Array
    def span
        if self.length < 1
            return nil
        else self.max - self.min
        end
    end

    def average
        if self.length < 1
            return nil
        else self.sum*1.00 / self.length*1.00
        end
    end

    def median
        if self.length < 1
            return nil
        end

        sorted = self.sort
        if self.length.odd?
            return sorted[sorted.length/2]
        else 
            
            return ((sorted[sorted.length/2]*1.0) + (sorted[sorted.length/2 - 1]*1.0)) / 2.0
        end
    end

    def counts
        counts_hash = Hash.new(0)
        self.each { |ele| counts_hash[ele] += 1 }
        counts_hash
    end

    def my_count(arg)
        count = 0
        self.each { |ele| count += 1 if ele == arg }
        count
    end

    def my_index(arg)
        return nil if !self.include?(arg)
        self.each_with_index { |ele, i| return i if ele == arg }
    end

    def my_uniq
        hash = {}
        new_arr = []
        self.each { |ele| hash[ele] = "anything" }
        hash.each { |k, v| new_arr << k }
        new_arr
    end

    def my_transpose
        #arr[0..n] to #arr[0][0]..arr[0][n], arr[1][0]..arr[1][n], etc
        length = self[0].length
    
        (0...length).map do |i|
            self.map { |sub_arr| sub_arr[i] }
        end
    end
end

# #arr_1 = [
#     ["a", "b", "c"],      
#     ["d", "e", "f"],
#     ["g", "h", "i"]
#   ]
#   expected_1 = [          
#     ["a", "d", "g"],      [0][0], [1][0], [2][0]
#     ["b", "e", "h"],      [0][1], [1][1], [2][1]
#     ["c", "f", "i"]       [0][2], [1][2], [2][2]
#   ]