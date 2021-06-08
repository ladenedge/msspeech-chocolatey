Function Test-IsInstalled
{
    Param([Parameter(Mandatory=$true, Position=0)] [String] $NameLike)
    
    # x86 and x64 registry keys are different
    if ([IntPtr]::Size -eq 4) {
        $path = 'HKLM:\Software\Microsoft\Windows\CurrentVersion\Uninstall\*'
    }
    else {
        $path = @(
            'HKLM:\Software\Microsoft\Windows\CurrentVersion\Uninstall\*'
            'HKLM:\Software\Wow6432Node\Microsoft\Windows\CurrentVersion\Uninstall\*'
        )
    }

    Get-ItemProperty $path |
    .{process{ if ($_.DisplayName -and $_.UninstallString) { $_ } }} |
    Where { $_.DisplayName -like $NameLike }
}
