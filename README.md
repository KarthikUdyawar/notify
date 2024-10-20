# Notify

![Logo](image/logo.jpg)

![Ubuntu version](https://img.shields.io/badge/Ubuntu%20version-22.04%20LTS-orange?style=flat-square) 
[![Python Version](https://img.shields.io/pypi/pyversions/pywhatkit.svg?style=flat-square)](https://pypi.org/project/pywhatkit/)
[![License](https://img.shields.io/badge/license-Apache%202.0-brightgreen.svg?style=flat-square)](https://github.com/KarthikUdyawar/notify/blob/master/LICENSE)
[![GitHub stars](https://img.shields.io/github/stars/KarthikUdyawar/notify?style=flat-square)](https://github.com/KarthikUdyawar/notify/stargazers)
[![GitHub forks](https://img.shields.io/github/forks/KarthikUdyawar/notify?style=flat-square)](https://github.com/KarthikUdyawar/notify/network/members)
[![GitHub issues](https://img.shields.io/github/issues/KarthikUdyawar/notify?style=flat-square)](https://github.com/KarthikUdyawar/notify/issues)


A simple Bash script that runs a command with a logs the output, tracks execution time, and sends optional WhatsApp and desktop notifications upon completion or failure.

## Table of Contents

- [Notify](#notify)
- [Description](#description)
- [Problem Solved](#problem-solved)
- [Prerequisites](#prerequisites)
- [Installation](#installation)
- [Usage](#usage)
- [Contributing](#contributing)
- [License](#license)
- [Acknowledgments](#acknowledgments)
- [Contact Information](#contact-information)

## Description
The WhatsApp Notification Script is a Bash-based utility that allows users to execute any command in the terminal while providing real-time notifications via WhatsApp upon completion. It notifies users whether the script executed successfully or failed, and it logs the output of the command to a file. Additionally, it features a loading spinner to enhance the user experience during execution.


## Problem Solved
This project solves the problem of monitoring long-running scripts by providing instant feedback through WhatsApp notifications. Users can run their scripts without needing to constantly check the terminal, allowing for more efficient workflow management.

[Back to Top](#notify)

## Prerequisites
Before running this project, make sure the following dependencies and software are installed on your system:

- **Operating System:** This project is designed to run on Linux-based operating systems (e.g., Ubuntu, Debian). While it may work on other UNIX-like systems, it has not been tested on macOS or Windows.

- **Python 3.x**: You need Python 3 installed on your machine. You can install it using your system's package manager:

    ```bash
    sudo apt-get install python3
    ```

- **libnotify-bin:** This is required for desktop notifications.

    ```bash
    sudo apt-get install libnotify-bin
    ```
- **Python Development Libraries:** Required to install Python packages properly.

    ```bash
    sudo apt-get install python3-dev
    ```
- **python3-tk:** Required for certain Python packages that rely on graphical libraries.

    ```bash
    sudo apt-get install python3-tk
    ```

- **Virtual environment:** Make sure you have Python's virtual environment installed:

    ```bash
    sudo apt-get install python3-venv
    ```

Once you have these prerequisites installed, you can proceed with the installation steps outlined below.

[Back to Top](#notify)

## Installation

1. **Clone the repository:**

    ```bash
    git clone https://github.com/KarthikUdyawar/notify.git
    cd notify
    ```

2. **Set up a Python virtual environment:**

    ```bash
    python3 -m venv env
    source env/bin/activate
    ```

3. **Install required dependencies:** Use the `setup.py` file to install the necessary Python dependencies:

    ```bash
    python3 setup.py install
    ```

4. **Create a .env file:** Copy the `.env/template` to a new `.env` file and update the placeholders:

    ```bash
    cp .env.template .env
    ```

    Edit the `.env` file to include your virtual environment path and WhatsApp phone number:

    ```
    # Absolute path to the directory containing the python activate script
    VENV_PATH=/home/<your-path>/notify/env/bin/activate

    # WhatsApp phone number to send notifications to 
    WHATSAPP_PHONE_NUMBER=+<country-code><phone-number>
    ```

5. **Make the script executable:** Run the following command to make the script executable:

    ```bash
    chmod +x run_notify.sh
    ```

6. **Create an alias for easier command execution:** 
    To simplify running the script, you can create an alias in your shell configuration file (e.g., `.bashrc` or `.zshrc`):

   - Open your shell configuration file in a text editor. For example, if you are using bash:
     ```bash
     nano ~/.bashrc
     ```
     Or if you are using zsh:
     ```bash
     nano ~/.zshrc
     ```

   - Add the following line at the end of the file:
     ```bash
     alias notify='/home/<your-path>/notify/run_notify.sh'
     ```

   - Save and close the file. If you are using `nano`, you can do this by pressing `CTRL + X`, then `Y` to confirm changes, and `ENTER` to exit.

   - After adding the alias, run the following command to apply the changes:
     ```bash
     source ~/.bashrc
     ```
     Or for zsh:
     ```bash
     source ~/.zshrc
     ```
[Back to Top](#notify)

## Usage

To run a command and receive notifications, use the following syntax:

```bash
notify [--notify-whatsapp] <command-to-run>
```

### Example

```bash
notify --notify-whatsapp python3 example/mock_huge_task.py
```

- `--notify-whatsapp`: Optional flag to enable WhatsApp notifications.
- `<command-to-run>`: The command you want to execute.

[Back to Top](#notify)

## Contributing

Contributions are welcome! To contribute to this project:

1. Fork the repository.
2. Create a new branch (`git checkout -b feature/YourFeature`).
3. Make your changes.
4. Commit your changes (`git commit -m 'Add some feature'`).
5. Push to the branch (`git push origin feature/YourFeature`).
6. Open a pull request.

Please ensure that your code adheres to the project's coding style and that you have tested your changes.

## License
This project is licensed under the Apache License. See the [LICENSE](https://github.com/KarthikUdyawar/notify/blob/master/LICENSE) file for details.

## Acknowledgments
- **Inspiration:** Special thanks to all open-source contributors and communities that inspire and support developers around the world.
- **Libraries and Tools:** This project uses several libraries and tools that enhance its functionality, including:
  - [pywhatkit](https://github.com/Ankit404butfound/pywhatkit) for sending WhatsApp messages.
  - [libnotify](https://gitlab.gnome.org/GNOME/libnotify) for desktop notifications.
- **Community:** Thanks to the programming and developer community for their invaluable resources, tutorials, and documentation that helped make this project possible.

## Contact Information
For support or questions, please reach out to:

- GitHub Profile: [KarthikUdyawar](https://github.com/KarthikUdyawar)

[Back to Top](#notify)