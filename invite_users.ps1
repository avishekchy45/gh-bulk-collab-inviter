#  Ask the user for the GitHub Repository URL
$RepoInput = Read-Host "Please enter the GitHub repository link (e.g., https://github.com/avishekchy45/github-invite-users)"

# Clean up the input string and remove trailing slashes or spaces
$RepoInput = $RepoInput.Trim().TrimEnd('/')

#  Extract the 'owner/repo' segment from the URL
if ($RepoInput -match 'github\.com/([^/]+/[^/]+)') {
    $REPO_PATH = $Matches[1]
    Write-Host "Target Repository Set to: $REPO_PATH" -ForegroundColor Cyan
}
else {
    Write-Host "Invalid GitHub link. Please make sure it contains '://github.com'." -ForegroundColor Red
    Exit
}

# Read the file and invite each user
if (Test-Path .\users.txt) {
    Get-Content .\users.txt | ForEach-Object {
        $user = $_.Trim() # Removes any accidental spaces
        if ($user) {
            Write-Host "Inviting $user to $REPO_PATH..." -ForegroundColor Yellow
            gh api --method PUT -F permission="push" "repos/$REPO_PATH/collaborators/$user" | Out-Null # Out-Null silences console output
        }
    }
    Write-Host "Finished processing all users!" -ForegroundColor Cyan

}
else {
    Write-Host "Error: Could not find 'users.txt' in this directory." -ForegroundColor Red
}