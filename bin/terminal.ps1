# Powershell
#------------------------------------------------
# 进入容器的交互终端
# bin\terminal.ps1
#------------------------------------------------

# 获取容器列表

$CONTAINER_LIST = docker ps --format "{{.ID}}\t{{.Names}}\t{{.Status}}\t{{.Ports}}"


# 打印容器列表，并对容器打上编号

Write-Host "Select a container to enter:"
$CONTAINER_LIST | ForEach-Object { $_ -replace "`t", " " } | ForEach-Object { $i=0 } { ++$i; "$i. $_" }


# 读取用户选择的容器编号

$NUMBER = Read-Host "Enter a number (0 for exit):"


# 根据用户选择的容器编号获取容器ID

$CONTAINER_ID = ($CONTAINER_LIST | Select-Object -Skip 1)[$NUMBER-1].Substring(0, 12)


# 进入容器终端

if ($CONTAINER_ID) {
    docker exec -it $CONTAINER_ID /bin/bash
} else {
    Write-Host "Invalid container number."
}
