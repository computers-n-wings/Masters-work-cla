import numpy as np

# LU Decomposition
def LU(A):
	n = len(A)
	for i in xrange(n):
		print np.argmax(abs(A[i,:]))
	# 	for j in xrange(n):
	# 		if j >= i:
	# 			A[i, j] -= np.dot(A[i, xrange(i)], A[xrange(i), i])
	# 		else:
	# 			A[i,j] = (A[i,j] - np.dot(A[i, xrange(j)], A[xrange(j), j])) / A[j,j]
	# print A

A = np.matrix([[0., -1., 0., 0.,],[-1., 4., -1., 0.], [0., -1., 4., -1.],[0., 0., -1., 4.]])
# print(A)
LU(A)