# GenAI-Accelerator-Test-Framework

## Table of Contents

- [Setting up Environment](#setting-up-environment)
- [Getting Started](#getting-started)
- [Resources](#resources)

## Setting up Environment
- Install Python
  - Download python 3.1x.xx
  - Run as Administrator
  - Check add path to PATH and Select Custom Installation
  - Leave the defaults as is on the next screen and continue with the installation
  - Open CMD, type and run command python -V (should print the version number of python)
  - Type and run command pip -V (should print the version number of pip)
  - Type and run command pip list (should print the list of installed packages)
- install Python packages with pip and requirements.txt
  - Type and run command pip install -r .\requirements.txt
- Freeze/update the requirements.txt
  - Note: While installing new packages, you must do it.
  - pip freeze > requirements.txt

## Getting Started
- Running Tests
  - robot -d .\Results\ .\Tests\API\Users\GetUser.robot
  - robot -d .\Results\ .\Tests\API\Users\*User.robot
  - robot -d .\Results\ [--include|-i smoke] .\Tests\API\Users\*User.robot
  - robot -d .\Results\ -V .\Configs\qa.yaml [--include|-i smoke] .\Tests\API\Users\*User.robot
  - robot -d .\Results\ -V .\Configs\qa.json [--include|-i smoke] .\Tests\API\Users\*User.robot
- Static Code Analysis
  - robocop
  - robocop --report rules_by_id .\Tests\API\Users\GetUser.robot
- Retry Failed Tests
  - robot --listener RetryFailed:2 -d .\Results\ -V .\Configs\qa.json [--include|-i smoke] .\Tests\API\Users\*User.robot

## Resources
- https://www.python.org - Python Installer Download
- pypi.org - Repository for packages (find the packages and their installations, documentations etc.)
- robotframework.org
- selenium.org (for downloading the web drivers for Browsers)
- jetbrains.com (for Pycharm Community edition IDE installation)
    - Install intellibot plugin latest version
      - Go to https://github.com/lte2000/intellibot/blob/develop/intellibot.jar
      - Download the jar file
      - Open PyCharm -> Settings -> Plugins -> Click on Setting Icon (Right side from the Installed tab) -> Select Install plugin from Disk
      - Import the jar file in PyCharm editor
      - Click on Restart

