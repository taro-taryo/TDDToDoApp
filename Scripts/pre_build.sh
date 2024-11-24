#!/bin/bash

cd ${PROJECT_DIR}

# swift-format
swift format -r . -i --configuration tools/swift-format-configuration
