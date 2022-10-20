import random
import numpy as np
import cv2
from PIL import Image


img = Image.open("memesCE.jpg") 
img.load() 
data = np.asarray( img, dtype="int32" ) 
print(len(data))
print(len(data[0]))
anch=len(data[0])
alt=len(data)
img1 = np.zeros((alt,anch,3),np.uint8)
r = 25
g = 255
b = 25
v = [b,g,r]
vS = np.multiply(v, 1/(alt+1))

# recorremos cada uno de los elementos
for x in range(alt):
    for y in range(anch):
        img1[x,y] = np.multiply(data[x,y], (1-0.6)) + np.multiply(v, 0.6)
    v = v - vS

cv2.imwrite("OutputImage.png",img1)
cv2.imshow('Imagen',img1)
cv2.waitKey(0)
cv2.destroyAllWindows()
