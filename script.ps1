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
    getTodos
}

function removeTodo {
    $todo = Read-Host -prompt "Name of Completed Task"
    $id = Get-MdbcData @{todo = $todo}
    @{_id = $id._id} | Remove-MdbcData
    Write-Host "$todo Successfully Completed!"
    getTodos
}

getTodos