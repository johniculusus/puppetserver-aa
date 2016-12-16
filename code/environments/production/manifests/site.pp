node 'puppetc.asiapacific.hpqcorp.net' {
	include openssh::server
	
	file { '/tmp/testmaster.txt':
		ensure => present,
		owner => root,
		group => root,
		mode => '777',
		source => "puppet:///modules/wew/test2.txt"
	}
}
