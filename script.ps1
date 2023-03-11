Import-Module mdbc
Connect-Mdbc . todolist todos

function getTodos {
    $todos = Get-MdbcData
    if($todos -eq $null){
        Write-Host "No Tasks added"
    } else {
        write-host $todos
    }
}

getTodos