$Path = '.\Bin\NVIDIA-Enemy\ccminer.exe'
$Uri = 'https://github.com/Enemy-Mine/ccminer/releases/download/v1.03-RVN/ccminer.zip'

$Name = (Get-Item $script:MyInvocation.MyCommand.Path).BaseName

$Algorithms = [PSCustomObject]@{
    #Lyra2z = 'lyra2z'
    #Equihash = 'equihash' #not supported
    #Cryptonight = 'cryptonight'
    #Ethash = 'ethash' #not supported
    #Sia = 'sia'
    #Yescrypt = 'yescrypt'
    #BlakeVanilla = 'vanilla'
    #Lyra2RE2 = 'lyra2v2'
    #Skein = 'skein'
    #Qubit = 'qubit'
    #NeoScrypt = 'neoscrypt'
    #X11 = 'x11'
    #MyriadGroestl = 'myr-gr'
    #Groestl = 'groestl'
    #Keccakc = 'keccakc'
    #Scrypt = 'scrypt'
    #Bitcore = 'bitcore'
    #Blake2s = 'blake2s'
    #Sib = 'sib'
    X16R = 'x16r'
    X17 = 'x17'
    #Quark = 'quark'
    #Hmq1725 = 'hmq1725'
    #Veltor = 'veltor'
    #X11evo = 'x11evo'
    #Timetravel = 'timetravel'
    #Blakecoin = 'blakecoin'
    #Lbry = 'lbry'
    #Jha = 'jha'
    #Skunk = 'skunk'
    #Tribus = 'tribus'
    #Phi = 'phi'
    #Hsr = 'hsr'
}

$Optimizations = [PSCustomObject]@{
    Lyra2z = ' --api-remote --api-allow=0/0'
    Equihash = ''
    Cryptonight = ' --api-remote --api-allow=0/0'
    Ethash = ''
    Sia = ''
    Yescrypt = ''
    BlakeVanilla = ''
    lyra2v2 = ' -i 19'
    Skein = ''
    Qubit = ''
    NeoScrypt = ' -i 19'
    X11 = ''
    MyriadGroestl = ''
    Groestl = ''
    Keccakc = ''
    Scrypt = ''
    Bitcore = ' --api-remote --api-allow=0/0'
    Blake2s = ''
    Sib = ''
    X17 = ' -i 20'
    X16R = ''
    Quark = ''
    Hmq1725 = ' --api-remote --api-allow=0/0'
    Veltor = ''
    X11evo = ''
    Timetravel = ' --api-remote --api-allow=0/0'
    Blakecoin = ''
    Lbry = ''
    Jha = ' --api-remote --api-allow=0/0'
    Skunk = ' --api-remote --api-allow=0/0'
    Tribus = ' --api-remote --api-allow=0/0'
    Phi = ' --api-remote --api-allow=0/0'
    Hsr = ' --api-remote --api-allow=0/0'
    
}

$Algorithms | Get-Member -MemberType NoteProperty | Select -ExpandProperty Name | ForEach {
    [PSCustomObject]@{
        Type = 'NVIDIA'
        Path = $Path
        Arguments = -Join ('-a ', $Algorithms.$_, ' -o stratum+tcp://$($Pools.', $_, '.Host):$($Pools.', $_, '.Port) -u $($Pools.', $_, '.User) -p $($Pools.', $_, '.Pass)', $Optimizations.$_)
        HashRates = [PSCustomObject]@{$_ = -Join ('$($Stats.', $Name, '_', $_, '_HashRate.Week)')}
        API = 'Ccminer'
        Port = 4068
        Wrap = $false
        URI = $Uri
    }
}
