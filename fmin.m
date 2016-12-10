## Copyright (C) 2016 王志翔
## 
## This program is free software; you can redistribute it and/or modify it
## under the terms of the GNU General Public License as published by
## the Free Software Foundation; either version 3 of the License, or
## (at your option) any later version.
## 
## This program is distributed in the hope that it will be useful,
## but WITHOUT ANY WARRANTY; without even the implied warranty of
## MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
## GNU General Public License for more details.
## 
## You should have received a copy of the GNU General Public License
## along with this program.  If not, see <http://www.gnu.org/licenses/>.

## -*- texinfo -*- 
## @deftypefn {Function File} {@var{retval} =} fmin (@var{input1}, @var{input2})
##
## @seealso
## @end deftypefn

## Author: 王志翔 <wangzhixiang@wangzhixiangdeMacBook-Air.local>
## Created: 2016-12-02

function [theta] = fmin(X, y, lambda)

[m n] = size(X);
k=10;
theta = zeros(n+1,10);

num_iter = 50;
for i=1:num_iter
  [J grad] = lrCostFunction(theta, X, y, lambda);
  fprintf(1,'J now is %f\n',J);
  theta = theta - grad;
end

endfunction
