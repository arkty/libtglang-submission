cimport numpy as cnp
cnp.import_array()
cimport cython
import pickle

import warnings
warnings.simplefilter('ignore')
def warn(*args, **kwargs):
    pass
import warnings
warnings.warn = warn

import numpy as np
players = list("!\"#$%&'()*+,-./:;<=>?@[\]^_`{|}~")

cdef number_coalitions_weighting_x(cnp.int_t quota, cnp.ndarray[cnp.int_t, ndim=1] weights):  
    W = np.array(weights, dtype=np.int64)
    n = np.shape(W)[0]
    Wsum = np.sum(W)
    C = np.zeros(Wsum+1, dtype=np.int64)
    
    C[Wsum]=1
    maxQuWsumcum = np.maximum(quota, Wsum-np.cumsum(W,dtype=np.int64))+W
    for i in range(n):
        C[maxQuWsumcum[i]-W[i]:Wsum+1-W[i]] += C[maxQuWsumcum[i]:Wsum+1]
    return C

cdef number_coalitions_weighting_x_including_i(cnp.int_t quota, cnp.ndarray[cnp.int_t, ndim=1] weights, cnp.ndarray[cnp.int_t, ndim=1] C, cnp.int_t i):
    n = len(weights)
    Wsum = sum(weights) 
    w_i = weights[i]            
    Cwith_i = np.zeros(Wsum+1, dtype=np.int64)
    
    Cwith_i[Wsum-w_i+1:Wsum+1] = C[Wsum-w_i+1:Wsum+1] 
    for x in range(Wsum-w_i,quota-1,-1):
        Cwith_i[x]=(C[x]-Cwith_i[x+w_i])
    return Cwith_i

# Compute Banzhaf power index
cdef compute_pbi(cnp.int_t quota, cnp.ndarray[cnp.int_t, ndim=1] weights):
    n = len(weights)
    Wsum = sum(weights)    
    for i in range(n):
        if weights[i] > Wsum - quota:
            oldweigth_i = weights[i]
            weights[i] = Wsum - quota + 1
            quota = quota - oldweigth_i + weights[i]
    PBIfactor = 1/2**(n-1)
    PBIs = []
    C = number_coalitions_weighting_x(quota,weights)
    for i in range(n):
        Cwith_i = number_coalitions_weighting_x_including_i(quota,weights,C,i)        
        PBI = np.sum(Cwith_i[quota:quota+weights[i]])*PBIfactor  
        PBIs.append(PBI)
    return PBIs

# Compute Banzhaf power index for given text and combinations
cdef get_comb_pbi(text, combinations, q=0.75):
    weights = np.zeros(len(combinations), dtype=int)

    for i in range(len(text)):
        for idx, s in enumerate(combinations):
            if(text[i] == s):
                weights[idx] += 1
    return np.array(compute_pbi(int(sum(weights) * q), weights))

# Detect language
cdef public int py_tglang_detect_programming_language(const char* s) except *:
    m_file = open("./resources/model_20.pkl", "rb")
    clf = pickle.load(m_file)
    py_string = (<bytes> s).decode('UTF-8')
    file_pbi = get_comb_pbi(py_string, players)
    l_predicted = clf.predict([file_pbi])
    result = <int>l_predicted[0]
    return result