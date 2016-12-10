clear;  %清除工作空间的所有变量 
clc;  %清除 command line
close all;


[X y] = loadData(1);  % X 已缩放到0~1
[X_t y_t] = loadData(0);
[m n] = size(X);

start_time = time;
% PCA 变换
X_pca = pca([X; X_t], 1);
X = X_pca(1:m,:);
X_t = X_pca(m+1:end,:);
pca_time = time;

%计算出theta
theta = fmin(X, y, 0.1);

%计算 training 数据集和 test 数据集的准确率
pred = predict(theta, X);
fprintf('Training Set Accuracy: %f\n',mean(double(pred==y))*100);

pred_t = predict(theta, X_t);
fprintf('Test Set Accuracy: %f\n',mean(double(pred_t==y_t))*100);

end_time = time;

diff = pca_time - start_time;
fprintf('PCA took %.2f seconds\n', diff);
diff = end_time-pca_time;
fprintf('Training took %.2f seconds\n', diff);
fprintf('Program paused. Press enter to continue.\n');
pause;