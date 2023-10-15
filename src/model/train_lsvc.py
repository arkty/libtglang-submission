import numpy as np
from sklearn.svm import LinearSVC
from sklearn.preprocessing import StandardScaler
from sklearn.pipeline import make_pipeline
import pickle

TRAIN_COUNT = 20
players = list("!\"#$%&'()*+,-./:;<=>?@[\]^_`{|}~")
loaded = np.load("train_" + str(TRAIN_COUNT) + ".npz")

x = []
y = []
for idx, l in enumerate(loaded):
    for it in loaded[l]:
        x.append(it)
        y.append(idx)
x = np.array(x)
y = np.array(y)

clf = make_pipeline(StandardScaler(), LinearSVC(random_state=0, tol=1e-5, max_iter=1000))
clf.fit(x, y)

m_content = pickle.dumps(clf, protocol=pickle.HIGHEST_PROTOCOL)
m_file = open("model_" + str(TRAIN_COUNT) + "_local.pkl", 'wb')
m_file.write(m_content)
m_file.close()