# Bash script to automate Terraform installation on macOS

# 1 - Install Homebrew
URL_BREW='https://raw.githubusercontent.com/Homebrew/install/master/install'

echo -n '- Installing Homebrew ... '
echo | /usr/bin/ruby -e "$(curl -fsSL $URL_BREW)" > /dev/null
if [ $? -eq 0 ]; then echo 'Homebrew installed successfully.'; else echo 'Homebrew installation failed.'; fi


# 2 - Install Terraform
