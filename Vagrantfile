# -*- mode: ruby -*-
# vi: set ft=ruby  :

machines = {
  "node01"   => {"memory" => "1024", "cpu" => "2", "ip" => "100", "image" => "centos/8"},
  "node02" => {"memory" => "1024",  "cpu" => "2", "ip" => "110", "image" => "centos/8"},
  "node03" => {"memory" => "2048",  "cpu" => "2", "ip" => "120", "image" => "centos/8"}
#  "node04" => {"memory" => "512",  "cpu" => "2", "ip" => "130", "image" => "centos/8"}
}

Vagrant.configure("2") do |config|

  machines.each do |name, conf|
    config.vm.define "#{name}" do |machine|
      machine.vm.box = "#{conf["image"]}"
      machine.vm.hostname = "#{name}.example"
      machine.vm.network "private_network", ip: "172.18.10.#{conf["ip"]}"
      machine.vm.provider "virtualbox" do |vb|
        vb.name = "#{name}"
        vb.memory = conf["memory"]
        vb.cpus = conf["cpu"]
        vb.customize ["modifyvm", :id, "--groups", "/ansible"]
      end
      if "#{conf["image"]}" == "centos/8"
        machine.vm.provision "shell", path: "./scripts/centos.sh" 
      end
      if "#{conf["image"]}" == "centos/8"
        machine.vm.provision "shell", path: "./scripts/centos.sh"
      end

      if "#{conf["image"]}" == "centos/8"
        machine.vm.provision "shell", path: "./scripts/centos.sh"
      end
      config.vm.provision "shell", inline: <<-EOF
      HOSTS=$(head -n7 /etc/hosts)
      echo -e "$HOSTS" > /etc/hosts
      echo '172.18.10.100 node01.example' >> /etc/hosts
      echo '172.18.10.110 node02.example' >> /etc/hosts
      echo '172.18.10.120 node03.example' >> /etc/hosts
#      echo '172.18.10.120 node04.example' >> /etc/hosts
      echo '192.168.3.211 node05.example' >> /etc/hostss
      echo '192.168.3.254 node06.example' >> /etc/hostss
      EOF
    end
  end
end
