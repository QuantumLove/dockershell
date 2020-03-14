# This is work in progress because need to export the functions properly
# function RunService {
#     param(
#          [string]
#          [Parameter(Mandatory=$true, Position=0)]
#          $serviceName,
#          [string[]]
#          [Parameter(Position=1, ValueFromRemainingArguments)]
#          $args
#     )
#     if ($args.count == 0) {
#         $args = @("")
#     }
#     docker-compose.exe -f $PSScriptRoot\docker-compose.yaml run --rm $serviceName $args[0]
# }

# function asess { RunService "asess" $args }
# Export-ModuleMember -Function 'asess'
# function helm { RunService "helm" $args }
# Export-ModuleMember -Function 'helm'
# function stern { RunService "stern" $args }
# Export-ModuleMember -Function 'stern'
# function kubectl { RunService "kubectl" $args }
# Export-ModuleMember -Function 'kubectl'
# function kubens { RunService "kubens" $args }
# Export-ModuleMember -Function 'kubens'
# function kubectx { RunService "kubectx" $args }
# Export-ModuleMember -Function 'kubectx'

# These work, copy to your powershell and run them, then execute the commands 
# TODO: Implement dwd so you don't need to be in this directory for that

function asess { 
    $Env:CWD = $PWD.Path
    docker-compose.exe -f $PSScriptRoot\docker-compose.yaml run --rm asess $args; 
}
Export-ModuleMember -Function 'asess'
function helm { docker-compose.exe -f $PSScriptRoot\docker-compose.yaml run --rm helm $args }
function kubectl { docker-compose.exe -f $PSScriptRoot\docker-compose.yaml run --rm kubectl $args }
function stern { docker-compose.exe -f $PSScriptRoot\docker-compose.yaml run --rm stern $args }
function kubens { docker-compose.exe -f $PSScriptRoot\docker-compose.yaml run --rm kubens $args }
function kubectx { docker-compose.exe -f $PSScriptRoot\docker-compose.yaml run --rm kubectx $args }