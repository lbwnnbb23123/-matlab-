clc;
clear;

%----------------------OPENING FILES----------------------%

fin2 = fopen('CNT-5,5.xyz.txt', 'r');
foutDistances = fopen('CNT-5,5-Distances.txt', 'w');

%----------------------GET INTERATOMIC DISTANCES----------------------%   

line = textscan(fin2,'%s','delimiter','\n');
num_lines = length(line{1});

Distance_List = [];
line_num = 0;
position = 1;

for i = 1:(num_lines-1)
    [nr,nc]=size(strsplit(char(line{1}(i))));
    line_num = line_num + 1;
    if nc == 4
        %line1 = line{1}(i)
        
        line1 = cell2mat(line{1}(i));
        line1 = strsplit(line1);
        Atom1 = [str2num(cell2mat((line1(1,2)))), str2num(cell2mat((line1(1,3)))), str2num(cell2mat((line1(1,4))))];
        for j = (line_num+1):num_lines
            line2 = cell2mat(line{1}(j));
            line2 = strsplit(line2);
            Atom2 = [str2num(cell2mat((line2(1,2)))), str2num(cell2mat((line2(1,3)))), str2num(cell2mat((line2(1,4))))];
            distance = sqrt((Atom1(1,1)-Atom2(1,1))^2 + (Atom1(1,2)-Atom2(1,2))^2 + (Atom1(1,3)-Atom2(1,3))^2);
            Distance_List = [Distance_List, distance];
            fprintf(foutDistances,'%f \r\n', distance);
        end
    end
end


%----------------------CALCULATING STRUCTURE FACTOR AND DEBYE
%FUNCTION----------------------%
%Calculate structure factor (scattering factor) and the debye function. 
%The calculation should be done for a range of scattering parameters, e.g. 0.1-1.
%Store the values of the normalized intensty in a vector to plot it later.





%----------------------PLOTTING I/I0 AGAINST SCATTERING PARAMETER----------------------%
%Plot normalized intensity as a function of the scattering parameter. 
%The axes should also be titled correctly to indicate what they represent.





%----------------------CLOSING FILES----------------------#

fclose(fin2);
fclose(foutDistances);
fprintf("Complete! \n")


%End of the program




