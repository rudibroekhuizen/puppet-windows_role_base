# == Class: windows_role_base::server-oracle
#
class windows_role_base::server-oracle {
  class { 'windows_oradb': }
}
