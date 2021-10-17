# %%
# %%
import numpy as np
import matplotlib.pyplot as plt
# %%
# 10 points, starting at 0 and ending at 2PI or 6.28ish
x = np.linspace(0, 2 * np.pi, 10)
print(x)
# %%
y = np.sin(x)
print(y)
# %%
plt.plot(x, y)
# %%
resolution = 100
frequency = 2
x = np.linspace(0, 2 * np.pi, resolution)
y = np.sin(x * frequency)
plt.plot(x, y)
# %%
y1 = np.sin(x * 6)
y2 = np.sin(x * 9)
plt.plot(x, y1 + y2)
# %%
