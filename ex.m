clear;  %清除工作空间的所有变量 
clc;  %清除 command line
close all;

start_time = time;

[X y] = loadData(1);  % X 已缩放到0~1
[m n] = size(X);

%计算出theta
theta = fmin(X, y, 0.1);

%加载测试数据，并测试
[X_t y_t] = loadData(0);

pred = predict(theta, X);
fprintf('Training Set Accuracy: %f\n',mean(double(pred==y))*100);

pred_t = predict(theta, X_t);
fprintf('Test Set Accuracy: %f\n',mean(double(pred_t==y_t))*100);

end_time = time;
diff = end_time-start_time;
fprintf('Training took %.2f seconds\n', diff);
fprintf('Program paused. Press enter to continue.\n');
pause;