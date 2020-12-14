%% Cellular Potts Model Simulation
%  Version 3
%  4/1/2014

clear all
clc
close all

%% Parameters

global Jdd Jll Jdl JdM JlM
global lamda_area target_area target_perimeter lamda_perimeter T
global ES k boundary_size_x boundary_size_y N M size_latt_i size_latt_j num_types cell_side neighbourhood_size
global adhesion_flag area_flag perimeter_flag

set_globals();

%% Create Lattice

type = 'square';
initial_lattice = create_lattice(type);
size_latt_i = size(initial_lattice.spins,1); 
size_latt_j = size(initial_lattice.spins,2);

figure,imshow(initial_lattice.spins,[])

%% Pattern Equilibration

% Variables:
JlM = 8;
Jll = 2;
T = 5;
EqS = 50;
adhesion_flag = 1;
area_flag = 0;
perimeter_flag = 1;

boundary_length = zeros(1,EqS);
cell_medium_boundary = zeros(1,EqS);
mean_num_sides = zeros(1,EqS);
miu_2 = zeros(1,EqS);
miu_3 = zeros(1,EqS);
miu_4 = zeros(1,EqS);
eq_lattice = initial_lattice;

disp('Equilibration:   ')

for i = 1:EqS
    [eq_lattice,energy] = equilibration(eq_lattice,T,Jll,JlM);
    param = pattern_param(eq_lattice.spins);
    boundary_length(i) = param.boundary_length;
    cell_medium_boundary(i) = param.cell_medium_boundary;
    mean_num_sides(i) = param.mean_num_sides;
    miu_2(i) = param.miu_2;
    miu_3(i) = param.miu_3;
    miu_4(i) = param.miu_4;
    disp([num2str(i) '. '])
end
eq = 0;
figure,plot(boundary_length)
figure,plot(cell_medium_boundary)
figure,plot(mean_num_sides)
figure,plot(miu_2)
figure,plot(miu_3)
figure,plot(miu_4)
figure,imshow(eq_lattice.spins,[])

%Draw boundary
boundary = draw_boundary(initial_lattice.spins);
cells = initial_lattice.types; cells(boundary) = 0;
figure,imshow(cells,[])

% save('eq_lattice_50mcs.mat','eq_lattice')

%% Annealing

% Variables:
AS = 10;
Jll = 2;
JlM = 8;
T = 0;
adhesion_flag = 1; 
area_flag = 0; 
perimeter_flag = 1;
    
disp('Annealing:   ')
for i = 1:AS
    [annealed_lattice,energy] = annealing(eq_lattice);
    disp([num2str(i) '. '])
end

%Draw boundary
boundary = draw_boundary(annealed_lattice.spins);
cells = annealed_lattice.types; cells(boundary) = 0;
figure,imshow(cells,[])

%% Assign Types

num_cells = length(unique(annealed_lattice.spins));
initial_lattice = assign_types(annealed_lattice,num_cells);

figure,imshow(initial_lattice.types,[])
%Draw boundary
boundary = draw_boundary(initial_lattice.spins);
cells = initial_lattice.types; cells(boundary) = 0;
figure,imshow(cells,[])

%% Monte Carlo Steps

% Variables:
MCS = 1000;
energy_history = zeros(1,MCS); lattice_history = [];
Jdd = 2;
Jll = 14;
Jdl = 11;
JlM = 16;
JdM = 16;
T = 10;
lattice = initial_lattice;
adhesion_flag = 1; 
area_flag = 1; 
perimeter_flag = 1;

disp('Cell sorting:   ')
% Monte Carlo Steps
for i = 1:MCS
    [lattice,energy] = MC_step(lattice);
%     energy_history(i) = energy;
    lattice_history = cat(3,lattice_history,lattice);
    disp([num2str(i) '. '])
end

% Draw boundary
boundary = draw_boundary(lattice.spins);
cells = lattice.types; cells(boundary) = 0;
figure,imshow(cells,[])
