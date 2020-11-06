#!/bin/bash

################################################################################
# Help                                                                         #
################################################################################
Help()
{
   # Display Help
   echo "Create Dart Clean Architecture structure"
   echo
   echo "Usage: ./create.sh [-h]"
   echo "options:"
   echo "-h                                 Print this Help."
   echo "-m {module name}                   Generate a module."
   echo "-u {module name} {usecase name}    Generate a usecase."
   echo "-"
   echo "Example: ./create.sh -m login"
   echo "Example: ./create.sh -u login add_user"
   echo
}
################################################################################
# Module                                                                       #
################################################################################
Module()
{
    echo "Module: $m"

    mkdir -p lib/modules/$m/domain/entities
    mkdir -p lib/modules/$m/domain/errors
    mkdir -p lib/modules/$m/domain/repositories
    mkdir -p lib/modules/$m/domain/usecases
    
    mkdir -p lib/modules/$m/external
    mkdir -p lib/modules/$m/external/datasources

    mkdir -p lib/modules/$m/infra/datasources
    mkdir -p lib/modules/$m/infra/models
    mkdir -p lib/modules/$m/infra/repositories
    mkdir -p lib/modules/$m/infra/datasources

    mkdir -p lib/modules/$m/ui/page
    
    mkdir -p test/modules/$m/domain/usecases
    mkdir -p test/modules/$m/external/datasource
    mkdir -p test/modules/$m/infra/repositories
    
}
################################################################################
# Usecase                                                                      #
################################################################################
Usecase()
{
    Module

    echo "Usecase: ${m}_${u}.dart"
    
    touch lib/modules/$m/domain/usecases/$u.dart
    touch test/modules/$m/domain/usecases/$u.dart
}
################################################################################
# Process the input options. Add options as needed.                            #
################################################################################
# Get the options
while getopts ":h:m:u" option; do
   case $option in
      h) # display Help
         Help
         exit;;
      u) # usecase
         m=$2
         u=$3
         Usecase
         exit;;
      m) # module
         m=$OPTARG
         Module
         exit;;
     \?) # incorrect option
         echo "Error: Invalid option"
         exit;;
   esac
done
################################################################################
# Program                                                                      #
################################################################################
Help