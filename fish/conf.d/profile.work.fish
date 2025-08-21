#!/usr/bin/env fish
echo 'Loading profile.work.fish'

# Am I at work?
if ! test -d "/mnt/c/Users"
    echo 'I am not at work!'
    exit
end

echo 'I am at work, loading work conf'

# export WINHOME=/mnt/c/Users/mhr39349

# export PROG=/mnt/c/programming
# export BUSAPPS=$PROG/isisbusapps
# export SITES=$PROG/SISites
# export USERS=$PROG/Users
# export MESSAGES=$PROG/Messages
# export STAFFDETAILS=$PROG/StaffDetails
# export FBS=/mnt/c/fbs/Apps


# alias dots='cd $DOTS'
# alias winhome='cd $WINHOME'
# alias prog='cd $PROG'
# alias busapps='cd $BUSAPPS'
# alias ba='cd $BUSAPPS'
# alias si='cd $SITES'
# alias users='cd $USERS'
# alias messages='cd $MESSAGES'
# alias staffdetails='cd $STAFFDETAILS'
# alias fbs='cd $FBS'

# # Docker clean dangling images <none>:<none>
# # from https://projectatomic.io/blog/2015/07/what-are-docker-none-none-images/
# function docker-clean
# 	docker rmi $(docker images -f "dangling=true" -q)
# end

# export DOCKER_BUILDKIT=1


# # k8s config - dev
# export KUBECONFIG_DEV="$HOME/.kubecfg/dev/dev-v3.kubeconfig"
# export KUBECONFIG_DEV_MAN="$HOME/.kubecfg/dev/management-v3.kubeconfig"
# export KUBECONFIG_DEV_LOADTEST="$HOME/.kubecfg/dev/load-testing-v3.kubeconfig"

# # k8s config - prod
# export KUBECONFIG_PROD="$HOME/.kubecfg/prod/prod-v4.kubeconfig"
# export KUBECONFIG_PROD_MAN="$HOME/.kubecfg/prod/management-prod-v3.kubeconfig"


# # DEFAULT - CONNECT TO DEV
# export KUBECONFIG=$KUBECONFIG_DEV

# function switch-k8s 
#     if test $1 = 'd' 
#         export KUBECONFIG=$KUBECONFIG_DEV
#         echo "Switch to k8s dev: $KUBECONFIG"
#     else if test $1 = 'p' 
#         export KUBECONFIG=$KUBECONFIG_PROD
#         echo "Switch to k8s prod: $KUBECONFIG"
#     else
#         echo "Didn't understand chose, k8s is still $KUBECONFIG"
#     end
# end

# alias sk='switch-k8s'

# alias fbs='cd $FBS'

# # Just checking
# echo "Loaded shodders work profile"
# echo "Using kubeconf: $KUBECONFIG \n\n"


# # Set some envs to use with docker (bypassing fba-compose)
# set FBA_COMPOSE_DIR "/mnt/c/programming/docker-orchestration"
# #export WINDOWS_HOST=$(ip route show | grep -i default | awk '{ print $3 }')
# #export REPOS_ROOT_DIR=${REPOS_ROOT_DIR:-~/repos}
# #export WIN_REPOS_ROOT_DIR=${WIN_REPOS_ROOT_DIR:-/mnt/c/programming}

