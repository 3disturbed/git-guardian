# git push interrupt for confirmation
# add to your .bashrc file in your home directory
# run source ~/.bashrc to apply changes
git() {
        if [[ "$1" == "push" ]]; then
                RED='\033[0;31m'
                GREEN='\033[0;32m'
                YELLOW='\033[0;33m'
                RESET='\033[0m'
                echo ""
                echo -e "${YELLOW}OK, SO IT'S TIME TO PUSH TO GITHUB!${RESET}"
                echo ""
                echo -e "Have you pulled the recent changes from the remote repo?"
                echo -e "and merged them into your feature branch?"
                echo ""
                echo -e "Reminder: "
                echo -e "git checkout main"
                echo -e "git pull"
                echo -e "git checkout ${YELLOW}YOUR_FEATURE_BRANCH${RESET}"
                echo -e "git merge main"
                echo ""
                echo -e "${GREEN}yes ${RESET}/ ${RED}no${RESET} ?"
                read -r confirmation
                if [[ "$confirmation" == "yes" ]]; then
                        # Use command to call the git push command
                        command git "$@"
                else
                        echo "Push aborted"
                fi
        else
                # Call the command without prompt
                command git "$@"
        fi
}