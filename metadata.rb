maintainer        "William Roe"
maintainer_email  "willroe@gmail.com"
license           "Apache 2.0"
description       "Installs golang."
long_description  IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version           "0.0.1"

%{ ubuntu }.each do |os|
  supports os
end
