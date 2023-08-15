function [colormap_data] = scale_ct(range,num_colors, keyword)
%SCALE_CT function linearly scales a color table according to a given range 
% with color white centered to zero. This colortable is useful for data 
% which spans across positive and negative values, but is not centered 
% on zero
%
%Data must be loaded as vector [data_minimum, data_maximum]
%
%The returned color map data is a 3x256 element rbg vector scaled between
% 0-1
%
%The function will automatically use a blue to red scale if other color
%scales are not set
%
%Written by Frances Staples on 3rd May 2023



switch keyword    
    case 'PuOr'
        cbmax=[179,88,6];
        cbmin=[45 0 75];
    case'PrGn'
        cbmax=[64 0 75];
        cbmin=[0 68 27];
    case'PiGn'
        cbmax=[142 1 82];
        cbmin=[39 100 25];
    otherwise
        %automatically use blue-white-red
        cbmax=[103 0 31];
        cbmin=[5 48 97];
end    

% Calculate the center index for the colormap
center_idx = round((num_colors-1) * abs(range(1)) / (abs(range(1)) + abs(range(2))));

% Create a two scales for min/max colors
min2white = [linspace(cbmin(1),247,center_idx); linspace(cbmin(2),247,center_idx); linspace(cbmin(3),247,center_idx)];
white2max=[linspace(246,cbmax(1),num_colors-center_idx); linspace(246,cbmax(2),num_colors-center_idx); linspace(247,cbmax(3),num_colors-center_idx)];

%combine scales into one colorbar with white in middle
colormap_data=(horzcat(min2white,white2max)')/255;


