# -*- mode: ruby -*-
# vi: set ft=ruby  :

machines = {
  "debian"   => {"memory" => "256", "cpu" => "2", "ip" => "140","image" => "debian/bullseye64"},
  "ubuntu" => {"memory" => "256",  "cpu" => "2", "ip" => "150", "image" => "debian/bullseye64"},
}

Vagrant.configure("2") do |config|

  machines.each do |name, conf|
    config.vm.define "#{name}" do |machine|
      machine.vm.box = "#{conf["image"]}"
      machine.vm.hostname = "#{name}.vagrant"
      machine.vm.network "public_network",ip: "192.168.3.#{conf["ip"]}"
      machine.vm.provider "virtualbox" do |vb|
        vb.name = "#{name}"
        vb.memory = conf["memory"]
        vb.cpus = conf["cpu"]
        vb.customize ["modifyvm", :id, "--groups", "/zabbix"]
      end
      if "#{conf["image"]}" == "debian/bullseye64"
        machine.vm.provision "shell", path: "./scripts/debian.sh" 
      end
      if "#{conf["image"]}" == "ubuntu/focal64"
        machine.vm.provision "shell", path: "./scripts/debian.sh"
      end
    end
  end
end
