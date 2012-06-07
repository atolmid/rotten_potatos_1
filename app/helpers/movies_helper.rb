module MoviesHelper
  # Checks if a number is odd:
  def oddness(count)
    count.odd? ?  "odd" :  "even"
  end
  
  def checked?(rating) 
    @sel_ratings.include? rating 
  end
  
  def ratings_s(ratings)
    (ratings == nil) ? ((session[:ratings]==nil) ? rating = Movie.ratings : ratings = session[:ratings].to_hash.keys) : (ratings=ratings)
  end
  
  def path(sort,ratings)
    (sort==nil) ? sort = session[:sort_by] : sort = sort
    (session[:ratings]==nil) ? session[:ratings] = Movie.ratings : session[:ratings] = session[:ratings]
    (ratings == nil) ? ratings = session[:ratings] : ratings = ratings
    redirect_to movie_path({:sort_by=>sort, :ratings=>ratings})
  end
  
end
