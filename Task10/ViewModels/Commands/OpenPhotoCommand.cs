using Microsoft.Win32;
using OpenCvSharp;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text.RegularExpressions;
using System.Threading.Tasks;
using System.Windows.Media.Imaging;

namespace Task10.ViewModels.Commands
{
    internal class OpenPhotoCommand : BaseCommand
    {
        private GaussianBlurViewModel _gaussianBlurViewModel;

        public OpenPhotoCommand(GaussianBlurViewModel gaussianBlurViewModel)
        {
            _gaussianBlurViewModel = gaussianBlurViewModel;
        }

        public async override void Execute(object? parameter)
        {
            OpenFileDialog openFileDlg = new OpenFileDialog();
            openFileDlg.Filter = "Choose video|*.mp4";

            bool? result = openFileDlg.ShowDialog();

            if (result == false)
            {
                return;
            }

            _gaussianBlurViewModel.IsSliderVisible = false;
            _gaussianBlurViewModel.IsFrameVisible = false;
            _gaussianBlurViewModel.Wrapper.set_image(openFileDlg.FileName);

            string videoFile = openFileDlg.FileName; // Specify path to MP4 video file.
            string previewFramesPath = $"Frames/PreviewFrames{_gaussianBlurViewModel.ImgsCounter}"; // Path is relative to working directory of the app
            string allFramesPath = $"Frames/AllFrames{_gaussianBlurViewModel.ImgsCounter}";
            
            _gaussianBlurViewModel.ImgsCounter++;

            try
            {
                Directory.Delete("Frames", true);
            }
            catch (Exception)
            {
            }

            Directory.CreateDirectory(previewFramesPath);
            Directory.CreateDirectory(allFramesPath);

            var capture = new VideoCapture(videoFile);
            _gaussianBlurViewModel.SliderLength = capture.FrameCount - 1;

            int gap = capture.FrameCount / 10 - 1;

            var image = new Mat();
            int i = 0;
            int j = gap - 1;

            List<string> paths = new List<string>();
            _gaussianBlurViewModel.PreviewSources.Clear();
            await Task.Run(() =>
            {
                App.Current.Dispatcher.Invoke(() => _gaussianBlurViewModel.IsImageProcessing = true);
                while (capture.IsOpened())
                {
                    // Read next frame in video file
                    capture.Read(image);
                    if (image.Empty())
                    {
                        break;
                    }

                    // Save image to disk.
                    if (i == j)
                    {
                        Cv2.ImWrite($"{previewFramesPath}\\frame{i}.jpg", image);
                        j += gap;
                    }

                    Cv2.ImWrite($"{allFramesPath}\\frame{i}.jpg", image);
                    paths.Add($"{allFramesPath}\\frame{i}.jpg");

                    i++;
                }
                App.Current.Dispatcher.Invoke(() => _gaussianBlurViewModel.IsImageProcessing = false);
            });

            _gaussianBlurViewModel.Paths = paths;

            var sliderImages = Directory.GetFiles(previewFramesPath).OrderBy(x => Int32.Parse(Regex.Match(x, @"\d+").Value)).ToArray();
            for (int k = 0; k < sliderImages.Length; k++)
            {
                var img = new BitmapImage();
                img.BeginInit();
                img.UriSource = new System.Uri(sliderImages[k], UriKind.Relative);
                img.CacheOption = BitmapCacheOption.OnLoad;
                img.EndInit();
                img.Freeze();

                _gaussianBlurViewModel.PreviewSources.Add(img);
            }

            _gaussianBlurViewModel.EndFrame = _gaussianBlurViewModel.SliderLength - 1;
            _gaussianBlurViewModel.CurrentFrame = 0;
            _gaussianBlurViewModel.IsSliderVisible = true;
            _gaussianBlurViewModel.IsFrameVisible = true;

            await Task.Run(() =>
            {
                _gaussianBlurViewModel.Wrapper.start_render();
                _gaussianBlurViewModel.RenderStatus();
            });

            //_gaussianBlurViewModel.ImagePath = paths[0];
        }
    }
}
