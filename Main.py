import pandas as pd
import numpy as np
from tpot import TPOTClassifier
from sklearn.model_selection import train_test_split

data = pd.read_csv('IRIS.csv')

X_train, X_test, y_train, y_test = train_test_split(data.iloc[:,0:4], data.iloc[:,-1],train_size=0.75, test_size=0.25)

pipeline_optimizer = TPOTClassifier(generations=2, population_size=10, cv=5,random_state=42, verbosity=2)
pipeline_optimizer.fit(X_train, y_train)

print(pipeline_optimizer.predict(X_test))
print(pipeline_optimizer.score(X_test, y_test))
pipeline_optimizer.export('tpot_exported_pipeline.py')


