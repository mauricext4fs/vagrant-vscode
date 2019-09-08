# Vagrant-VSCode Development Environment

The easiest way to get a whole development environment localy 
(especially important when working on unreliable internet or none at all) 
is to use Vagrant and Virtualbox. 

During the box setup, your .ssh directory from your home dir will be copied
over on the vagrant user inside the virtual machine. Therefore, all the 
git and ssh command inside the virtual machine done through vagrant ssh 
will use your local ssh key. 

When installed the vagrant machine should be reachable with the IP:
192.168.159.11 and the user: vagrant

## Setup Virtualbox on your Mac

Follow the usual instruction from https://www.virtualbox.org/wiki/Downloads

## Setup Vagrant on your Mac

1. Download and install vagrant from: https://www.vagrantup.com/downloads.html
2. Place your package.box (Virtualbox vagrant machine) into this directory 
   (see https://www.vagrantup.com/docs/cli/package.html on how to export a vm 
   to a vagrant box). 
3. Import the virtualbox:
```sh
vagrant box add package.box --name vagrant-dev-env
```
4. Run the vagrant machine (YOU MUST DO THIS AT EVERY REBOOT!) : vagrant up

## Setup VS Code

Please follow the steps in ## Setup Vagrant on your Mac first!.

### Download and install Visual Studio Code Insiders

You can download VSCode from this link: 
https://code.visualstudio.com/insiders/

### Install vscode-remote-extensionpack

After download and install VSCode Insiders open it and launch Quick Open (Ctrl+P or CMD + P on Mac), paste the following command and press enter
```sh
ext install ms-vscode-remote.vscode-remote-extensionpack
```

### Edit ssh configuration file

Open VSCode Insiders and click F1 (Fn + F1 on Mac), type ssh and select option `Remote-SSH: Open Configuration File...`. Select proper path for configuration file (example path: `/home/<username>/.ssh/config` where <username> is your username on your system) and click enter. At the end of file add following text and save file. 

```sh
Host vagrant-dev-env
      User vagrant
      HostName 192.168.159.11
```

Make sure to not destory the existing entry and leave one blank line before and after the above text.

### Connect to SSH host

In VSCode Insiders click F1 (Fn + F1 on Mac), search `ssh` and select option `SSH-Remote: Connect to Host...`. Then select `vagrant-dev-env` and click
enter.

1. Accept the SSH Key by choosing "Continue".
2. VSCode should then open the remote workspace in new window.
3. On the left menu click on Explorers
4. Click on "Open Folder"
5. Choose your workspace in /home/vagrant/<workspace> and click "OK"

Enjoy!


