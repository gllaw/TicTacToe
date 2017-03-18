module Tictactoe
	class Computer

		attr_accessor :board, :piece, :win_patterns, :arr_of_started, :arr_of_pristine

		def initialize(piece = "X")
			@piece = piece
      @arr_of_started = Array.new
      @arr_of_pristine = Array.new
		end

		def find_non_losing_move
      if find_last_X !=false
        return find_last_X
      elsif find_last_O !=false
        return find_last_O
      elsif find_started_pattern !=false
        return find_started_pattern
      elsif find_empty_pattern !=false
        return find_empty_pattern
      else #will be a tied game, just filling up the spaces.
        arr = Array.new   
        $board.grid.each_index do |position|
          if $board.get_cell(position).piece == " "
            arr << position
          end
        end
        return arr.sample
      end
    end

# ========================== SEPARATED OUT ========================
    # def priority_position
    #   $win_patterns.each do |pattern|
    #     if find_last_X(pattern)
    #       return find_last_X(pattern)
    #     elsif find_last_O(pattern)
    #       return find_last_O(pattern)
    #     else
    #       return false
    #     end
    #   end
    # end

		def find_last_X
      $win_patterns.each do |pattern|
  			if pieces_in_pattern(pattern, "X") == 2
  				unless blank_in_pattern(pattern).empty?
  	        return blank_in_pattern(pattern).join.to_i
  	      end
  	    else
  	    	false
  	    end
      end
		end
			
		def find_last_O
      $win_patterns.each do |pattern|
        if pieces_in_pattern(pattern, "O") == 2
        	unless blank_in_pattern(pattern).empty?
            return blank_in_pattern(pattern).join.to_i
       		end
       	else
       		false
       	end
      end
    end

    def find_started_pattern
      @arr_of_started = Array.new
      $win_patterns.each do |pattern|
        if pieces_in_pattern(pattern, "X") == 1 && no_placed_O(pattern)
          @arr_of_started << blank_in_pattern(pattern)
          @arr_of_started.flatten!
        end
      end
      if @arr_of_started.any?
        return pick_best_dupe(@arr_of_started)
      else
        false
      end
    end

		def find_empty_pattern
      @arr_of_pristine = Array.new
      $win_patterns.each do |pattern|
        if pattern.all? {|position| $board.get_cell(position).piece == " "}
          @arr_of_pristine << blank_in_pattern(pattern)
          @arr_of_pristine.flatten!
        end
      end
      if @arr_of_pristine.any?
        return pick_best_dupe(@arr_of_pristine)
      else
       false
      end
  	end

# =========================== HELPERS ============================
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
      for i in (3).downto(0)
        if arr.detect{|e| arr.count(e) > i}
          return arr.select{|e| arr.count(e) > i}.uniq.sample.to_i
        end
      end
    end

	end
end