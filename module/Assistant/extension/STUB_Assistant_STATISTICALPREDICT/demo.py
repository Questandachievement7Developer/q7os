import csv
import numpy as np
from sklearn.svm import SVR
import matplotlib.pyplot as plt


plt.switch_backend('GTK3cairo')



datum = []
prices = []

def get_data(filename):
	with open(filename, 'r') as csvfile:
		csvFileReader = csv.reader(csvfile)
		next(csvFileReader)	# skipping column names
		for row in csvFileReader:
			datum.append(int(row[0].split('-')[0]))
			prices.append(float(row[1]))
	return

def predict_price(datum, prices, x):
	datum = np.reshape(datum,(len(datum), 1)) # converting to matrix of n X 1

	svr_lin = SVR(kernel= 'linear', C= 1e3)
	svr_poly = SVR(kernel= 'poly', C= 1e3, degree= 2)
	svr_rbf = SVR(kernel= 'rbf', C= 1e3, gamma= 0.123) # defining the support vector regression models
	svr_rbf.fit(datum, prices) # fitting the data points in the models
	svr_lin.fit(datum, prices)
	svr_poly.fit(datum, prices)

	plt.scatter(datum, prices, color= 'black', label= 'Data') # plotting the initial datapoints
	plt.plot(datum, svr_rbf.predict(datum), color= 'red', label= 'RBF model') # plotting the line made by the RBF kernel
	plt.plot(datum,svr_lin.predict(datum), color= 'green', label= 'Linear model') # plotting the line made by linear kernel
	plt.plot(datum,svr_poly.predict(datum), color= 'blue', label= 'Polynomial model') # plotting the line made by polynomial kernel
	plt.xlabel('Date')
	plt.ylabel('Quake Intensity (Ritcher scale)')
	plt.title('Disaster Prediction')
	plt.legend()
	plt.show()

	return svr_rbf.predict(x)[0], svr_lin.predict(x)[0], svr_poly.predict(x)[0]

get_data('aapl.csv') # calling get_data method by passing the csv file to it
print "datum- ", datum
print "QuakeIntensity- ", prices

predicted_price = predict_price(datum, prices, 29)
