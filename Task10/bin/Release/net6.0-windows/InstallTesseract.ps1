$uri = "https://digi.bib.uni-mannheim.de/tesseract/tesseract-ocr-w64-setup-v5.2.0.20220712.exe"
$out = "tesseract.exe"
curl  $uri -OutFile $out
.\tesseract.exe