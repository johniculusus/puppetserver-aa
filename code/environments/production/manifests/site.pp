node 'puppetc.asiapacific.hpqcorp.net' { # This node is connected to HPE network / with proxy
	include openssh::server
	
	file { '/tmp/testmaster.txt':
		ensure => present,
		owner => root,
		group => root,
		mode => '777',
		source => "puppet:///modules/wew/test2.txt"
	}
}

node 'puppetc' { # This node is not connected to HPE network / no proxy
        include openssh::server

        file { '/tmp/testmaster.txt':
                ensure => present,
                owner => root,
                group => root,
                mode => '777',
                source => "puppet:///modules/wew/test2.txt"
        }
}
