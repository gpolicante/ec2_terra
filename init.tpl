#!/bin/bash



installansibledeb(){


${install_debian} update &&  ${install_debian} install python-pip -y && pip install ansible  
  

}

installansibleredhat(){


${install_redhat}  install epel-release -y &&  ${install_redhat} install python-pip -y && pip install ansible 
  

}




if [ ${ostype} == "Ubuntu" ] || [ ${ostype} == "Debian" ]
 then 
   installansibledeb 


elif [ ${ostype} == "amzn" ]
then 

    installansibleredhat

else 

echo  "nada a declarar valor de ostype e ${ostype} "
    exit 

fi 
