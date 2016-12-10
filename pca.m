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
## @deftypefn {Function File} {@var{retval} =} pca (@var{input1}, @var{input2})
##
## @seealso{}
## @end deftypefn

## Author: 王志翔 <wangzhixiang@wangzhixiangdeMacBook-Air.local>
## Created: 2016-12-10

function [X_pca] = pca(X, rate)

[m n] = size(X);

%预处理
mu = mean(X, 1);
X_zero_mu = X - repmat(mu, m, 1);

sigma = 1/m* X_zero_mu'*X_zero_mu;
[U S V] = svd(sigma);
sigma = S.*S;

%求总方差
sum_var = sum(sum(sigma));
sum_current = sum_var;

k = n;
for i = n:-1:2 ;
  rate_1 = sum_current/sum_var;
  sum_current = sum_current - sigma(i,i);
  rate_2 = sum_current/sum_var;
  if rate_1 >= rate && rate_2 <= rate
    k=i;
    break;
  end  
end

fprintf('k/n for rate:%.2f%% is %d / %d...\n', rate*100, k, n);

%降维到 k
X_pca = X*U(:,1:k);

endfunction
