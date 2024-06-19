using System.IO;
using System.Windows;

namespace Task10.Helpers
{
    class StartupSettings
    {
        public static void InstallTesseract()
        {

            string path = @"C:\Program Files\Tesseract-OCR\tessdata";
            if (Directory.Exists(path))
            {
                return;
            }

            MessageBox.Show("Run the InstallTesseract.ps1 script in App folder in order to download a " +
                "file which is needed to run the Neural Network(License plates recognizer). Install it in C:\\Program Files\\Tesseract-OCR");
            App.Current.Shutdown();

        }
    }
}
