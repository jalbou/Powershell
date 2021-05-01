Connect-VIServer

## folder in which to put the registered template
$strMyFolderName = "Templates"
## host on which to register the template
$strMyHostName = "192.168.1.103"
## the datastore path to the .vmtx file
$strMyTemplateDatastorePath = "[SYNO-2] Ubuntu Template/Ubuntu Template.vmtx"
## get the .NET View object for the destination folder
$viewDestinationFolder = Get-View -ViewType Folder -Property Name -Filter @{"Name" = $strMyFolderName}
## register the template (third param of $true means to register as template) -- reference:  http://pubs.vmware.com/vsphere-50/index.jsp?topic=/com.vmware.wssdk.apiref.doc_50/vim.Folder.html&pa...
$viewDestinationFolder.RegisterVM_Task($strMyTemplateDatastorePath, "UbuntuTemplate", $true, $null, (Get-View -ViewType HostSystem -Property Name -Filter @{"Name" = $strMyHostName}).MoRef)