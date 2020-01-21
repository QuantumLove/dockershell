$manifest = @{
    Path              = '.\dockershell.psd1'
    RootModule        = 'dockershell.psm1' 
    Author            = 'QuantumLove'
}
New-ModuleManifest @manifest