#!/bin/bash

# This script runs all integration tests in the 'tests' directory that end with '_integration.sh'

# Set the exit code to zero (success) by default
exit_code=0

# Find all files in the 'tests' directory that end in '_integration.sh'
test_files=$(find tests -name '*_integration.sh' -type f)

# Iterate over each test file and run it
for test_file in $test_files
do
  echo "Running integration test file: $test_file"
  if ! bash $test_file ; then
    # If the test fails, set the exit code to non-zero
    exit_code=1
  fi
done

# Return the exit code of the script
exit $exit_code
