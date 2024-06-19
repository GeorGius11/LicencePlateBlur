using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.IO;
using System.Threading.Tasks;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using Task10.ViewModels.Commands;
using Wrappers;

namespace Task10.ViewModels
{
    internal class GaussianBlurViewModel : BaseViewModel
    {
        private bool _isImageProcessing;
        private bool _isSliderVisible;
        private bool _isFrameVisible = true;
        private bool _isBluring;

        private int _sliderLength = 100;
        private int _currentFrame = 0;
        private int _renderValue = 0;
        private int _endFrame = 800;

        private string _imagePath = string.Empty;
        private string _renderProgress;
        
        private ImageSource _sourceImage;


        public int ImgsCounter = 0;
        public bool IsImageProcessing { get => _isImageProcessing; set { SetProperty(ref _isImageProcessing, value); } }
        public bool IsSliderVisible { get => _isSliderVisible; set { SetProperty(ref _isSliderVisible, value); } }
        public bool IsFrameVisible { get => _isFrameVisible; set { SetProperty(ref _isFrameVisible, value); } }

        public int SliderLength { get => _sliderLength; set { SetProperty(ref _sliderLength, value); } }
        public int EndFrame { get => _endFrame; set { SetProperty(ref _endFrame, value); } }
        public int RenderValue { get => _renderValue; set { SetProperty(ref _renderValue, value); } }

        public string ImagePath { get => _imagePath; set { SetProperty(ref _imagePath, value); } }
        public string RenderProgress { get => _renderProgress; set { SetProperty(ref _renderProgress, value); } }
        
        public Wrapper Wrapper { get; set; }
        public List<string> Paths { get; set; }
        public ObservableCollection<BitmapImage> PreviewSources { get; set; }
        public ImageSource SourceImage { get => _sourceImage; set { SetProperty(ref _sourceImage, value); } }

        public ICommand OpenPhotoCommand { get; set; }
        public ICommand SavePhotoCommand { get; set; }

        public int CurrentFrame
        {
            get
            {
                return _currentFrame;
            }
            set
            { 
                IsImageProcessing = false;
                _isBluring = false;
                _currentFrame = value;
                ImagePath = Path.Combine(AppDomain.CurrentDomain.BaseDirectory, Paths[_currentFrame]);
            }
        }

        public GaussianBlurViewModel()
        {
            Wrapper = new Wrapper();
            OpenPhotoCommand = new OpenPhotoCommand(this);
            SavePhotoCommand = new SavePhotoCommand(this);
            PreviewSources = new ObservableCollection<BitmapImage>();
            Paths = new List<string>();
            
            Wrapper.init();
        }

        public async void UpdateImage()
        {
            IsImageProcessing = true;
            _isBluring = true;
            await Task.Run(() =>
            {
                Wrapper.create_stream(CurrentFrame);
            });
            if (!_isBluring)
            {
                return;
            }
            await Task.Run(() =>
            {
                CreateImage(Wrapper.buffer());   
            });
            IsImageProcessing = false;
        }

        public async void RenderStatus()
        {
            do
            {
                await Task.Delay(50);
                RenderValue = (int)(Wrapper.rendering_progress() * 100);
                RenderProgress = $"Render: {Convert.ToString(RenderValue)}%";
                if (Wrapper.done_rendering())
                {
                    RenderProgress = $"Render: 100%";
                    RenderValue = 100;
                    return;
                }
            }
            while (!Wrapper.done_rendering());
        }

        public void CreateImage(byte[] arr)
        {
            var pixelFormat = PixelFormats.Rgb24;
            var bytesPerPixel = (pixelFormat.BitsPerPixel + 7) / 8;
            var stride = bytesPerPixel * Wrapper.cols;

            if (!_isBluring)
            {
                return;
            }

            var image = BitmapSource.Create(Wrapper.cols, Wrapper.rows, 96d, 96d, pixelFormat, null, arr, stride);
            
            if (!_isBluring)
            {
                return;
            }
            
            SourceImage = image;

            BitmapEncoder encoder = new PngBitmapEncoder();
            encoder.Frames.Add(BitmapFrame.Create(SourceImage as BitmapSource));
            
            if (!_isBluring)
            {
                return;
            }

            //File.Delete(Path.Combine(AppDomain.CurrentDomain.BaseDirectory, "Preview.png"));
            Directory.CreateDirectory(Path.Combine(AppDomain.CurrentDomain.BaseDirectory, $"Frames/Preview"));
            using (var fileStream = new System.IO.FileStream(Path.Combine(AppDomain.CurrentDomain.BaseDirectory, $"Frames/Preview/PreviewImages{ImgsCounter}.jpg"), System.IO.FileMode.Create))
            {
                encoder.Save(fileStream);
            }
            
            if (!_isBluring)
            {
                return;
            }

            ImagePath = Path.Combine(AppDomain.CurrentDomain.BaseDirectory, $"Frames/Preview/PreviewImages{ImgsCounter}.jpg");
            ImgsCounter++;
        }
    }
}