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
## @deftypefn {Function File} {@var{retval} =} gradientCheck (@var{input1}, @var{input2})
##
## @seealso{}
## @end deftypefn

## Author: 王志翔 <wangzhixiang@wangzhixiangdeMacBook-Air.local>
## Created: 2016-12-05

%注意，因为梯度检验算法非常耗时而且稀疏，故只计算了一部分梯度，但因为采用了向量化编程，所以部分梯度正确可以视为其余梯度也正确
function [grad_check grad rate] = gradientCheck(epsilon)
start_time = time;

[X y]=loadData(0);
lambda = 0.1;
[m n] = size(X);
k=10;

grad_check = zeros(n+1,k);
theta_init = fmin(X, y, lambda);

for i=(n-20):n
  for j=1:k
    theta_p = theta_init;
    theta_p(i,j) = theta_p(i,j)+epsilon;
    [J_p temp] = lrCostFunction(theta_p, X, y, lambda);
    
    theta_d = theta_init;
    theta_d(i,j) = theta_d(i,j)-epsilon;
    [J_d temp] = lrCostFunction(theta_d, X, y, lambda);
    
    grad_check(i,j) = (J_p-J_d)/(2*epsilon);
  end
end

diff = time-start_time;
fprintf('Check took %.2f seconds...',diff);

[J grad] = lrCostFunction (theta_init, X, y, lambda);

number_small = 0.1^10;
rate = (grad_check+number_small)./(grad+number_small);

endfunction
