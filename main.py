import os 
import numpy as np # linear algebra
import pandas as pd # data processing, CSV file I/O (e.g. pd.read_csv)
import matplotlib.pyplot as plt

plt.style.use('ggplot')


def plot_from_log():
    JANELA = 10

    data_ts = pd.read_csv('data_ping'+'.csv', 
                        index_col=[0], 
                        parse_dates=[0])

    #data_ts = data_ts.drop("icmp_seq", axis=1)	
    MA = data_ts['pack'].rolling(window=JANELA).mean()
    tmean = np.mean(data_ts['pack'])

    print(data_ts.head())

    plt.figure(figsize=(15,8))
    plt.plot(data_ts['pack'], label='Ping')
    plt.plot(MA, label='MA')
    plt.title(f'Ping total mean: {tmean:.2f}')
    plt.legend()
    plt.show()


if __name__ == '__main__':
    plot_from_log()
