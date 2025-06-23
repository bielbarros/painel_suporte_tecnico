$drives = Get-PSDrive -PSProvider 'FileSystem' | Select-Object Name, Used, Free
return $drives
