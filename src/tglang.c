#include "tglang.h"
#include "py_tglang.h"

enum TglangLanguage tglang_detect_programming_language(const char *text) {
  PyImport_AppendInittab("py_tglang", PyInit_py_tglang);
  Py_Initialize();
  PyImport_ImportModule("py_tglang");

  int result = py_tglang_detect_programming_language(text) + 1;
  if (PyErr_Occurred()) {
    PyErr_Print();
    return -1;
  }
  Py_Finalize();
  return result;
}