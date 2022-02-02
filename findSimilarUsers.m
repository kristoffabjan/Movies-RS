% We return two-column array.
% COL1: User ID (row index in the ratings matrix).
% COL2: Similarity distance between the given user and the array user.
function users = findSimilarUsers(user, matrix, n)
    % We get the user ID, we need its ratings.
    ratings = matrix(user,:);

    % Create the returned 2-dimensional array.
    %num of users
    userCount = size(matrix, 1);
    %array of users with free space to add similarity to our #user
    users = zeros(userCount, 2);

    % Fill up the array. Iterate through all users.
    for i = 1:userCount
        ratings1 = matrix(i, :); % The ratings of the user we are considering.
        users(i, 1) = i;
        %similarity between current iterable user and #user
        users(i, 2) = userSimilarity(ratings, ratings1);
    end

    % Let's remove the given user, so it is not returned as the part of the
    % answer.
    users(user, :) = [];

    % Now get n most similar users.
    users = sortrows(users, 2, "descend");
    users = users(1:n,:);
end

