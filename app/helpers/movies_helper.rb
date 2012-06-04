module MoviesHelper
  # Checks if a number is odd:
  def oddness(count)
    count.odd? ?  "odd" :  "even"
  end
  
  def checked?(rating) 
    @sel_ratings.include? rating 
  end
end
