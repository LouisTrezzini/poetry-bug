# cython: boundscheck=False, wraparound=False, cdivision=True
import numpy as np

cdef extern from "numpy/npy_math.h":
    cdef enum:
        NPY_INFINITYF

ctypedef unsigned char uchar

def nn_chain_sparse(double[:] dists, int[:] x2ys, int[:] x2ks, int[:] x2w,int[:] x2l,  int n):
    Z_arr = np.empty((n, 4))
    cdef double[:, :] Z = Z_arr

    cdef double[:] D = dists.copy()
    cdef int[:] size = np.ones(n, dtype=np.intc)

    cdef int[:] cc = np.ndarray(n, dtype=np.intc)
    cdef int cl = 0

    cdef int i, j, k, x, y, nx, ny, ni, ix, iy, zx, zy, yk, xk
    cdef double dist, current_min, dx, dy

    order = np.argsort(Z_arr[:, 2], kind="mergesort")
    Z_arr = Z_arr[order]

    return Z_arr
