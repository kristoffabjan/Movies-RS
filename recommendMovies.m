function recommended_movies = recommendMovies(user, count, movies, ratings, n)
    
    %get matrix of all ratings 
    matrix = createRatingsMatrix(ratings);

    %get num of rows and cols in matrix - num of users and movies
    [users_count,movies_count] = size(matrix);

    %ids of non watched movies
    not_watched = [];
    %array of candidates(potential favorite movies)
    candidates = [];

    for i = 1:movies_count
        %if movie is not rated by user yet
        % for testing puroposes (speed) apply next case in next if : & i < 50
        if matrix(user, i) == 0 & i < 50
            %predicted rating for i-th movie for user
            predicted_rating = predictRating(user, i, matrix, n);
            %prevent NaN values
            if isnan(predicted_rating)
                continue
            end

            %new vector of movie id and predicted rating for it
            candidates = [ candidates [double(i) predicted_rating]' ];
        end
    end

    %sort candidates(sort by second row(rates))
    candidates_sorted = sortrows(candidates.',2, 'descend').';

    %ids of recommended movies(translation double->int)
    movie_ids = ceil(candidates_sorted(1, :));
    %names of recc movies
    movie_names = [];

    %append movie names to movie_names( movies as strings )
    for j=1:length(movie_ids)
        movie_names = [movie_names movies{2}(movie_ids(j)) ];
    end

    %return count(number) movie names in "most relavant first order"
    %make sure you have >= "count" movies, else return less
    if count <= length(movie_names)
        movie_names = movie_names(1:count);
    end

    recommended_movies = movie_names;
end

