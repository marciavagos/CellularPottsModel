function [neighbour_i neighbour_j] = pick_neighbour(cell_i,cell_j)
% [neighbour_i neighbour_j] = pick_neighbour(cell_i,cell_j)

neighbour = randi(8);
    switch neighbour
        case 1
            neighbour_i=cell_i-1; neighbour_j=cell_j-1;
        case 2
            neighbour_i=cell_i-1; neighbour_j=cell_j;
        case 3
            neighbour_i=cell_i-1; neighbour_j=cell_j+1;
        case 4
            neighbour_i=cell_i; neighbour_j=cell_j-1;
        case 5
            neighbour_i=cell_i; neighbour_j=cell_j+1;
        case 6
            neighbour_i=cell_i+1; neighbour_j=cell_j-1;
        case 7
            neighbour_i=cell_i+1; neighbour_j=cell_j;
        case 8
            neighbour_i=cell_i+1; neighbour_j=cell_j+1;
    end

end