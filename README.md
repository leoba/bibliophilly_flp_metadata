# bibliophilly_flp_metadata
Instructions and scripts for populating BiblioPhilly spreadsheets with data from FLP manuscript descriptions in Microsoft Word

1. Convert doc files to docx using LibreOffice on the command line (go to LibreOffice in Applications in the MacOS folder then `./soffice --headless --convert-to docx --outdir /Users/[username]/Documents/BiblioPhilly/metadata/FLP/docx /Users/[username]/Documents/BiblioPhilly/metadata/FLP/doc/\*.doc`). Don’t use `textutil` because that doesn’t create the **styles.xml** file required by Oxgarage. They will be saved in directory **docx**.
2. Remove spaces from docx filenames using Automator.
3. Run **docx2tei.sh** to convert docx files to TEI-XML using Oxgarage. They will be saved with the extension .xml in directory docx. Move the xml files to new folder tei. Don’t delete the docx files as you may need them later.
4. Run **strip-hi.xsl** on all XML files in directory tei to strip out all the `hi` tags (these will break the other conversions so we need to get them all out). These files will be renamed with extension **-clean.xml** and will be saved in directory **clean**.
5. Move the page level XML files to directory **clean-pages**.
6. Run **xml-illustrations.xsl** on all page level XML files in directory **clean-pages**. These files will be renamed with extension **-small.xml** and will be saved in directory **illus**
7. Run **pull-illustrations.xsl** on manuscript parent files in directory clean to pull illustrations from the illus files into the manuscript files. These files will be renamed with extension **-final.xml** and will be saved in directory **final**.
8. Run **word2csv.xsl** over **FLP/empty.xml** to generate the source CSV: **flp-mss-metadata.csv** for the manuscripts and **flp-page-metadata.csv** for the pages.
9. Run the two vbscripts to populate the BiblioPhilly Spreadsheet template with values from the source CSV files.
