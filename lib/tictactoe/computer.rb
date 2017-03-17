module Tictactoe
	class Computer

		attr_accessor :board, :piece, :win_patterns, :arr_of_started, :arr_of_pristine

		def initialize(piece = "X")
			@piece = piece
      @arr_of_started = Array.new
      @arr_of_pristine = Array.new
		end

		def find_non_losing_move
      @arr_of_started = Array.new
      @arr_of_pristine = Array.new
			$win_patterns.each do |pattern|
				if find_last_X(pattern)
          return
        elsif find_last_O(pattern)
          return
        elsif find_started_pattern(pattern)
          return pick_best_dupe(@arr_of_started)
        else
        	find_empty_pattern(pattern)
          return pick_best_dupe(@arr_of_pristine)
        end
			end
      unless true
        arr = Array.new   #will be a tied game, just filling up the spaces
        $board.grid.each_index do |position|
          if $board.get_cell(position).piece == " "
            arr << position
          end
        end
        return arr.sample 			
		  end
    end

		def find_last_X(pattern)
			if pieces_in_pattern(pattern, "X") == 2
				unless blank_in_pattern(pattern).empty?
	        var = blank_in_pattern(pattern).join.to_i
	        return var
	      end
	    else
	    	false
	    end
		end
			
		def find_last_O(pattern)				
      if pieces_in_pattern(pattern, "O") == 2
      	unless blank_in_pattern(pattern).empty?
          var = blank_in_pattern(pattern).join.to_i
     			return var
     		end
     	else
     		false
     	end
    end

    def find_started_pattern(pattern)
      if pieces_in_pattern(pattern, "X") == 1 && no_placed_O(pattern)
        @arr_of_started << blank_in_pattern(pattern)
        @arr_of_started.flatten!
      else
    	 false
      end
    end

		def find_empty_pattern(pattern)
      if pattern.all? {|position| $board.get_cell(position).piece == " "}
        pattern.each do |position|
          @arr_of_pristine << position
        end
      else
  			false
      end
  	end

	  #   if defined? var
	  #     return var
	  #   elsif @arr_of_available.any?
	  #     # return pick_best_dupe(@arr_of_available)
	  #   else
	  #     puts "Oh dear."
	  #   end
	  # end

		def pieces_in_pattern(pattern, piece)
	    total = 0
	    pattern.each do |position|
	      if $board.get_cell(position).piece == piece
	        total += 1
	      else
	        total += 0
	      end
	    end
	    return total
	  end

	  def blank_in_pattern(pattern)
	    arr_of_blanks = Array.new
	    pattern.each do |position|
	      if $board.get_cell(position).piece == " "
	      	arr_of_blanks.push(position)
	      end
	    end
	    return arr_of_blanks
	  end

	  def no_placed_O(pattern)
	  	pattern.each do |position|
	  		if $board.get_cell(position).piece == "O"
	  			return false
	  		end
	  	end
      true
	  end

	  def pick_best_dupe(arr)
      for i in (4).downto(1)
        if arr.detect{|e| arr.count(e) > i}
          return arr.select{|e| arr.count(e) > i}.uniq.sample#.to_i
        end
      end
    end

	end
end