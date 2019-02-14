function ose {
  if [[ $# == 0 ]]; then
    echo Clearing OpenStack authentication
    unset OS_AUTH_URL
    unset OS_IDENTITY_API_VERSION
    unset OS_PROJECT_ID
    unset OS_USERNAME
    unset OS_PASSWORD
    unset OS_REGION
    unset OS_KEY_NAME
    unset OS_INTERFACE
    unset OS_NETWORK_ID
    unset OS_SECURITY_GROUPS
    unset OS_IMAGE_ID
    unset OS_FLAVOR_ID
    export OS_AUTH_URL OS_IDENTITY_API_VERSION OS_PROJECT_ID OS_USERNAME OS_PASSWORD
  else
    if [ -f ~/.openstack/credentials ]; then
      local _OS_AUTH_URL=$(parse_credentials.py $1 openstack OS_AUTH_URL)
      local _OS_IDENTITY_API_VERSION=$(parse_credentials.py $1 openstack OS_IDENTITY_API_VERSION)
      local _OS_PROJECT_ID=$(parse_credentials.py $1 openstack OS_PROJECT_ID)
      local _OS_USERNAME=$(parse_credentials.py $1 openstack OS_USERNAME)
      local _OS_PASSWORD=$(parse_credentials.py $1 openstack OS_PASSWORD)
      local _OS_REGION=$(parse_credentials.py $1 openstack OS_REGION)
      local _OS_KEY_NAME=$(parse_credentials.py $1 openstack OS_KEY_NAME)
      local _OS_INTERFACE=$(parse_credentials.py $1 openstack OS_INTERFACE)
      local _OS_NETWORK_ID=$(parse_credentials.py $1 openstack OS_NETWORK_ID)
      local _OS_SECURITY_GROUPS=$(parse_credentials.py $1 openstack OS_SECURITY_GROUPS)
      local _OS_IMAGE_ID=$(parse_credentials.py $1 openstack OS_IMAGE_ID)
      local _OS_FLAVOR_ID=$(parse_credentials.py $1 openstack OS_FLAVOR_ID)

      if [[ $_OS_AUTH_URL == "" || $_OS_IDENTITY_API_VERSION == "" || $_OS_PROJECT_ID == "" || $_OS_USERNAME == "" ]]; then
        echo No OpenStack profile found for env $1 or credentials not properly configured in ~/.openstack/credentials.
      else
        OS_AUTH_URL=$_OS_AUTH_URL
        OS_IDENTITY_API_VERSION=$_OS_IDENTITY_API_VERSION
        OS_PROJECT_ID=$_OS_PROJECT_ID
        OS_USERNAME=$_OS_USERNAME
        if [ $_OS_PASSWORD ]; then
          OS_PASSWORD=$_OS_PASSWORD
        fi
        OS_REGION=$_OS_REGION
        OS_KEY_NAME=$_OS_KEY_NAME
        OS_INTERFACE=$_OS_INTERFACE
        OS_NETWORK_ID=$_OS_NETWORK_ID
        OS_SECURITY_GROUPS=$_OS_SECURITY_GROUPS
        OS_IMAGE_ID=$_OS_IMAGE_ID
        OS_FLAVOR_ID=$_OS_FLAVOR_ID
        echo Changed OpenStack profile to: $1
        echo projectname: $OS_PROJECT_ID
        echo username: $OS_USERNAME
        echo region: $OS_REGION
        export OS_AUTH_URL OS_IDENTITY_API_VERSION OS_PROJECT_ID OS_USERNAME OS_REGION OS_KEY_NAME OS_INTERFACE OS_NETWORK_ID OS_SECURITY_GROUPS OS_IMAGE_ID OS_FLAVOR_ID
        if [ $_OS_PASSWORD ]; then
          export OS_PASSWORD
        fi
      fi
    else
      echo No OpenStack credentials found in "~/.openstack/credentials". Unable to set OpenStack environment.
    fi
  fi
}
