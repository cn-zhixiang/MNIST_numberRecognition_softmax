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
## @deftypefn {Function File} {@var{retval} =} loadData (@var{input1}, @var{input2})
##
## @seealso{}
## @end deftypefn

## Author: 王志翔 <wangzhixiang@wangzhixiangdeMacBook-Air.local>
## Created: 2016-11-29

function [data label] = loadData(flag)

%flag 不等于0即加载训练数据，等于0即加载测试数据
if flag~=0
  fprintf('Loading training data...\n');
  data_handle = fopen('MNIST/train-images-idx3-ubyte', 'r');
  data_handle_l = fopen('MNIST/train-labels-idx1-ubyte', 'r');
else
  fprintf('Loading test data...\n');
  data_handle = fopen('MNIST/t10k-images-idx3-ubyte','r');
  data_handle_l = fopen('MNIST/t10k-labels-idx1-ubyte','r');
end

num_info = fread(data_handle, 16, 'uint8');
num_info_l = fread(data_handle_l, 8, 'uint8');

num_magic = (((num_info(1)*256+num_info(2))*256+num_info(3))*256)+num_info(4);
num_images = (((num_info(5)*256+num_info(6))*256+num_info(7))*256)+num_info(8);
num_rows = (((num_info(9)*256+num_info(10))*256+num_info(11))*256)+num_info(12);
num_cols = (((num_info(13)*256+num_info(14))*256+num_info(15))*256)+num_info(16);

%data=fread(data_handle, [2 num_rows*num_cols],'uint8');
%imshow(reshape(data(2,:), [28 28])');，记得加转置
data = fread(data_handle, [num_rows*num_cols num_images], 'uint8=>double')';
label = fread(data_handle_l, num_images, 'uint8=>double');

data=data/255;

fclose(data_handle);
fclose(data_handle_l);

if flag~=0
  fprintf('Training data loaded...\n');
else
  fprintf('Test data loaded...\n');
end

endfunction
