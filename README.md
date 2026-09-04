# GitHub Bulk Collaborator Inviter

A lightweight PowerShell utility to automatically invite multiple collaborators to a GitHub repository at once from a text file.

## Prerequisites

1. **Windows PowerShell**

2. **GitHub CLI (`gh`)** installed and authenticated.
   - Download it from [GitHub CLI](https://cli.github.com/)
   - Log in using terminal command: `gh auth login`

## How to Use

1. Clone or download this repository.

2. Duplicate `users.txt.example` and rename it to `users.txt`.

3. Add the GitHub usernames you want to invite into `users.txt` (one per line).

4. Run the script using your terminal:

   ```powershell
   .\invite_users.ps1
   ```

   > **Common Error: "Script Execution is Disabled"**
   > If your terminal shows an error saying "...cannot be loaded because running scripts is disabled on this system," Windows is blocking the file for security. You can easily bypass this security check for just this one running session by launching your script with this command instead:

   ```powershell
   PowerShell -ExecutionPolicy Bypass -File .\invite_users.ps1
   ```

5. Paste your repository link (e.g., `https://github.com/avishekchy45/gh-bulk-collab-inviter`) when prompted!

## License

Distributed under the MIT License. See `LICENSE` for more information.
