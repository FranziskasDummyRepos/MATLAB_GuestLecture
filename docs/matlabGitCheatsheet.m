%[text] # MATLAB Git cheat sheet
%[text] Use MATLAB R2026a and your own GitHub repository. Work through one section at a time with Run Section. This live script can change local files and publish commits, so do not use Run All for your Git workflow.
%[text] Each action starts with a switch set to false. To perform it, change its switch to true and run only that section. Set it back to false immediately afterwards. The if block runs its enclosed commands only when the switch is true. With all switches left at false, running the whole file performs no Git or vault operations.
%[text] MATLAB may mark commands inside a disabled block as unreachable. This is expected while its switch is false; it is not a Git or authentication error.
%[text] Keep personal settings in an untracked working copy of this sheet outside your repository. Do not commit saved outputs or tokens. 
%%
%[text] ## Your settings
%[text] Replace the placeholders with your GitHub user name, repository name, and full local folder path. Run this section once per MATLAB session. These settings are not your token.
%[text] The local folder is the repository root on your computer.
githubUser = "YOUR-USER";
repositoryName = "YOUR-REPOSITORY";
repoFolder = "REPLACE-WITH-FULL-LOCAL-FOLDER";
repositoryURL = "https://github.com/" + githubUser + "/" + repositoryName + ".git";
repo = gitrepo(repoFolder);
%%
%[text] ## Create a GitHub token
%[text] In GitHub, open Settings \> Developer settings \> Personal access tokens \> Fine-grained tokens. Create a token owned by your account, limited to your course repository, with Contents: Read and write. Choose an expiry date after the course ends. Copy the token when GitHub shows it; GitHub will not show that value again.
%[text] A token lets MATLAB authenticate to GitHub. Your GitHub account password is not the token. Local operations such as status and commit do not need a token; accessing a private remote and pushing changes do.
%%
%[text] ## Store the token once
%[text] Enable this section and run it yourself. setSecret opens a prompt: paste your token there, never into the script. The name githubToken is a label you choose, not the token value.
%[text] MATLAB stores the secret in its vault, separately from this repository. It remains available across MATLAB sessions in the same local environment. Cloning the project does not copy the vault; each student stores their own token.
storeToken = false;
if storeToken
    setSecret("githubToken")
end
%%
%[text] ## Check storage without revealing the token
%[text] isSecret returns true if the name exists and false otherwise. It does not print the value. It does not check whether GitHub accepts the token or whether the token has expired.
checkToken = false;
if checkToken
    isSecret("githubToken")
end
%%
%[text] ## Retrieve the token when needed
%[text] getSecret retrieves the stored value using exactly the same case-sensitive name. In the clone, pull, and push examples below, Token=getSecret("githubToken") passes it directly to the Git command without printing it or creating a separate token variable.
%[text] If you need a variable, token = getSecret("githubToken"); retrieves it with output suppressed by the semicolon. That variable still contains the real token: do not display it, inspect it on a shared screen, or save it to a MAT-file. **Prefer passing it directly to the Git command**.
%[text] Never run getSecret by itself without assigning or consuming its result: that can expose the token in output. Live scripts can save their outputs, so an accidental display can end up in a committed file. The vault keeps secrets out of source files; it is not a barrier against code running as you. Do not ask an agent to retrieve your token.
%%
%[text] ## Clone once
%[text] This step is not necessary for the class exercise, we already cloned the repository when you have access to this script.
%[text] Create a local copy of your personal GitHub repository. Run Your settings first and check the URL and destination. Skip this section if you already cloned it; use Reopen below instead. A working copy of this sheet outside the repository is also useful before cloning.
cloneRepository = false;
if cloneRepository
    repo = gitclone(repositoryURL,repoFolder, ...
        Username=githubUser,Token=getSecret("githubToken"));
    status(repo)
end
%%
%[text] ## Reopen an existing local repository
%[text] After restarting MATLAB, run Your settings, then this section. gitrepo creates a MATLAB object representing the existing local repository. It does not download another copy. No token is needed.
reopenRepository = false;
if reopenRepository
    repo = gitrepo(repoFolder);
    statusDetails = status(repo);
    disp(statusDetails)
end
%%
%[text] ## Inspect status and history
%[text] After cloning or reopening, repo identifies the repository for subsequent commands. status shows changed and untracked files; log shows commit history. Neither command displays the actual changed lines: inspect those in MATLAB's comparison tools or in the Editor before committing.
inspectRepository = false;
if inspectRepository
    statusDetails = status(repo);
    disp(statusDetails)
    logDetails = log(repo);
    disp(logDetails)
end
%%
%[text] ## Pull before starting local work
%[text] First inspect status and resolve unfinished local work. Pull any remote changes and merge them into local files. 
%[text] **Exercise**: Make a small change to the README.md on GitHub and then pull that change here. 
pullChanges = false;
if pullChanges
    statusDetails = status(repo);
    disp(statusDetails)
    pull(repo,Username=githubUser,Token=getSecret("githubToken"));
    statusDetails = status(repo);
    disp(statusDetails)
end
%%
%[text] ## Change a file and commit locally
%[text] Execise: Make a small change to the README.md and write a descriptive commit message. Commit the change and inspect the local and remote repository.
commitChanges = false;
filesToCommit = "README.md";
commitMessage = "my commit message";
if commitChanges
    commit(repo,Message=commitMessage,Files=filesToCommit);
end
%%
%[text] ## Write a useful commit message
%[text] Make one logical change per commit. Start the message with an imperative verb, say what changed, keep the first line under 60 characters, and omit the final period. If the reason is not obvious, an optional body can explain why, separated by a blank line.
%[text] Good examples: "Clarify project description", "Add binary image display", "Filter small background objects", and "Explain coin detection goal". Avoid vague messages such as "changes", "fix", "final version", or "agent update". Describe the result, not which tool made it.
%%
%[text] ## Push your commits to GitHub
%[text] Review your local commits with log first. `push` publishes pending commits on the branch, not just the last edited file. Check that no credentials, saved outputs, or unrelated changes are included. Enable this section yourself, then inspect the commit and author on GitHub.
pushChanges = false;
if pushChanges
    logDetails = log(repo);
    disp(logDetails)
    push(repo,Username=githubUser,Token=getSecret("githubToken"));    
end
%%
%[text] ## Add a file and commit locally
%[text] `add` marks a new file for inclusion in the repository. `commit` records a local snapshot with your message; it does not publish anything to GitHub. Files explicitly limits this commit to your selected files. Inspect status and your changes before enabling this section.
%[text] **Exercise**: Create a script called `myscript.m.` It may only contain some comments and add it to source control, after adding you can commit and later push.
commitChanges = false;
filesToCommit = "myscript.m";
commitMessage = "my awesome script";
if commitChanges
    add(repo,filesToCommit)
    commit(repo,Message=commitMessage,Files=filesToCommit);
    status(repo)
end
%%
%[text] ## Replace an expired token
%[text] Create a replacement token in GitHub with the required repository access. Enable this section to paste the new value into MATLAB's prompt under the same name. The clone, pull, and push commands can stay unchanged. Overwrite=true replaces the local vault entry; it does not create or revoke a token on GitHub.
replaceToken = false;
if replaceToken
    setSecret("githubToken",Overwrite=true)
end
%[text] If authentication still fails, check the token expiry, selected repository, Contents permission, and repository URL. If a token was exposed in code, output, or a chat, revoke it on GitHub and replace it; deleting the output alone does not invalidate the token.

%[appendix]{"version":"1.0"}
%---
%[metadata:view]
%   data: {"layout":"inline"}
%---
