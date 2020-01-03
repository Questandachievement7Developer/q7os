#!/bin/bash
cd /Assistant/locinst
mkdir /Assistant/nextengine/
cp -rv edex-ui /Assistant/nextengine/
cd /Assistant/nextengine/edex-ui
npm run install-linux

