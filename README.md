# MNIST_numberRecognition_softmax
基于 Softmax 回归对 MNIST 数据集的一个数字识别，IDE 为 Octave
MINST 数据集地址：http://yann.lecun.com/exdb/mnist/
项目采用了「矢量化编程」，循环相对较少

ex.m 是项目的执行文件，ex_pca.m 添加了 PCA，收敛速度更快\n
loadData.m 是加载数据的函数，参数为 0 时加载 test 数据，否则加载 training 数据；将MINST 数据集下载下来后，只要更改此函数里的文件名变量，即可运行
lrCostFunction.m 是代价函数，返回 J 和 J 对 θ 的导数
fmin.m 是求取参数的函数，通过 BGD 迭代 50 次，得到使 J 最小的 θ
predict.m 是预测函数，传入 test 样本集和 θ，得到 m*1 预测结果

最后打印出程序用时，Macbook Air (1.6GHz 双核 Intel Core i5)耗时约 80s

PCA主要是为了提高程序收敛速度，保留不同方差信息量时，对程序的影响统计如下
方差信息   准确率    投射维数
0.5 			40.8%		  3/784
0.75  		63.4%		  6/784
0.9			  72.3%	  	12/784
0.95		  85.3%	  	19/784
0.99		  88.3%		  42/784
0.995		  88.8%	  	56/784	
0.999		  89.195%	  103/784	
0.9999	  89.283%	  231/784
1         89.315%   784/784
