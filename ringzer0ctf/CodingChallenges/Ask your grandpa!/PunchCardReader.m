% Read image
card = imread('card.jpg', 'jpg');


[x, y, z] = size(card);
card_bw = im2bw(card);  % Make image Black and White
card_bw = ~card_bw; % Invert One and Zero
% figure; imshow(card_bw);


% Initializing
count_x = zeros(x, 1);
count_y = zeros(1, y);


% Expected values for Pruning (Must change for each picture)
% Change values for each picture
% 
expected_count_x = 40;
expected_count_y = 50;
expected_cell_width = 40;
expected_cell_heigth = 20;


% Count blacks to find out rows and columns
for i = 1 : x
    count_x(i) = sum(card_bw(i, :) == 1); % Count blacks
    if ( count_x(i) < expected_count_x ) 
        count_x(i) = 0;
    end
end
for i = 1 : y
    count_y(i) = sum(card_bw(:, i) == 1); % Count blacks
    if ( count_y(i) < expected_count_y ) 
        count_y(i) = 0;
    end
end

% Pruning
for i = 2 : x
    if ( count_x(i-1) < expected_count_x && count_x(i) < expected_count_x)
        continue;        
    end
    if (count_x(i-1) > expected_count_x && count_x(i) > expected_count_x)
        continue;
    end
    if (count_x(i) == 0)
        continue;
    end
    usable = 0;
    for j = i : i + expected_cell_width
        if (j > x)
            break;
        end
        if (count_x(j) < expected_count_x)            
            usable = j;
        end
    end
    if (usable ~= 0)
        for j = i : usable
            count_x(j) = 0;
        end
    end
end
for i = 2 : y
    if ( count_y(i-1) < expected_count_y && count_y(i) < expected_count_y)
        continue;        
    end
    if (count_y(i-1) > expected_count_y && count_y(i) > expected_count_y)
        continue;
    end
    if (count_y(i) == 0)
        continue;
    end
    usable = 0;
    for j = i : i + expected_cell_heigth
        if (j > y)
            break;
        end
        if (count_y(j) < expected_count_y)            
            usable = j;
        end
    end
    if (usable ~= 0)
        for j = i : usable
            count_y(j) = 0;
        end
    end
end

% Plot rows and columns black count after pruning
% figure; plot(linspace(1,size(count_x,1),size(count_x,1)),count_x);
% figure; plot(linspace(1,size(count_y,2),size(count_y,2)),count_y);

% Initializing 
x_x = zeros(x, 1);
y_y = zeros(1, y);

% Put One in all row and columns
for i=1 : x
    if (count_x(i) > 0)
        x_x(i) = 1;
    end
end
for i=1 : y
    if (count_y(i) > 0)
        y_y(i) = 1;
    end
end


% Plot rows and columns
% figure; plot(linspace(1,size(x_x,1),size(x_x,1)),x_x);
% figure; plot(linspace(1,size(y_y,2),size(y_y,2)),y_y);

% Initializing
mat_x = zeros(x, y);
mat_y = zeros(x, y);

% Create a mask in each row or column
for i = 1 : x
    mat_x(i, :) = x_x(i);
end
for i = 1 : y
    mat_y(:, i) = y_y(i);
end

% Create a mask for punch card
mat = mat_x & mat_y;

% Show the mask
% figure; imshow(mat);

% We have rows and columns as you see
data = mat & card_bw;
% figure; imshow(data);

mask = [1 1 1; 1 1 1; 1 1 1];


res = zeros(12, 80); % Cards are at most 12*80

col_number = 0;
row_number = 0;
for j=2 : y % On the columns        
    col_start = 0;
    col_end = 0;
    if ( j <= col_end)
        continue;
    end
    if (sum(mat(:, j)) == 0) % Is not a column
        continue;
    end
    if (sum(mat(:, j-1)) == 0 && sum(mat(:, j)) > 0) % Column starts        
        col_number = col_number + 1;
        row_number = 0;
        
        col_start = j;
        for k = j+1 : y
            if (sum(mat(:, k-1)) > 0 && sum(mat(:, k)) == 0) % Column ends
                col_end = k ;
                break;
            end
        end
        col_middle = int32(col_start + (col_end - col_start) / 2);        
        
        row_start = 0;
        row_end = 0;
        for i = 1 : x % On the rows
            if( i <= row_end )
                continue;
            end
            if (mat(i, col_middle) == 0) % Is not a row
                continue;                
            else % Is row
                row_number = row_number + 1;
                
                row_start = i;
                for k = i + 1 : x
                    if(mat(k - 1, col_middle) == 1 && mat(k, col_middle) == 0) % Row ends
                        row_end = k;
                        break;
                    end
                end
                row_middle = int32(row_start + (row_end - row_start) / 2);                
                
                % Check if block exists
                if (data(row_middle - 1 : row_middle + 1, col_middle -1 : col_middle + 1) & mask == mask)
                    res(row_number, col_number) = 1;
                end
            end
        end
    end
end

clear mask data mat_x mat_y x_x y_y count_x count_y card card_bw expected_cell_heigth expected_cell_width expected_count_x expected_count_y
clear mat col_end col_middle col_start row_end row_middle row_start
clear usable i j k x y z
clear row_number col_number






[x, y] = size(res);
string = zeros(1, 80);

% Converting
for j= 1 : y
    if (sum(res(:, j)) == 1) % &-0123456789
        for i = 3 : x
            if (res(i, j) == 1)
                string(j) = i - 3  + '0';            
                break;
            end
        end
        if (res(1, j) == 1) % Y
            string(j) = '&' ;
        elseif (res(2, j) == 1) % X
            string(j) = '-' ;
        end        
    elseif (res(1, j) == 1) % ABCDEFGHI
        for i = 4 : x
            if (res(i, j) == 1)
                string(j) = i - 4 + 'A';
                break;
            end
        end
    elseif (res(2, j) == 1) % JKLMNOPQR
        for i = 4 : x
            if (res(i, j) == 1)
                string(j) = i - 4 + 'J';
                break;                                
            end
        end
    elseif (res(2, j) == 1) %/STUVWXYZ
        for i = 5 : x
            if (res(i, j) == 1)
                string(j) = i - 5 + 'S';
            end
        end
        if (res(4, j) == 1)
            string(j) = '/';
        end
    end
end



