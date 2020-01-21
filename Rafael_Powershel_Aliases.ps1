# This is work in progress because need to export the functions properly
function RunService {
    param(
         [string]
         [Parameter(Mandatory=$true, Position=0)]
         $serviceName,
         [string[]]
         [Parameter(Position=1, ValueFromRemainingArguments)]
         $args
    )
    if ($args.count == 0) {
        $args = @("")
    }
    docker-compose.exe -f .\docker-compose.yaml run --rm $serviceName $args[0]
}

#function asess { RunService "asess" $args }
#function helm { RunService "helm" $args }
#function stern { RunService "stern" $args }
#function kubectl { RunService "kubectl" $args }
#function kubens { RunService "kubens" $args }
#function kubectx { RunService "kubectx" $args }

# These work, copy to your powershell and run them, then execute the commands 
# TODO: Implement dwd so you don't need to be in this directory for that

function asess { docker-compose.exe -f .\docker-compose.yaml run --rm asess $args }
function helm { docker-compose.exe -f .\docker-compose.yaml run --rm helm $args }
function kubectl { docker-compose.exe -f .\docker-compose.yaml run --rm kubectl $args }
function stern { docker-compose.exe -f .\docker-compose.yaml run --rm stern $args }
function kubens { docker-compose.exe -f .\docker-compose.yaml run --rm kubens $args }
function kubectx { docker-compose.exe -f .\docker-compose.yaml run --rm kubectx $args }