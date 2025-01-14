h# Enhanced git command with safety overrides for push, checkout, rebase, and push --force
# Add this script to your ~/.bashrc or ~/.zshrc and source the file to apply changes.

git() {
    RED='\033[0;31m'
    GREEN='\033[0;32m'
    YELLOW='\033[0;33m'
    RESET='\033[0m'
    echo "${RESET} Your terminal is protected by";
    echo "${GREEN} ██████╗ ██╗████████╗     ██████╗ ██╗   ██╗ █████╗ ██████╗ ██████╗ ██╗ █████╗ ███╗   ██╗";
    echo "${GREEN}██╔════╝ ██║╚══██╔══╝    ██╔════╝ ██║   ██║██╔══██╗██╔══██╗██╔══██╗██║██╔══██╗████╗  ██║";
    echo "${YELLOW}██║  ███╗██║   ██║       ██║  ███╗██║   ██║███████║██████╔╝██║  ██║██║███████║██╔██╗ ██║";
    echo ${YELLOW}"██║   ██║██║   ██║       ██║   ██║██║   ██║██╔══██║██╔══██╗██║  ██║██║██╔══██║██║╚██╗██║";
    echo "${RED}╚██████╔╝██║   ██║       ╚██████╔╝╚██████╔╝██║  ██║██║  ██║██████╔╝██║██║  ██║██║ ╚████║";
    echo "${RED} ╚═════╝ ╚═╝   ╚═╝        ╚═════╝  ╚═════╝ ╚═╝  ╚═╝╚═╝  ╚═╝╚═════╝ ╚═╝╚═╝  ╚═╝╚═╝  ╚═══╝";
    echo "${YELLOW} Code & Concept By John Rearden.  Updated and Maintained By Ben Darlington.             ";
    echo "${RESET} https://github.com/3disturbed/git-guardian/";

    if [[ "$1" == "push" ]]; then
        if [[ "$2" == "--force" ]]; then
            echo -e "${RED}WARNING: You are about to force-push changes.${RESET}"
            echo "This can overwrite history and cause issues for others."
            echo -e "Consider using ${GREEN}--force-with-lease${RESET} instead."
            echo -e "Proceed with ${RED}--force${RESET}? (${GREEN}yes${RESET}/${RED}no${RESET})"
            read -r confirmation
            if [[ "$confirmation" == "yes" ]]; then
                command git "$@"
            else
                echo "Force push aborted."
            fi
        else
            echo -e "${YELLOW}OK, SO IT'S TIME TO PUSH TO GITHUB!${RESET}"
            echo -e "Have you pulled the recent changes from the remote repo and merged them into your feature branch?"
            echo -e "${GREEN}yes ${RESET}/ ${RED}no${RESET} ?"
            read -r confirmation
            if [[ "$confirmation" == "yes" ]]; then
                command git "$@"
            else
                echo "Push aborted."
            fi
        fi
    elif [[ "$1" == "checkout" ]]; then
        if [[ -n $(git status --porcelain) ]]; then
            echo -e "${YELLOW}You have uncommitted changes. Switching branches may cause data loss.${RESET}"
            echo "Would you like to ${GREEN}commit${RESET}, ${YELLOW}stash${RESET}, or ${RED}proceed anyway${RESET}?"
            read -r response
            case $response in
                commit)
                    echo "Please commit your changes first."
                    ;;
                stash)
                    git stash
                    command git "$@"
                    ;;
                proceed)
                    command git "$@"
                    ;;
                *)
                    echo "Checkout aborted."
                    ;;
            esac
        else
            command git "$@"
        fi
    elif [[ "$1" == "rebase" ]]; then
        branch=$(git branch --show-current)
        if git ls-remote --exit-code origin "$branch" >/dev/null; then
            echo -e "${RED}WARNING: Rebasing a branch that has already been pushed to the remote.${RESET}"
            echo "This can cause problems for others working on the same branch."
            echo -e "Proceed with rebase? (${GREEN}yes${RESET}/${RED}no${RESET})"
            read -r confirmation
            if [[ "$confirmation" == "yes" ]]; then
                command git "$@"
            else
                echo "Rebase aborted."
            fi
        else
            command git "$@"
        fi
    else
        command git "$@"
    fi
}
