#!/bin/bash

g++ \
-std=c++11 \
-I.. \
-isystem \
/home/chenxh/usr/kaldi/tools/openfst/include \
-O1 \
-Wno-sign-compare \
-Wall \
-Wno-sign-compare \
-Wno-unused-local-typedefs \
-Wno-deprecated-declarations \
-Winit-self \
-DKALDI_DOUBLEPRECISION=0 \
-DHAVE_EXECINFO_H=1 \
-DHAVE_CXXABI_H \
-DHAVE_ATLAS \
-I/home/chenxh/usr/kaldi/tools/ATLAS_headers/include \
-msse -msse2 -pthread -g  -DHAVE_CUDA -I/usr/local/cuda-9.1/include \
-c -o apply-cmvn-sliding-23dim.o apply-cmvn-sliding-23dim.cc


g++  \
-Wl,-rpath=/home/chenxh/usr/kaldi/tools/openfst/lib  \
-rdynamic  apply-cmvn-sliding-23dim.o \
../ivector/kaldi-ivector.a \
../hmm/kaldi-hmm.a \
../gmm/kaldi-gmm.a \
../tree/kaldi-tree.a \
../util/kaldi-util.a \
../matrix/kaldi-matrix.a \
../base/kaldi-base.a   \
../feat/kaldi-feat.a \
/home/chenxh/usr/kaldi/tools/openfst/lib/libfst.so \
/usr/lib/libatlas.so.3 \
/usr/lib/libf77blas.so.3 \
/usr/lib/libcblas.so.3 \
/usr/lib/liblapack_atlas.so.3 \
-lm -lpthread -ldl \
-o apply-cmvn-sliding-23dim

