
alias connect="python $CONNECT_PATH/connect.py"
alias listec2="aws ec2 describe-instances --output table --query 'Reservations[].Instances[].Tags[?Key==\`Name\`].Value'"
switch(){
        case $1 in
                production)
                        export VAULT_ENV=production
                        export AWS_PROFILE=production
			                  export AWS_DEFAULT_REGION=eu-west-1
                        export KOPS_STATE_STORE=s3://$KOPS_S3_BUCKET_PROD
			                  echo "AWS Prod Environment Credentials Set for production environment"
			                  /usr/bin/ssh-add -D
    			              /usr/bin/ssh-add ~/.ssh/keys/production.pem
                        osascript -e "tell application \"/Applications/Tunnelblick.app\"" -e "disconnect \"vpn_develop\"" -e "end tell"
                        kops export kubecfg $KUBERNETES_CLUSTER_NAME_PROD --state=s3://$KOPS_S3_BUCKET_PROD
                        osascript -e "tell application \"/Applications/Tunnelblick.app\"" -e "connect \"vpn_production\"" -e "end tell"
                        ;;
                develop)
                        export VAULT_ENV=develop
                        export AWS_PROFILE=develop
			                  export AWS_DEFAULT_REGION=eu-west-1
			                  export KOPS_STATE_STORE=s3://$KOPS_S3_BUCKET_DEV
			                  echo "AWS Dev Environment Credentials Set for develop environment"
			                  /usr/bin/ssh-add -D
    			              /usr/bin/ssh-add ~/.ssh/keys/develop.pem
                        osascript -e "tell application \"/Applications/Tunnelblick.app\"" -e "disconnect \"vpn_production\"" -e "end tell"
                        kops export kubecfg $KUBERNETES_CLUSTER_NAME_DEV --state=s3://$KOPS_S3_BUCKET_DEV
            		        osascript -e "tell application \"/Applications/Tunnelblick.app\"" -e "connect \"vpn_develop\"" -e "end tell"
                        ;;
                *)
                        echo $"Usage: switch {production|develop}"
        esac
}
