from pathlib import Path
import numpy as np
import powerindices

def load_lang_files(train_count = None, target_langs = []):
    lang_files = {}
    for f in sorted(list(Path("./github_traning/").glob("*/*"))):
        lang = f.parts[1]
        file = f.parts[2]

        if(len(target_langs) != 0 and not lang in target_langs): continue
        if(file == '.response.json' or file == '.keywords'): continue
    
        files = lang_files.get(lang, [])
        files.append(f)
        lang_files[lang] = files
    for k, v in lang_files.items():
        if(train_count != None and len(v) < train_count):
            print(f"Invalid traning data for {k}")
    return lang_files

def get_comb_phi_file(file, combinations):
    return get_comb_pbi(open(file,'r').read(), combinations)

def get_comb_pbi(text, combinations, q=0.75):
    weights = np.zeros(len(combinations), dtype=int)

    for i in range(len(text)):
        for idx, s in enumerate(combinations):
            if(text[i] == s):
                weights[idx] += 1
    return powerindices.compute_pbi(int(sum(weights) * q), weights)