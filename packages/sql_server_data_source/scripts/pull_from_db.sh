#!/bin/bash

cd ..
npx prisma db pull
npx prisma generate
dart run build_runner build --delete-conflicting-outputs