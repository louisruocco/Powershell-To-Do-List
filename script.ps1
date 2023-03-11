Import-Module mdbc
Connect-Mdbc . todolist todos

function getTodos {
    $todos = Get-MdbcData
    if($todos -eq $null){
        Write-Host "No Tasks added"
    } else {
        write-host $todos.todo | Format-List
    }
}

function addTodo {
    $todo = Read-Host -prompt "Add Task here"
    @{todo = $todo} | Add-MdbcData
    Write-Host "$todo Successfully Added!"
}

getTodos