class Array
  def my_uniq
    uniq_elements = []

    self.each do |el|
      uniq_elements << el unless uniq_elements.include?(el)
    end

    uniq_elements
  end

  def two_sum
    zero_sum_indices = []

    self.each_with_index do |el_1, idx_1|
      self.each_with_index do |el_2, idx_2|
        if el_1 + el_2 == 0 && idx_1 < idx_2
          zero_sum_indices << [idx_1, idx_2]
        end
      end
    end

    zero_sum_indices
  end
end

class TowersOfHanoi
  attr_accessor :arrays

  def initialize
    @arrays = [[4,3,2,1],[],[]]
  end

  def move(stack_pos) # this will be like [0, 2]
    from_idx, to_idx = stack_pos
    if legal_move?(stack_pos)
      arrays[to_idx] << arrays[from_idx].pop
    end
  end

  def legal_move?(stack_pos)
    from_idx, to_idx = stack_pos
    return false if @arrays[from_idx].empty?
    return true if @arrays[to_idx].empty?
    @arrays[to_idx].last > @arrays[from_idx].last
  end

  def won?
    @arrays == [[],[],[4,3,2,1]]
  end
end