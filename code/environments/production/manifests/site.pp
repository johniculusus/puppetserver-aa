node 'puppetc.asiapacific.hpqcorp.net' { # This node is connected to HPE network / with proxy
	include openssh::server
	
	file { '/tmp/testmaster.txt':
		ensure => present,
		owner => root,
		group => root,
		mode => '777',
		source => "puppet:///modules/filetransferbucket/test.txt"
	}
}

node 'puppetc' { # This node is not connected to HPE network / no proxy
        include openssh::server

        file { '/tmp/testmaster.txt':
                ensure => present,
                owner => root,
                group => root,
                mode => '777',
                source => "puppet:///modules/filetransferbucket/test.txt"
        }
}

node default { 
	#include openssh::server

        file { '/tmp/testmaster.txt':
                ensure => present,
                owner => root,
                group => root,
                mode => '777'
                source => "puppet:///modules/filetransferbucket/test.txt",
        }

	exec { 'auto_update_master':
		#path => ["/etc/puppetlabs/code/environments/production/modules/"],
		command => '/bin/bash -c "git fetch" && /bin/bash -c "git merge origin/master"',
		tries => '3'
	}
}
