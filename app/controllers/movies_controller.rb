class MoviesController < ApplicationController

  def show
    id = params[:id] # retrieve movie ID from URI route
    @movie = Movie.find(id) # look up movie by unique ID
    # will render app/views/movies/show.<extension> by default
  end

  def index
    redir = false,
    (params[:ratings] == nil) ? (((session[:ratings]== nil) ? rating = Movie.ratings : rating = session[:ratings].keys) ; redir = true) : (rating = params[:ratings].keys ; session[:ratings] = params[:ratings]),
    (params[:ratings] == nil) ? selected = ["none"] : selected = rating,
    (params[:sort_by] == nil) ? (((session[:sort_by]==nil)? order = "none" : order = session[:sort_by]) ; redir = true) : (session[:sort_by] = params[:sort_by] ; order = params[:sort_by]),
    
    if ( (!params[:ratings] && !params[:sort_by]) && (session[:ratings] || session[:sort_by]))
      redirect_to movies_path(:sort_by => session[:sort_by], :ratings => session[:ratings])
    end
    @order = case order
    when "title"
        [@col = 'title',
        @sel_ratings = selected,
        @all_ratings = Movie.ratings,
        @movies = Movie.find_all_by_rating(rating, :order =>'title')]
    when "date"
        [@col = 'date',
        @all_ratings = Movie.ratings,
        @sel_ratings = selected,
        @movies = Movie.find_all_by_rating(rating, :order=>'release_date')]
    else
        [@sel_ratings = selected,
        @all_ratings = Movie.ratings,
        @movies = Movie.find_all_by_rating(rating)]
    end
  end

  def new
    # default: render 'new' template
  end

  def create
    @movie = Movie.create!(params[:movie])
    flash[:notice] = "#{@movie.title} was successfully created."
    redirect_to movies_path(:sort_by=>session[:sort_by],:ratings=>session[:ratings])
  end

  def edit
    @movie = Movie.find params[:id]
  end

  def update
    @movie = Movie.find params[:id]
    @movie.update_attributes!(params[:movie])
    flash[:notice] = "#{@movie.title} was successfully updated."
    redirect_to movie_path(@movie)
  end

  def destroy
    @movie = Movie.find(params[:id])
    @movie.destroy
    flash[:notice] = "Movie '#{@movie.title}' deleted."
    redirect_to movies_path
  end

end
