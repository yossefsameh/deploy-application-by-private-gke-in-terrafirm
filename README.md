##   using terraform to build infrastructure in GCP

###  infrastructure

####         1- create vpc with allow ssh and http firewall                              
         
         
####         2- create 2 subnets (management and restricted)      
          
          
####         3- apply nat to both subnet                                        
         
           
####         4- create 2 service accounts (one with container.admin role and other with storage.admin role
          
          
####         5- create private instance in management subnet with service account (container.admin)


####         6- create standard gke with service account (storage.admin) acceced only by managment subnet CIDR
        

###  connect to cluster from instance


####          1- ssh to my private instance     
 
                    
####          2- install kubectl    
![Screenshot 2022-11-15 135115](https://user-images.githubusercontent.com/43928828/202166287-443b590e-e759-41d6-91a2-4fd6367fc7a1.png)     
          
          
####          3- (optional) use gcloud init to choose my vm service account (which already chosen by terraform)   
 ![Screenshot 2022-11-15 134639](https://user-images.githubusercontent.com/43928828/202166463-56422e5a-3e53-48ef-a704-74270c3d10fc.png)

          
          
####          4- connect to cluster from instance

 ![Screenshot 2022-11-16 161924](https://user-images.githubusercontent.com/43928828/202240797-9c42c97a-40f5-429c-b934-91ab14ebcf2c.png)
 
          
####          5- check pods    
 ![Screenshot 2022-11-15 135523](https://user-images.githubusercontent.com/43928828/202166509-59cfb445-7795-4e4d-afd3-830b5a6ea330.png)


###  jenkins deployment


####          1- install kubectl and docker using init containers in jenkins deployment file
          
          
####          2- use my custum image which i built from dockerfile
         
         
####          3- get into container and install gcloud and use vm service account
![Screenshot 2022-11-16 163243](https://user-images.githubusercontent.com/43928828/202241089-27bc706b-4a73-4e3d-b1dc-af4ea37b9282.png)

 
          
          
### app delpoyment
(https://github.com/yossefsameh/dockerize-application-by-jenkins/tree/master/)

