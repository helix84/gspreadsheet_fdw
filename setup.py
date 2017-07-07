import subprocess
from setuptools import setup, find_packages, Extension

setup(
  name='gspreadsheet_fdw',
  version='0.0.1',
  author='Tonca',
  author_email='antonio.bevilacqua@studenti.unipd.it',
  url='https://github.com/tonca/gspreadsheet_fdw/',
  license='MIT',
  packages=['gspreadsheet_fdw']
)

