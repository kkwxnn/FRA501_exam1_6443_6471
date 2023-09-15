from setuptools import find_packages
from setuptools import setup

setup(
    name='exam1_turtle_control',
    version='0.0.0',
    packages=find_packages(
        include=('exam1_turtle_control', 'exam1_turtle_control.*')),
)
