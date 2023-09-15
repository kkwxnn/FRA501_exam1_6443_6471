from setuptools import find_packages
from setuptools import setup

setup(
    name='TEST01',
    version='0.0.0',
    packages=find_packages(
        include=('TEST01', 'TEST01.*')),
)
