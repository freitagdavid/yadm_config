# function gitCommit() {
#     year=$(date +%Y)
#     read "sprint?Sprint: "
#     read "ticket?Ticket: "
#     read "message?Message: "
#     git add .
#     echo "Is this commit message correct?"
#     echo "feature/$year-Sprint$sprint/RNA-$ticket-$message"
#     if read -q "reply?y/N: "; then
#         echo "Committing"
#         git commit -m "feature/$year-Sprint$sprint/RNA-$ticket-$message"
#     else
#         echo "Aborting"
#     fi
#     # git commit -m "feature/$year-Sprint$sprint/RNA-$ticket-$message"
# }

function gitCommit() {
    branchName=$(git rev-parse --abbrev-ref HEAD)
    prefix=${branchName[0,8]}
    readonly commitMessage=${1:?"You must specify a commit message"}
    fullCommitMessage="${prefix} ${commitMessage}"
    git commit -m $fullCommitMessage
}