%ratings
file = fopen("ratings.csv");
ratings = textscan(file, "%d %d %f %d", "delimiter", ",", "headerlines", 1);
% % fclose(file);

%movies
movies_file = fopen('movies.csv');
movies = textscan(movies_file, "%d %q %s", 'Delimiter', ',', 'HeaderLines', 1);
fclose(movies_file);

%matrix = createRatingsMatrix(ratings);

%prediction = predictRating(5, 1, matrix, 100);
%ratings;

%user, count, movies(raw movies 1X3 cell), ratings(raw ratings 1x4 cell), n
%recommendedMovies = recommendMovies(6, 5, movies, ratings, 150)


%Measure the errors for 10 different values of n. 
% Draw a plot showing how the errors change with n. The plot
%should visualize the errors of your prediction algorithm and 
% random predictor. Write your interpretation of the results.

%size of different n inputs
array_len = 10;
sample_size = 10;
%arrays to save the values in- using prealocation of space so we get some
%speedup
mae_arr = zeros(1, array_len);
rmse_arr = zeros(1, array_len);
rnd_mae_arr = zeros(1, array_len);
rnd_rmse_arr = zeros(1, array_len);
n_arr = zeros(1, array_len);

%loop #array_len times
for n=1:array_len
    %get measure errors for certain n and samplesize
    [mae, rmse, rnd_mae, rnd_rmse] = measureErrors(ratings, sample_size, n*10);
    %insert results into corresponding arrays
    mae_arr(n) = mae;
    rmse_arr(n) = rmse;
    rnd_mae_arr(n) = rnd_mae;
    rnd_rmse_arr(n) = rnd_rmse;
    n_arr(n) = n*10;
end

%plot results
plot(n_arr,mae_arr)

%draw more matrices in one plot
hold on
plot(n_arr,rmse_arr)
plot(n_arr,rnd_mae_arr)
plot(n_arr,rnd_rmse_arr)
hold off

%RESULTS
%As we can see on the graph, accuracy of our CF algorithm is better
%than the accuracy of random predictor. Accuracy also improves for higher n
%since we compare more users

