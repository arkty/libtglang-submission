cython -3 py_tglang.pyx
gcc -shared -std=c99 -ggdb3 -O0 -Wall -Wextra -fPIC \
    $(python3-config --cflags) $(python3-config --ldflags) \
    -I$(python3 -c "import numpy; print(numpy.get_include())") \
    -o libtglang.so py_tglang.c tglang.c
cp libtglang.so ../libtglang.so