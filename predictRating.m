function prediction = predictRating(user,movie, matrix, n)
    % Find n similar users.
    %n*2 matrix of most similar users
    users = findSimilarUsers(user, matrix, n);
    
    %ratings of all similar users for that #movie
    r = matrix(users(:,1), movie);
    %similarity of our #user to all other similar users
    s = users(:,2);

    % We have to eliminate all users that have 0-rating for the movie.
    mask = r > 0;

    % Compute the prediciton.
    prediction = sum(r .* s) / sum(s .* mask);
end

