# == Class: windows_role_base::workstation
#
class windows_role_base::workstation {
  class { 'windows_burp': }
  class { 'filebeat': }
}
