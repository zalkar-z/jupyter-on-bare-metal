# Bash script to automate Terraform installation on macOS

# to silent errors - echo | command > /dev/null 2>&1

# Install Homebrew
if ! [ -x "$(command -v brew)" ]; then
    URL_BREW='https://raw.githubusercontent.com/Homebrew/install/master/install'
    echo -n '- Installing Homebrew ... '
    echo | /usr/bin/ruby -e "$(curl -fsSL $URL_BREW)" > /dev/null
    if [ $? -eq 0 ]; then echo 'Homebrew installed successfully.'; else echo 'Homebrew installation failed.'; fi
else
    echo ' - Homebrew already installed '
fi

# Install Terraform
if ! [ -x "$(command -v terraform)" ]; then
    echo -n '- Installing Terraform ... '
    echo | brew install terraform > /dev/null
    if [ $? -eq 0 ]; then echo 'Terraform installed successfully.'; else echo 'Terraform installation failed.'; fi
else
    echo ' - Terraform already installed '
fi
