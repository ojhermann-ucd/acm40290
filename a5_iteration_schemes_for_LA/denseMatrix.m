function [ val, col, rowstart, d ] = denseMatrix( A )
    % initialise vectors
    val = 0:0;
    col = 0:0;
    rowstart = 0:0;
    [rowSize, colSize] = size(A);
    
    % d
    [L, U, P] = lu(A);
     d = diag(diag(A));
    
    % val, col, rowstart
    for r = 1:rowSize
        for c = 1:colSize
            if A(r, c) ~= 0
                if val(1) == 0
                    val(1) = A(r,c);
                else
                    val = [val, A(r,c)];
                end
                if rowstart(1) == 0
                    rowstart(1) = r;
                else
                    if c < col(end)
                        rowstart = [rowstart, length(col) + 1];
                    end
                end
                if col(1) == 0
                    col(1) = c;
                else
                    col = [col, c];
                end
            end
        end
    end


    % return
    return
end

