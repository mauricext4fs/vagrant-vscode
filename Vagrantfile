Vagrant.configure("2") do |config|
  config.vm.box = "vagrant-dev-env"
  config.vm.network :private_network, ip: "192.168.159.11"
  config.vm.provider :virtualbox do |vb|
        vb.customize [
		"modifyvm", :id, "--natdnshostresolver1", "on",
        	"--natdnsproxy1", "on",
		"--memory", "3072"
	]
  end
  config.vm.provision "file", source: "~/.ssh/id_rsa", destination: "~/.ssh/id_rsa"
  config.vm.provision "file", source: "~/.ssh/id_rsa.pub", destination: "~/.ssh/id_rsa.pub"
  config.vm.provision "file", source: "./bin/provision_vagrant.sh", destination: "/home/vagrant/add_sshkey.sh"
  config.vm.provision "shell", path: "bin/provision_vagrant.sh"
  config.vm.synced_folder '.', '/home/vagrant/sync', disabled: true
  config.ssh.forward_agent = true
  config.ssh.forward_x11 = true
end
