function [sky] = sky_colormap()
    nucol=256;
    sky = ones(256, 3);
    sky(:,1) = linspace(1, 0, 256);
    sky(:,2) = linspace(1, 0, 256);
end

