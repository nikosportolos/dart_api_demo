#!/bin/bash

cd ..
npx prisma migrate dev
#npx prisma db push
dart run build_runner build --delete-conflicting-outputs