#!/bin/bash

cd ..
npx prisma migrate dev

# Run build_runner to generate models
dart run build_runner build --delete-conflicting-outputs