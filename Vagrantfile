# -*- mode: ruby -*-
# vi: set ft=ruby  :

machines = {
  "node01"   => {"memory" => "1024", "cpu" => "2", "ip" => "140","image" => "centos/8"},
  "node02"   => {"memory" => "1024", "cpu" => "2", "ip" => "140","image" => "centos/8"},
  "node03"   => {"memory" => "2048", "cpu" => "2", "ip" => "140","image" => "centos/8"},
  "node04" => {"memory" => "1024",  "cpu" => "2", "ip" => "150", "image" => "centos/8"},
}

Vagrant.configure("2") do |config|

  machines.each do |name, conf|
    config.vm.define "#{name}" do |machine|
      machine.vm.box = "#{conf["image"]}"
      machine.vm.hostname = "#{name}.example.zabbix"
      machine.vm.network "public_network",ip: "192.168.3.#{conf["ip"]}", bridge: "wlp1s0"
      machine.vm.provider "virtualbox" do |vb|
        vb.name = "#{name}"
        vb.memory = conf["memory"]
        vb.cpus = conf["cpu"]
        vb.customize ["modifyvm", :id, "--groups", "/zabbix"]
      end
      if "#{conf["image"]}" == "centos/8"
        machine.vm.provision "shell", path: "./scripts/centos.sh" 
      end
    end
  end
end
