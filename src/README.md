#### Code language detection

##### Tools used
* Python 3.11.0 For pre-analysis and train data creation
* Python 3.7 (Debian build-in) for model creation
* numpy/sklearn for calcs
* cython for compiling result library

##### Structure
|File|Description|
|---|---|
| `./preprint.pdf`| Description of method used in this solution.|
| `./model/01_training_data.ipynb`| Training data loader |
| `./model/02_pre_analysis.ipynb`| Pre-analysis (check `preprint.pdf` for details). |
| `./model/03_preprint_version.ipynb`| Train data generation. Experiments with proposed method. |
| `./model/04_lsvc_final_version.ipynb`| Model generation and verification.|
| `./model/utils.py`| Utils for loading data.|
| `./model/train_lsvc.py`| Model trainer helper to use with Python 3.7 on headless machine.|
| `./model/training_github.config.json`| Train data Github API search config.|
| `./py_tglang.pyx`| Cython implementation.|
| `./py_tglang.c`| Generated from `py_tglang.pyx`.|
| `./py_tglang.h`| Generated from `py_tglang.pyx`.|
| `./tglang.c`| C wrapper for Cython implementation.|
| `./tglang.h`| Original header file from contest.|
| `./build.sh`| Simple build script for `libtglang.so`.|
| `*.npz`| Training data files.|
| `*.pkl`| Model data files.|
| `./README.md`| This readme file.|
