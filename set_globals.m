function set_globals()
% Set Globaç Variables

global Jdd Jll Jdl JdM JlM
global lamda_area target_area target_perimeter lamda_perimeter T
global ES k boundary_size_x boundary_size_y N M size_latt_i size_latt_j num_types cell_side neighbourhood_size
global adhesion_flag area_flag perimeter_flag

N = 50; 
M = 50;
ES = N*M;
num_types = 2;
lamda_area = 1;
lamda_perimeter = 1;
cell_side = 5;
% target_area = 40;
target_area = cell_side^2;
target_perimeter = 2*sqrt(target_area/pi)*pi; % circular cells
boundary_size_x = 20;
boundary_size_y = 20;
neighbourhood_size = 4;
adhesion_flag = 1;
area_flag = 1;
perimeter_flag = 1;

end
