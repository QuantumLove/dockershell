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
function asess { RunService "asess" $args }
function helm { RunService "helm" $args }
function kubectl { RunService "kubectl" $args }
function stern { RunService "stern" $args }

# These work
function asess { docker-compose.exe -f .\docker-compose.yaml run --rm asess $args }
function helm { docker-compose.exe -f .\docker-compose.yaml run --rm helm $args }
function kubectl { docker-compose.exe -f .\docker-compose.yaml run --rm kubectl $args }
function stern { docker-compose.exe -f .\docker-compose.yaml run --rm stern $args }