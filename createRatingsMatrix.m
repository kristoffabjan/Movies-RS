function matrix = createRatingsMatrix(ratings)
    m = max(ratings{1});
    n = max(ratings{2});
    matrix = zeros(m, n);
    
    for i = 1:length(ratings{1})
        row = ratings{1}(i);
        col = ratings{2}(i);
        score = ratings{3}(i);
        
        matrix(row, col) = score;
    end
end