# Powershell
# ���� mStream ����
#------------------------------------------------
# ����ִ��ʾ����
# ./run.ps1 -u admin -p admin123 -i 1000 -g 1000
#------------------------------------------------

param(
    [string]$u = "admin",
    [string]$p = "admin123",
    [string]$i = "1000",
    [string]$g = "1000"
)

$ENV:username=${u}; `
$ENV:password=${p}; `
$ENV:uid=${i}; `
$ENV:gid=${g}; `
docker-compose up -d
