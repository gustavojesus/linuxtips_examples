# -*- mode: ruby -*-
# vi: set ft=ruby  :

machines = {
  "worker01"   => {"memory" => "1024", "cpu" => "2", "ip" => "10", "image" => "ubuntu/xenial64"},
  "worker02" => {"memory" => "1024", "cpu" => "2", "ip" => "20", "image" => "ubuntu/xenial64"},
  "worker03"   => {"memory" => "1024", "cpu" => "2", "ip" => "30", "image" => "ubuntu/xenial64"}
}
  

Vagrant.configure("2") do |config|

  config.vm.box_check_update = false
  config.vm.boot_timeout = 600
  machines.each do |name, conf|
    config.vm.define "#{name}" do |machine|
      machine.vm.box = "#{conf["image"]}"
      machine.vm.hostname = "#{name}.linuxtips"
      machine.vm.network "private_network", ip: "192.168.99.#{conf["ip"]}"
      machine.vm.provider "virtualbox" do |vb|
        vb.name = "#{name}"
        vb.memory = conf["memory"]
        vb.cpus = conf["cpu"]
        vb.customize ["modifyvm", :id, "--groups", "/linuxtips"]
      end
        if "#{conf["image"]}" == "ubuntu/xenial64" or "#{conf["image"]}" == "debian/buster64"
          machine.vm.provision "shell", inline: "apt-get update ;apt-get install curl -y; apt-get install python -y; curl -fsSL https://get.docker.com | bash ; hostnamectl set-hostname #{name}.linuxtips"
        end
        if "#{conf["image"]}" == "centos/7"
          machine.vm.provision "shell", inline: "yum update ; yum install net-tools -y; hostnamectl set-hostname #{name}.linuxtips"
        end
    end
  end
  config.vm.provision "shell", path: "script.sh"
end
