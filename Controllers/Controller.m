classdef Controller < handle
    %Controller is a memoryless controller
    %
    %   Controller methods:
    %
    %   computeInput - (Abstract) see help Controller.computeInput
    %
    
    % This file is part of VirtualArena.
    %
    % Copyright (C) 2012-14 Andrea Alessandretti
    %
    % andrea.alessandretti@{ist.utl.pt, epfl.ch}
    % Automatic Control Laboratory, EPFL, Lausanne, Switzerland.
    % Institute System and Robotics, IST, Lisbon, Portugal.
    %
    % This program is free software: you can redistribute it and/or modify
    % it under the terms of the GNU General Public License as published by
    % the Free Software Foundation, either version 3 of the License, or
    % (at your option) any later version.
    %
    % This program is distributed in the hope that it will be useful,
    % but WITHOUT ANY WARRANTY; without even the implied warranty of
    % MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    % GNU General Public License for more details.
    %
    % You should have received a copy of the GNU General Public License
    % along with this program.  If not, see <http://www.gnu.org/licenses/>.
    
    methods(Abstract, Static)
        
        %computeInput
        %
        %      u = computeInput(obj,x,t)
        %
        %   x - state of the system
        %   t - time/step number
        %   u - control input
        %
        %      u = computeInput(obj,x,t,readings)
        %
        %   readings{i}{j} - jth sensor reading of the ith neighborhood of
        %   the system in the network defined in the VirtualArena
        %
        %   See also VirtualArena
        computeInput
        
    end
    
    
end