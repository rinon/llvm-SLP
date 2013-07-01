Low Level Virtual Machine (LLVM)
================================

This directory and its subdirectories contain source code for the Low Level
Virtual Machine, a toolkit for the construction of highly optimized compilers,
optimizers, and runtime environments.

LLVM is open source software. You may freely distribute it under the terms of
the license agreement found in LICENSE.txt.

Please see the documentation provided in docs/ for further
assistance with LLVM, and in particular docs/GettingStarted.rst for getting
started with LLVM and docs/README.txt for an overview of LLVM's
documentation setup.

If you're writing a package for LLVM, see docs/Packaging.rst for our
suggestions.

SLP Vectorizer Project
======================

This repository contains a preliminary implementation of a new
Superword Level Parallelizer based on "A Compiler Framework for
Extracting Superword Level Parallelism" by Liu et. al. (PLDI'12). See
lib/Transforms/Vectorize/BBVectorizeGlobal.cpp for more details.

Clang sources available at: https://github.com/rinon/llvm-SLP-clang
