module MoviesHelper
  # Checks if a number is odd:
  def oddness(count)
    count.odd? ?  "odd" :  "even"
  end
  
  def checked?(rating) 
    @sel_ratings.include? rating 
  end
  
  def ratings_s(ratings)
    (ratings == nil) ? ratings = session[:ratings].to_hash.keys : (ratings=ratings)
  end
  
end
