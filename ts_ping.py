import numpy as np # linear algebra
import pandas as pd # data processing, CSV file I/O (e.g. pd.read_csv)
import os

import matplotlib.pyplot as plt
plt.style.use('ggplot')

data_ts = pd.read_csv('time_respost'+'.csv',index_col=[0], parse_dates=[0])

data_ts = data_ts.drop("icmp_seq", axis=1)

print(data_ts.head())

data_ts.to_csv("time_respost_pro.csv", index=True, encoding='utf8')

data_ts.plot(figsize=(12,4))
plt.show()
