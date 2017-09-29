# Shell Functions
aws-env() {
  if [[ "$1" == "prodro" ]]; then
    /usr/bin/ssh-add -D
    export AWS_ACCESS_KEY_ID=''
    export AWS_SECRET_ACCESS_KEY=''
    export AWS_DEFAULT_REGION='us-west-1'
    echo "AWS Prod Read Only Environment Credentials Set"
    /usr/bin/ssh-add ~/.ssh/keys/production_ro.pem
  elif [[ "$1" == "prod" ]]; then
    /usr/bin/ssh-add -D
    export AWS_ACCESS_KEY_ID=''
    export AWS_SECRET_ACCESS_KEY=''
    export AWS_DEFAULT_REGION='us-west-1'
    echo "AWS Prod Environment Credentials Set"
    /usr/bin/ssh-add ~/.ssh/keys/production.pem
  elif [[ "$1" == "dev" ]]; then
    export AWS_ACCESS_KEY_ID=''
    export AWS_SECRET_ACCESS_KEY=''
    export AWS_DEFAULT_REGION='us-west-1'
    echo "AWS Dev Environment Credentials Set"
    /usr/bin/ssh-add ~/.ssh/keys/development.pem
  else
    echo "Usage: aws-account (prod|test|dev)"
  fi
}
