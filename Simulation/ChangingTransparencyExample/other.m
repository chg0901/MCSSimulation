%% Transparency for Individual Patches
% The transparency of a patch is defined by its |FaceAlpha| and |FaceVertexAlphaData| 
% properties. For constant transparency across the entire patch, set the |FaceVertexAlphaData| 
% to a constant between 0 (fully transparent) and 1 (fully opaque), and set the 
% |FaceAlpha| property to |'flat'|.

cla
p1 = patch(x,y,'r');             % make a red circular patch
axis square tight                % set axis to square

p1.FaceVertexAlphaData = 0.2;    % Set constant transparency 
p1.FaceAlpha = 'flat' ;          % Interpolate to find face transparency
%% 
% For transparency that varies across the patch, set the |FaceVertexAlphaData| 
% to a matrix of values specifying the transparency at each vertex or each face 
% of the patch. The |FaceAlpha| property then indicates how the face transparencies 
% are determined using the |FaceVertexAlphaData|. If alpha data is specified for 
% vertices, |FaceAlpha| must be set to |'interp'|.

p1.FaceVertexAlphaData = x';   % Set vertex transparency to x values
p1.FaceAlpha = 'interp' ;      % Interpolate to find face transparency