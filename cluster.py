import numpy as np
import matplotlib.pyplot as plt
import sklearn.cluster
import cv2

cell = cv2.imread("A00_01.bmp")
b, g, r = cv2.split(cell)

data = np.array([r,g,b])
print(data.shape)

plt.figure(figsize=(12, 12))
plt.imshow(np.dstack(data))



samples = data.reshape((3, -1)).T
clf = sklearn.cluster.KMeans(n_clusters=7)
labels = clf.fit_predict(samples)
print(labels)

plt.figure(figsize=(12, 12))
plt.imshow(labels.reshape((2084, 2084)), cmap="Set3")

##x =np.zeros((4343056,))
##x[np.where( labels == 2 )] = 1
##plt.imshow(x.reshape((2084, 2084)))
plt.show()
