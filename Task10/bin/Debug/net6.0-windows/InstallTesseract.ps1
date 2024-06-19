$uri = "https://digi.bib.uni-mannheim.de/tesseract/tesseract-ocr-w64-setup-v5.2.0.20220712.exe"
$out = "$env:TEMP\tesseract.exe"
curl  $uri -OutFile $out
.$out | Out-Null