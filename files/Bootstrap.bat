rem cmd

rem Set parameters
set PuppetPath=C:\ProgramData\PuppetLabs\puppet\etc

rem Install Chocolatey, get this script from https://chocolatey.org/
call cmd /c @powershell -NoProfile -ExecutionPolicy unrestricted -Command "iex ((new-object net.webclient).DownloadString('https://chocolatey.org/install.ps1'))" && SET PATH=%PATH%;%ALLUSERSPROFILE%\chocolatey\bin

rem Install packages
call choco install poshgit -y
call choco install puppet --version 3.8.3 -y
call choco install curl -y
call choco install wget -y

rem Set Puppet and Ruby path, get this from Start Command Prompt with Puppet, echo %path% > path.txt
call SET PATH=%PATH%;C:\Program Files\Puppet Labs\Puppet\puppet\bin;C:\Program Files\Puppet Labs\Puppet\facter\bin;C:\Program Files\Puppet Labs\Puppet\hiera\bin;C:\Program Files\Puppet Labs\Puppet\bin;C:\Program Files\Puppet Labs\Puppet\sys\ruby\bin;C:\Program Files\Puppet Labs\Puppet\sys\tools\bin;C:\Windows\system32;C:\Windows;C:\Windows\System32\Wbem;C:\Windows\System32\WindowsPowerShell\v1.0\;C:\ProgramData\chocolatey\bin;C:\Program Files\Git\cmd;C:\Program Files (x86)\Git\cmd;C:\Program Files\Puppet Labs\Puppet\bin 

rem Create custom fact to set data source (hiera yaml file)
rem SET FACTER_env_windows_installdir=%PL_BASEDIR%
call puppet apply -e "file { 'c:/ProgramData/PuppetLabs/facter/facts.d/data_source.txt': content => 'data_source=%1' }"

rem Install GeoTrust certificate to download modules from Puppetforge, see https://docs.puppetlabs.com/windows/troubleshooting.html#error-messages
call wget --no-check-certificate https://www.geotrust.com/resources/root_certificates/certificates/GeoTrust_Global_CA.pem
call certutil -addstore Root GeoTrust_Global_CA.pem

rem Install AddTrust certificate, see https://gist.github.com/luislavena/f064211759ee0f806c88
rem not needed with ruby 2.1.0, needed with 2.0.0
rem call wget --no-check-certificate https://raw.githubusercontent.com/rubygems/rubygems/master/lib/rubygems/ssl_certs/AddTrustExternalCARoot-2048.pem
rem call copy AddTrustExternalCARoot-2048.pem "C:\Program Files\Puppet Labs\Puppet\sys\ruby\lib\ruby\2.0.0\rubygems\ssl_certs"

rem Install r10k
call gem.bat install r10k --no-rdoc --no-ri

rem Download Puppetfile
call curl -k https://raw.githubusercontent.com/rudibroekhuizen/puppet-windows_role_base/master/files/Puppetfile > %PuppetPath%\Puppetfile

rem Run r10k to download modules
cd %PuppetPath%
call r10k --verbose 3 puppetfile install

rem Copy hiera.yaml (hiera config file)
call copy %PuppetPath%\modules\windows_base\files\hiera.yaml C:\ProgramData\PuppetLabs\hiera\etc

rem Copy yaml files (userdata)
call copy %PuppetPath%\modules\windows_role_base\files\*.yaml C:\ProgramData\PuppetLabs\hiera\var

rem Apply base module
puppet apply -e 'include windows_base'

rem Apply additional modules
puppet apply -e 'hiera_include('classes')'
