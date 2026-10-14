# Package used in Reading and Displaying Data & Autocorrelation
import pandas as pd

# Package used in Stationarity
from statsmodels.tsa.stattools import adfuller

# Package used in Decomposition
from statsmodels.tsa.seasonal import seasonal_decompose

# Package used in Forecasting
from pmdarima.arima import auto_arima
from math import sqrt
from sklearn.metrics import mean_squared_error

#-------------------- 1. Reading and Displaying Data -----------------------------------#

# Reads the AirPassengers.csv file into a DataFrame
# Two version have been provided
# r-method with the Windows absolute path
# df = pd.read_csv(r"C:/Users/alb21/.vscode/vsc_documents/Data_Engineer_Academy_vsc_documents/Data_Engineer_Academy_Vending_Machine_Analysis_Project/Built_In_A_Guide_to_Time_Series_Analysis_with_Python_Project_Files/AirPassengers.csv")

# Relative path method
df = pd.read_csv("./Built_In_A_Guide_to_Time_Series_Analysis_with_Python_Project_Files/AirPassengers.csv")

# Prints the first 5 records in the DataFrame
# print(df.head())

# Prints the last 5 records in the DataFrame
# print(df.tail())

# Convert the "Month" Series column in the DataFrame to datetime
df['Month'] = pd.to_datetime(df['Month'], format='%Y-%m')
# print(df.head())

# Convert the "Month" column to the DataFrame index
df.index = df['Month']
del df['Month']
# print(df.head())

# Import Matplotlib and Seaborn
# These will be used to visualize the time series data

import matplotlib.pyplot as plt
import seaborn as sns

# Generate a lineplot with the DataFrame data using Seaborn
# sns.lineplot(df)

# Re-label the y-axis
# plt.ylabel("Number of Passengers")

# Show plot
# plt.show()

#--------------------------------------------------------------------------------------#

#-------------------------------- 2. Stationarity -------------------------------------#

# Calculate the 7 month rolling mean and standard deviation
rolling_mean = df.rolling(7).mean()
rolling_std = df.rolling(7).std()

# Overlay time series 7-month rolling mean and standard deviation
# Create Matplotlib plot of time series data

# plt.plot(df, color='blue', label='Original Passenger Data')

# Create Matplotlib plot of the rolling mean
# plt.plot(rolling_mean, color='red', label='Rolling Mean Passenger Number')

# Create Matplotlib plot of the rolling standard deviation
# plt.plot(rolling_std, color='black', label='Rolling Standard Deviation Passenger Number')

# Create a title
# plt.title('Passenger Time Series, Rolling Mean, Standard Deviation')

# Create a legend
# plt.legend(loc='best')

# Show plot
# plt.show()

# Pass the DataFrame into the adfuller method
# "AIC" is passed into the method in order to 
# chose the lag to minimize information criterion

# adft = adfuller(df, autolag="AIC")

# Store results in a DataFrame to display it

# output_df = pd.DataFrame({"Values":[adft[0],adft[1],adft[2],adft[3], adft[4]['1%'], adft[4]['5%'], adft[4]['10%']]  , "Metric":["Test Statistics","p-value","No. of lags used","Number of observations used", 
#                                                         "critical value (1%)", "critical value (5%)", "critical value (10%)"]})

#print(output_df)

#--------------------------------------- 3. Autocorrelation ---------------------------------------------#

# Calculate the 1-month lag & print the result
# autocorrelation_lag1 = df['#Passengers'].autocorr(lag=1)
# print("One Month Lag: ", autocorrelation_lag1)

# Calculate the 3-month lag & print the result
# autocorrelation_lag3 = df['#Passengers'].autocorr(lag=3)
# print("Three Month Lag: ", autocorrelation_lag3)

# Calculate the 6-month lag & print the result
# autocorrelation_lag6 = df['#Passengers'].autocorr(lag=6)
# print("Six Month Lag: ", autocorrelation_lag6)

# Calculate the 9-month lag & print the result
# autocorrelation_lag9 = df['#Passengers'].autocorr(lag=9)
# print("Nine Month Lag: ", autocorrelation_lag9)

#--------------------------------------- 4. Decomposition ---------------------------------------------#

# Create the decomposition: Pass the DataFrame into the seasonal_decompose() method
# decompose = seasonal_decompose(df['#Passengers'], model='additive', period=7)

# Create a plot of the decomposition
# decompose.plot()

# Display the plot
# plt.show()

#--------------------------------------- 5. Forecasting ---------------------------------------------#

# Split the data for training and testing & Visualize the split
df['Date'] = df.index

train = df[df['Date'] < pd.to_datetime("1960-08", format="%Y-%m")]

train['train'] = train['#Passengers']

del train['Date']

del train['#Passengers']

test = df[df['Date'] >= pd.to_datetime("1960-08", format="%Y-%m")]

del test['Date']

test['test'] = test['#Passengers']

del test['#Passengers']

plt.plot(train, color='black')

plt.plot(test, color='red')

plt.title("Train/Test split for Passenger Data")

plt.ylabel("Passenger Number")

plt.xlabel("Year-Month")

sns.set()

# plt.show()

# Train our model and generate predictions

model = auto_arima(train, trace=True, error_action='ignore', suppress_warnings=True)

model.fit(train)

forecast = model.predict(n_periods=len(test))

forecast = pd.DataFrame(forecast, index=test.index, columns=['Prediction'])

# Change the test plot color to orange

plt.plot(train, color='blue', label='Train')

plt.plot(test, color='orange', label='Test')

plt.plot(forecast, color='green', label='Prediction')

plt.title("#Passenger Prediction")

plt.ylabel("Actual #Passenger")

plt.xlabel("Date")

plt.legend()

plt.show()

rms = sqrt(mean_squared_error(test, forecast))

print("RMSE: ", rms)