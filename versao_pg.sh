#!/bin/bash

sudo -u postgres psql -U postgres -d postgres -c 'select version();'