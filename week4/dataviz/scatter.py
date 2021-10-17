# %%
import numpy as np
import matplotlib.pyplot as plt
# %%
num = 20
# two-dimensional data array
data = np.random.rand(4, num)
print(data)
# %%
plt.scatter(data[0], data[1], c=data[2], s=data[3]*1000, alpha=0.3, cmap='viridis')
plt.colorbar()  # show color scale
# %%
num = 500
data = np.random.rand(num, num)
plt.imshow(data, cmap='binary')
plt.colorbar()
# %%
