from distutils.extension import Extension

import numpy as np
from Cython.Build import cythonize

CYTHON_DIR = "src/app/"

modules = [
    Extension(f"{CYTHON_DIR}_ops".replace("/", "."), [f"{CYTHON_DIR}_ops.pyx"],),
]

extensions = cythonize(modules)


def build(setup_kwargs):
    """Needed for the poetry building interface."""
    setup_kwargs.update({"ext_modules": extensions, "include_dirs": [np.get_include()]})
