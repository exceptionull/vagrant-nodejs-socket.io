node 'socketio.vagrant.vm' {

    $app_start_command = '/usr/local/node/node-default/bin/forever start -l /vagrant/logs/socketio_forever.log -o /vagrant/logs/socketio_stdout.log -e /vagrant/logs/socketio_stderr.log -w -a --no-colors -c /usr/local/node/node-default/bin/node --sourceDir /vagrant/app server.js'
    $app_environment_vars = ["NODE_ENV=development"]

    class { 'apt':
      always_apt_update => true
    }
    
    package { [
        'build-essential',
        'vim',
        'curl',
        'git-core',
        'mc',
        'ruby1.9.1'
      ]:
      ensure  => 'installed',
    }
    
    exec { 'semver-install':
        command => '/usr/bin/gem install semver',
        require => Package['ruby1.9.1']
    } ->
    class { 'nodejs':
      version => 'v0.10.28'
    }
    
    package { 'forever':
      provider => npm,
      install_options => [ '-g' ],
    }

    exec { 'create-legacy-node-symlink':
      command => '/bin/ln -s -f /usr/local/node/node-default/bin/node /usr/bin/node',
      require => Class['nodejs']
    } ->
    exec { 'npm-install':
        command => '/usr/local/node/node-default/bin/npm install',
        cwd => '/vagrant/app',
        timeout => 600,
        require => Class['nodejs']
    } ->
    exec { 'node-run':
        command => $app_start_command,
        environment => $app_environment_vars,
        user => root,
        require => [ Class['nodejs'], Package['forever']]
    } ->
    cron { 'forever-restart-reboot':
        command => $app_start_command,
        environment => $app_environment_vars,
        user => root,
        special => 'reboot'
    }
}