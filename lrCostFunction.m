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
## @deftypefn {Function File} {@var{retval} =} lrCostFunction (@var{input1}, @var{input2})
##
## @seealso{}
## @end deftypefn

## Author: 王志翔 <wangzhixiang@wangzhixiangdeMacBook-Air.local>
## Created: 2016-11-30

function [J, grad] = lrCostFunction (theta, X, y, lambda)

%theta 大小为(n+1)*10, X 大小为 m*n, y 大小为 m*1
[m n] = size(X);
k=10;

grad = zeros(n+1,k);
X = [ones(m,1) X];

% h 为预测得到的概率
h = e.^(X*theta);
h_sum = sum(h,2);
h = h./repmat(h_sum,[1 k]);

idx = y*m+[1:m]';
J = -1/m*sum(log(h(idx))) + 0.5*lambda/m*sum(sum(theta(2:end,:).^2));

%grad 大小为(n+1)*10
l = (repmat(y,[1,k]) == repmat([0:k-1], [m,1]));
grad(1, :) = -1/m*X(:,1)'*(l-h);
grad(2:end, :) = -1/m*X(:,2:end)'*(l-h) + lambda/m*theta(2:end,:);

endfunction
