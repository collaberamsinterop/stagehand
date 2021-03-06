#!/bin/bash

# Copyright (c) 2014, Google Inc. Please see the AUTHORS file for details.
# All rights reserved. Use of this source code is governed by a BSD-style
# license that can be found in the LICENSE file.

# Fast fail the script on failures.
set -e

# Display installed versions.
dart --version

# Globally install grinder.
pub global activate grinder
export PATH=~/.pub-cache/bin:$PATH

# Get our packages.
pub get

# Verify that the libraries are error free.
dartanalyzer --fatal-warnings bin/stagehand.dart lib/stagehand.dart test/all.dart

# Run the tests.
dart test/all.dart

# Run all the generators and analyze the generated code.
grind test
