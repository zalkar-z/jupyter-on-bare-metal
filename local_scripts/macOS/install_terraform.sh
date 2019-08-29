# Bash script to automate Terraform installation on macOS

# 1 - Install homebrew
URL_BREW='https://raw.githubusercontent.com/Homebrew/install/master/install'

echo -n '- Installing brew ... '
echo | /usr/bin/ruby -e "$(curl -fsSL $URL_BREW)" > /dev/null
if [ $? -eq 0 ]; then echo 'Homebrew installed successfully.'; else echo 'Installation failed.'; fi


# 2 - Install Terraform
