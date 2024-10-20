import re
from typing import List

from setuptools import setup, find_packages

def get_requirements(file_path: str) -> List[str]:
    """Reads a file containing a list of requirements and returns list.

    Args:
        file_path (str): The path to the file containing the requirements.

    Returns:
        List[str]: A list of requirements read from the file.
    """
    requirements = []
    with open(file_path, encoding="utf-8") as file:
        requirements = file.readlines()
        requirements = [req.replace("\n", "") for req in requirements]

        # Define the regex pattern for HYPHEN_E_DOT
        pattern = r'^-e\s+.'

        # Filter out any requirements that match the pattern
        requirements = [req for req in requirements if not re.match(pattern, req)]

    return requirements


def get_long_description(file_path: str = "README.md") -> str:
    """Reads the contents of a file and returns it as a string.

    Args:
        file_path (str, optional): The path to the file.
        Defaults to "README.md".

    Returns:
        str: The contents of the file as a string.
    """
    with open(file_path, encoding="utf-8") as file:
        long_description = file.read()
    return long_description


setup(
    name='whatsapp_notifier',
    version='0.1',
    packages=find_packages(),
    install_requires=get_requirements("requirements.txt"),
    entry_points={
        'console_scripts': [
            'send-whatsapp=whatsapp_notifier.notifier:main',  # Command that will be created
        ],
    },
    description='A CLI tool to send WhatsApp notifications',
    long_description=get_long_description(),
    long_description_content_type="text/markdown",
    author='Karthik Udyawar',
    author_email='karthikudyawar123@gmail.com',
    url='https://github.com/karthikudyawar/notify',
)
