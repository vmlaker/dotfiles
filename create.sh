#!/bin/bash
virtualenv .venv
.venv/bin/pip install -r requirements.txt
.venv/bin/python create.py
