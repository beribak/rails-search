class MoviesController < ApplicationController

    def index 
        PgSearch::Multisearch.rebuild(Movie)
        PgSearch::Multisearch.rebuild(TvShow)
        @query = params[:query]
        if params[:query].present?
            # PG multisearch
            @movies = PgSearch.multisearch(params[:query])

            # PG search scope
            # @movies = Movie.search_movies(params[:query])
            
            # SQL querys
            # @movies = Movie.all.joins(:director).where('title @@ ? OR synopsis @@ ? OR directors.first_name @@ ? OR directors.last_name @@ ?',
            #           "%#{params[:query]}%", "%#{params[:query]}%", "%#{params[:query]}%", "%#{params[:query]}%")
        else
            @movies = Movie.all + TvShow.all
        end
    end
end
