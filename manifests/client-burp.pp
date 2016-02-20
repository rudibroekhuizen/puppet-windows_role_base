# == Class: windows_role_base::client-burp
#
class windows_role_base::client-burp {
  class { 'windows_burp': }
}
