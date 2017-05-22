Option Explicit
Dim objExcel, strExcelPath, objSheet, objList, strListPath, objListSheet, i
strExcelPath = "c:\Users\dorp\Desktop\BibPhilly_spreadsheet.xlsx"
strListPath = "c:\Users\dorp\Desktop\flp-mss-metadata.xlsx"

'First, Manuscript-level metadata 
'Open specified spreadsheets and select the appropriate worksheet.
Set objExcel = CreateObject("Excel.Application")
objExcel.WorkBooks.Open strExcelPath
Set objSheet = objExcel.ActiveWorkbook.Worksheets(1)

Set objList = CreateObject("Excel.Application")
objList.WorkBooks.Open strListPath
Set objListSheet = objList.ActiveWorkbook.Worksheets(1)

' I'm going to try setting a Loop starting here down to SaveAs

For i = 2 To 360

' Set values for field variables

Dim institution, callNo, callNoClean, msName, deRicci, author, lang, material, location, msDate, script, decoration, physDesc, binding, provenance

institution = "Free Library of Philadelphia"
callNo = objListSheet.Cells(i,1)
callNoClean = Replace(Replace(Replace(callNo,"/","-"),",","-")," ","")
msName = objListSheet.Cells(i,2)
deRicci = objListSheet.Cells(i,3)
author = objListSheet.Cells(i,4)
lang = objListSheet.Cells(i,5)
material = objListSheet.Cells(i,6)
location = objListSheet.Cells(i,7)
msDate = objListSheet.Cells(i,8)
script = objListSheet.Cells(i,9)
decoration = objListSheet.Cells(i,10)
physDesc = objListSheet.Cells(i,11)
binding = objListSheet.Cells(i,12)
provenance = objListSheet.Cells(i,13)

' Modify a cell.
objSheet.Cells(16, 4).Value = institution
objSheet.Cells(19, 4).Value = callNo
objSheet.Cells(27, 4).Value = msName
objSheet.Cells(25, 4).Value = deRicci
objSheet.Cells(26, 4).Value = "deRicci"
objSheet.Cells(28, 4).Value = author
objSheet.Cells(43, 4).Value = lang
objSheet.Cells(57, 4).Value = material
objSheet.Cells(39, 4).Value = location
objSheet.Cells(38, 4).Value = msDate
objSheet.Cells(48, 4).Value = script
objSheet.Cells(49, 4).Value = decoration
objSheet.Cells(42, 4).Value = physDesc
objSheet.Cells(50, 4).Value = binding
objSheet.Cells(55, 4).Value = provenance
objSheet.Cells(15, 4).Value = "Philadelphia"

'Second, page-level metadata experiment
'Open specified spreadsheets and select the appropriate worksheet.
'I need to figure out how to work down both the CSV file and the second worksheet and match the folio numbers and insert the content in the right place

Dim objPage, strPagePath, objPageSheet, x

Set objSheet = objExcel.ActiveWorkbook.Worksheets(2)

Set objPage = CreateObject("Excel.Application")
objPage.WorkBooks.Open strPagePath
Set objPageSheet = objPage.ActiveWorkbook.Worksheets(1)

For x = 1000

'set values for field variables

Dim msID, fol-no, image-title

msID = objPageSheet.Cells(x, 1)
fol-no = objPageSheet.Cells(x, 2)
image-title = objPageSheet.Cells(x, 3)

IF InStr(callNoClean, msID) <> 0

IF

Next
' Save and quit.
objExcel.ActiveWorkbook.SaveAs "C:\Users\dorp\Desktop\BiblioPhilly-spreadsheets\" & "FLP" & callNoClean & ".xlsx"

Next

objExcel.ActiveWorkbook.Close
objExcel.Application.Quit