% user1 and user2 are two rows from the 'ratings' matrix.
function similarity = userSimilarity(user1,user2)
    % We have to get rid of the movies, which are missing
    % the rating from one or the other user.
    mask = (user1 .* user2) > 0;
    ratings1 = user1 .* mask;
    ratings2 = user2 .* mask;

    % We use the formula
    % similarity =
    % cos((ratings1, ratings2)) = (ratings1 * ratings2) / (|reatings1| * |ratings2|)
    dotnorm = norm(ratings1) * norm(ratings2);
    if dotnorm > 0
        similarity = dot(ratings1, ratings2) / dotnorm;
    else
        % In fact, we should not assign it any value, but in our case
        % assigning zero is virtually like ignoring it later in the
        % process.
        similarity = 0;
    end
end

