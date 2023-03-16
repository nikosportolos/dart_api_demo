#!/bin/bash

cd ..

# Push the schema defined in the 'schema.prisma' file to the defined database
npx prisma db push

# Run build_runner to generate models
dart run build_runner build --delete-conflicting-outputs