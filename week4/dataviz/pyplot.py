# %%
import numpy as np
import matplotlib.pyplot as plt

# %%
x1 = [0.1, 0.2, 0.3, 0.4]
y1 = [0.5, 2.2, 3.2, 8.7]
x2 = [0.1, 0.2, 0.3, 0.4]
y2 = [1, 4, 9, 16]
# %%
plt.plot(x1, y1, label='first plot')
plt.plot(x2, y2, label='second plot')
plt.legend()
# %%
num = 100
x = np.linspace(0, 20, num)
print(x)
# %%
y = np.random.rand(num)
print(y)
# %%
plt.plot(x, y)
# %%
