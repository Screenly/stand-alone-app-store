Vagrant.configure("2") do |config|

  config.vm.box = "ubuntu/xenial64"
  config.vm.hostname = "screenly"
  config.ssh.forward_agent = true

  # Forward guest port 4000 to host port 4000 (for Jekyll)
  config.vm.network "forwarded_port", guest: 4000, host: 4000

  config.vm.provider :virtualbox do |vb|
    vb.name = Dir.pwd().split("/")[-1]
    vb.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
    vb.customize [ "guestproperty", "set", :id, "--timesync-threshold", 10000 ]
    vb.memory = 1024
  end

end
