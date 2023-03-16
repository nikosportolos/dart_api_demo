#!/bin/bash

cd ..

# Pull the schema defined in database to the local 'schema.prisma' file
npx prisma db pull

# Generate prisma_client.dart
npx prisma generate

# Run build_runner to generate models
dart run build_runner build --delete-conflicting-outputs