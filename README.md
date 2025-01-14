# Git Guardian: Enhanced Git Safety Script

A Bash script designed to enhance the safety of critical Git commands, such as `push`, `checkout`, and `rebase`, with added warnings and confirmation prompts to help prevent common mistakes.

---

## Table of Contents

- [About the Project](#about-the-project)
- [Features](#features)
- [Getting Started](#getting-started)
  - [Installation](#installation)
  - [Usage](#usage)
- [Acknowledgments](#acknowledgments)
- [License](#license)

---
![image](https://github.com/user-attachments/assets/f32db5c5-c294-4da2-8ec6-3b3ff1b7c8b9)

## About the Project

The **Git Guardian** script adds an extra layer of security and usability to Git by intercepting commands like `push`, `checkout`, and `rebase`. It introduces confirmation prompts, safety checks, and helpful tips to prevent accidental errors such as overwriting history or losing uncommitted changes.

This project was inspired by [John Rearden's Push Protector](https://github.com/johnrearden/push-protector), and builds upon his foundational idea of making Git safer for developers, especially juniors. 

---

## Features

- **Push Confirmation**:
  - Ensures the user has pulled and merged the latest changes before pushing.
  - Includes warnings for `--force` pushes, encouraging the use of `--force-with-lease`.
- **Checkout Safety**:
  - Warns if uncommitted changes exist before switching branches.
  - Offers options to commit, stash, or proceed.
- **Rebase Protection**:
  - Warns when rebasing a branch that has been pushed to the remote.
- **Custom ASCII Art Banner**:
  - Displays an encouraging "Git Guardian" banner with bubble text.

---

## Getting Started

### Installation

1. Clone the repository or download the script:
   ```bash
   git clone https://github.com/yourusername/git-guardian
   ```

2. Add the script to your shell configuration file:
   - For Bash:
     ```bash
     echo "source /path/to/git-guardian.sh" >> ~/.bashrc
     source ~/.bashrc
     ```
   - For Zsh:
     ```bash
     echo "source /path/to/git-guardian.sh" >> ~/.zshrc
     source ~/.zshrc
     ```

3. Reload your shell configuration to apply changes.

### Usage

Once installed, you can use your Git commands as usual. The script will automatically intercept specific commands (`push`, `checkout`, `rebase`) and add safety prompts when necessary.

---

## Acknowledgments

A special thanks to **John Rearden** for creating the original [Push Protector](https://github.com/johnrearden/git-push-confirmation), which served as the inspiration for this project. His work laid the groundwork for making Git safer and more user-friendly.

---

## License

This project is licensed under the [MIT License](LICENSE). Feel free to use, modify, and distribute this script in accordance with the license terms.

---

Thank you for using Git Guardian! If you have any suggestions, feel free to open an issue or contribute to the repository.
