#!/usr/bin/env puppet
# Puppet manifest to configure ssh client

# Ensure SSH client configuration uses private key and disables password authentication

file_line { 'Declare identity file':
  ensure => present,
  path   => '/etc/ssh/ssh_config',
  line   => '    IdentityFile ~/.ssh/school',
  match  => '^[#]*\s*IdentityFile\s+~/.ssh/school$'
}

file_line { 'Turn off passwd auth':
  ensure => present,
  path   => '/etc/ssh/ssh_config',
  line   => '    PasswordAuthentication no',
  match  => '^[#]*\s*PasswordAuthentication\s+(yes|no)$'
}
