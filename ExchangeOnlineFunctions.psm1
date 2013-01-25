# .SYNOPSIS
#
# Provides helper functions to manage Exchange Online
#
# .NOTES
#
# This module is licensed under the Apache License, Version 2.0.
# http://www.apache.org/licenses/LICENSE-2.0


function New-SharedMailbox($Alias = (Read-Host -Prompt "Shared Mailbox Alias"),
                           $DisplayName = (Read-Host -Prompt "Shared Mailbox Display Name"))
{
    # .SYNOPSIS
    #
    # Creates a new shared mailbox

    if (!$Alias)
    {
        Write-Error "No alias specified."
        return
    }

    if (!$DisplayName)
    {
        Write-Error "No display name specified."
        return
    }

    New-Mailbox -Name $DisplayName -Alias $Alias -Shared

    Set-Mailbox $Alias -ProhibitSendReceiveQuota 5GB `
                       -ProhibitSendQuota 4.75GB `
                       -IssueWarningQuota 4.5GB
}
