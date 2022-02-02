% ratings - raw databse from the file 'ratings.csv'.
function [mae, rmse, rnd_mae, rnd_rmse] = measureErrors(ratings, sampleSize, n)
    matrix = createRatingsMatrix(ratings);
    mae = 0;
    rmse = 0;
    rnd_mae = 0;
    rnd_rmse = 0;
    count = 0;
    while count < sampleSize
        idx = randi(length(ratings{1})); % Random index
        
        s = ratings{3}(idx);
        user = ratings{1}(idx);
        movie = ratings{2}(idx);
        p = predictRating(user, movie, matrix, n);
        rs = randi(5);  % Random score
        if p > 0 % Did we get a legal value (Skips Nan).
            mae = mae + abs(p - s);
            rnd_mae = rnd_mae + abs(rs - s);
            rmse = rmse + (p - s)^2;
            rnd_rmse = rnd_rmse + (rs - s)^2;
            count = count + 1;
        end
    end
    mae = mae / sampleSize;
    rnd_mae = rnd_mae / sampleSize;
    rmse = sqrt(rmse / sampleSize);
    rnd_rmse = sqrt(rnd_rmse / sampleSize);
end

